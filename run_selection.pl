#!/usr/bin/env perl
use Getopt::Long;
use File::Basename;
use FindBin qw($RealBin);
use lib "$RealBin";
use analyzer;

my $CPU_limit = 2400;
my $option = "";
my $log    = 0;
my $max_memory = 8;
my $solver = "SPASS-SPL";
my $selection = "";
my $solver_path = "";
my $extension = ".ftcnf";
my $options = " ";
my $append = 0;

GetOptions ("timelimit=i" => \$CPU_limit,
	    "max_memory=s" => \$max_memory,
            "solver=s" => \$solver,
            "selection=s" => \$selection,
            "append!" => \$append)
    or die("Error in command line arguments");

$solver_path = "bin/" . $solver;

if($solver eq "SPASS-SPL"){
    $options = "-d -h";
    $extension = ".ftcnf";
    $results = "Results/CSV/spassspl.csv";
}elsif($solver eq "SPASS-SPL-0_6"){
    $options = "-d -h";
    $extension = ".ftcnf";
    $results = "Results/CSV/spassspl06.csv";
}elsif($solver eq "vampire"){
    $options = "--memory_limit 8000 --time_limit 0 -p off";
    $extension = ".tptp";
    $results = "Results/CSV/vampire.csv";
}elsif($solver eq "spacer"){
    $options = " ";
    $extension = ".chc";
    $solver_path = "bin/z3";
    $results = "Results/CSV/spacer.csv";
}elsif($solver eq "z3"){
    $options = " ";
    $extension = ".smt2";
    $results = "Results/CSV/z3.csv";
}elsif($solver eq "cvc4"){
    $options = "--multi-trigger-cache --full-saturate-quant";
    $extension = ".smt2";
    $results = "Results/CSV/cvc4.csv";
}else{
    die "The selected solver is unknown: " . $solver;
}

if($selection eq ""){
    if($solver eq "SPASS-SPL"){
        $selection = "Selection/spassspl-selection";
    }elsif($solver eq "SPASS-SPL-0_6"){
        $selection = "Selection/spassspl-0_6-selection";
    }elsif($solver eq "vampire"){
        $selection = "Selection/vampire-selection";
    }elsif($solver eq "spacer"){
        $selection = "Selection/chc-selection";
    }elsif($solver eq "z3"){
        $selection = "Selection/smt-selection";
    }elsif($solver eq "cvc4"){
        $selection = "Selection/smt-selection";
    }else{
        die "List of solvers contains an unknown solver: " . $solver;
    }
}

my $out;

if($append){
    open($out, ">>", $results) or die "Cannot open '" . $results . "'\n";
}else{
    open($out, ">", $results) or die "Cannot open '" . $results . "'\n";
}

open (SELECTION, $selection) or die "could not open '" . $selection . "'\n";
while (my $line = <SELECTION>)
{
    my @match;
    if(@match =($line =~/(\N*)/)){
        if($solver eq "SPASS-SPL-0_6"){
          $options = selectSPASSSPL06Options($match[0]);
        }
        ($solver_problem, $solver_result, $solver_maxtpsize, $solver_sizehconj, $solver_overall_time, $memory, $solver_error_msg) = analyzer::analyze_run($solver_path,$options, $match[0], $CPU_limit, $extension, 0, $max_memory);
        print $solver_problem . "," . $solver_result . "," . $solver_maxtpsize . "," . $solver_sizehconj . "," . $solver_overall_time . "s," . $memory . " MB," . $solver_error_msg . "\n";
        print $out $solver_problem . "," . $solver_result . "," . $solver_maxtpsize . "," . $solver_sizehconj . "," . $solver_overall_time . "s," . $memory . " MB," . $solver_error_msg . "\n";
    }
}
close SELECTION;
close $out;

sub selectSPASSSPL06Options
{
    my ($problem) = @_;

    open (PROBLEM, $problem) or die "could not open '$problem'\n";
    while (my $line = <PROBLEM>)
    {
	my @match;
	if(@match =($line =~/(g \N*)/)){
	    close PROBLEM;
	    return "-d -n -h";
	}
    }
    close PROBLEM;
    return "-d -h";
}
