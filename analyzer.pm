#!/usr/bin/env perl
#use Proc::ProcessTable;
package analyzer;
use IPC::Open3;
use Symbol qw(gensym);
use IO::File;
use Getopt::Long;
use File::Basename;
#use Proc::Killfam;
use Time::HiRes qw (sleep usleep);
use IPC::Run qw( run timeout );

use FindBin qw($RealBin);
use lib "$RealBin";
use Prover::GenericSMT;
use Prover::SPASSSPL;
use Prover::Vampire;
use Prover::dispatch;

use strict;
use warnings;

#SOME warnings:
# - IPC::Run tries very hard to parse the command passed as argument. Therefore, it
# can delete files if there are spaces.

sub analyze_run {

    my ($prover_path, $option, $problem, $CPU_limit, $extension, $log, $max_memory) = @_;
    
    #my $log = 0;
    my $script_start_time = time( );
    #my $max_memory = 5;
    
    
    # initialisation of variables
    #general
    # my $signal = SIGKILL;
    # my $wallclock_limit = 2 * $CPU_limit;
    my $killed = 0;
    
    my $log_path;
    my $logfile;
    my $prover = basename($prover_path);
    
    #TODO check if this works $log_path = "$mpipath/logs/analyzer_log";
    $log_path = "logs/analyzer_log";
    
    if($log > 0) {
	open($logfile, ">>", $log_path)
	    or die "Cannot open > $log_path: $!";
    }
    
    #to know on which machine the program is run:
    printAtLogLevel($problem,$logfile,$log,1, `uname -a`,$script_start_time);
    
    my $analyzer = Prover::dispatch::create_dispatcher($extension, $prover);
    
    if(!$analyzer) {
	die "no analyzer created, extension = $extension, prover = $prover";
    }
    
    $analyzer->analyze_problem($problem);
    
    my ($vsize_suf, $rss_suf);
    
    #general cont.
    my $umax_memory = $max_memory * 1_000_000; # (kbytes)
    my $umax_data_seg = $max_memory * 1_000_000; # (kbytes)
    my $umax_memory_RAM = $max_memory * 1_000_000; # (kbytes)
    my $max_time;
    my $ulimit_time;
    if (defined $CPU_limit) {
	$max_time = $CPU_limit + 10;
	$ulimit_time = "ulimit -t $max_time ;";
    } else {
	$ulimit_time = ""
    }
    
    my $ulimit = $ulimit_time . "ulimit -v $umax_memory ; ulimit -d $umax_data_seg ; ulimit -m $umax_memory_RAM ; ";
    my $time_command =  "/usr/bin/time --quiet -f \"c TIME: \t Maximum resident set size: %M, real time: %e, user time: %U, system time: %S\" ";
    my $command = $prover_path . " " . $option . " " . $problem;
    #print "profile = $profile";
    
    printAtLogLevel($problem,$logfile,$log,7, "starting problem",$script_start_time);
    printAtLogLevel($problem,$logfile,$log,8, "with $ulimit; $command",$script_start_time);
    
    my $start_time = time( );

    $command =~ s/\s+/ /g;
    my (@command) = ("sh", "-c", $ulimit . $time_command . $command); #(split / /, $command);
    
    #preallocating
    
    my $run_failed = 0;
    my $out = "x" x 10_000_000;
    my $status;
    my $err = "x" x 10_000_000;
    $out = "";
    $err = "";
    eval {
	#printAtLogLevel($problem,$logfile,1, "length of problem " . `wc -l $problem` . "\n");
	my $error = run \@command, \undef, \$out, \$err, timeout($CPU_limit)
	or die "run failed";
	$status = $?;
    };
    if(($? >> 8) == 20 || ($? >> 8) == 10) {#standard return code from SAT solvers
	$status = $?;
	printAtLogLevel($problem,$logfile,$log,7, "solver finished",$script_start_time);
    }
    elsif($@ =~ /run failed/) {
	$status = $?;
	$run_failed = 1;
	printAtLogLevel($problem,$logfile,$log,7, "solver returned non-zero $@ and status: $status",$script_start_time);
    }
    elsif($@) {
	$killed = 1;
	$status = $?;
	printAtLogLevel($problem,$logfile,$log,7, "solver KILLED $@",$script_start_time);
    } else {
	$status = $?;
	printAtLogLevel($problem,$logfile,$log,7, "solver finished",$script_start_time);
    }

    my $wallclocktime;
    my $CPU_time;
    ($wallclocktime, $CPU_time) = &times ($start_time);
    
    # some useful information
    #$exit_value = $status >> 8;
    my $signal_num = $status & 127;
    my $dumped_core = $status & 128;
    
    #give an idea of the time required even in case of crashs
    $analyzer->overall_time ($wallclocktime);
    
    foreach my $line (split /\n/, $out)
    {
	# push @lines, $line;
    printAtLogLevel($problem,$logfile,$log,7, "output: $line\n",$script_start_time);
    $analyzer->analyze_output($line);
    }
    
    if ($killed == 1){
	$analyzer->set_timeout();
    }
    
    if ($dumped_core || $run_failed) {
	print "dump_core\n";
	$analyzer->add_core_dump();
    }
    
    
    printAtLogLevel($problem,$logfile,$log,7, "Error:\n $err",$script_start_time);
    $analyzer->analyze_errors($err);
    
    
    if ($signal_num != 0 && $killed == 0)
    {
	$analyzer->add_signal($signal_num);
    }

    printAtLogLevel($problem,$logfile,$log,8, "output parsed",$script_start_time);
    printAtLogLevel($problem,$logfile,$log,8, "result:" . $analyzer->result,$script_start_time);
    
    printAtLogLevel($problem,$logfile,$log,7, $analyzer->result_string($problem),$script_start_time);
    
    printAtLogLevel($problem,$logfile,$log,7, "output results",$script_start_time);
    
    # TODO output results
    my ($solver_problem, $solver_result, $solver_maxtpsize, $solver_sizehconj, $solver_overall_time, $solver_error_msg) = $analyzer->result_array($problem);
    
    printAtLogLevel($problem,$logfile,$log,7, "results written, now cleaning",$script_start_time);
    if($log > 0) {
	close $logfile;
    }
    #if ($ge_mode){ &unlink_taskfile }
    return ($solver_problem, $solver_result, $solver_maxtpsize, $solver_sizehconj, $solver_overall_time, $analyzer->max_memory, $solver_error_msg);
}

sub min
{
    my ($a, $b) = @_;
    return ($a > $b ? $b : $a);
}

sub times
{
    my ($start_time) = @_;
    my $wallclocktime = time( );
    $wallclocktime -= $start_time;
#    $process_table = new Proc::ProcessTable;
#    $table_ref = $process_table -> table;
#    $table_size = @{$table_ref};
#    for ($iter = 0; $iter < $table_size && ${$table_ref}[$iter]->pid != $pid; $iter++){	
	#`echo "$problem times $iter, $table_size, ${$table_ref}[$iter]->pid" >> $mpipath/../logs/$table\_pb`;
#    }
#    if ($iter == @{$table_ref}) #$pid was not in the table
#    {
	return ($wallclocktime, -1);
#    }
#    else
#    {
#	return ($wallclocktime, ${$table_ref}[$iter] -> time);
#    }
}

sub printusage
{
    print <<"HELPMESSAGE";
This script analyze the output of a problem. It should be mostly used to parse
the output of a solveron the grid engine and fill the content of a database.
Here are the options:
  --prover_path=s
       is the path to the prover that can be run
  --option=s
       is the option to be passed to the prover ('_' separated if a space is needed)
  --problem=s
        is the problem to run the solver on or 'ge_mode' for the grid engine
  --taskfile=s
        is the taskfile. If the problem is 'ge_mode', then the solver is run
        on the first listed by the task file
  --timelimit=i
        is the limit to run the solver on
  --host=s
  --extension=s
        is the extension of the problem files supported by the prover
  --database=s
        name of the database to use for the results
  --table=s
        name of the database to use for the results
  --mysql_user_name=s
  --mysql_password=s

  --thorough_check is meant for extra checks that should not be activated
        by default (e.g., only with SPASSCHECK=1)
HELPMESSAGE
}

sub printAtLogLevel
{
    my ($problem, $logfile, $log, $loglevel, $line, $script_start_time) = @_;
    my $current_time = time( );
    my $elapsed = $current_time - $script_start_time;
    if($log >= $loglevel)
    {
	print $logfile (map {basename($problem) . " " . $elapsed . ": " . $_ . "\n"} (split(/\n/, $line)));
    }
}


1;
