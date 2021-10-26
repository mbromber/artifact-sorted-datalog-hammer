package Prover::Vampire;

use strict;
use warnings;
use File::Basename;

use Moose;
use Moose::Util::TypeConstraints;

has 'problem'                         => (is => 'rw', isa => 'Str');
has 'result'                          => (is => 'rw', isa => 'Str');
has 'overall_time'                    => (is => 'rw', isa => 'Str');
has 'memory'                          => (is => 'rw', isa => 'Int');
has 'max_memory'                      => (is => 'rw', isa => 'Num');
has 'error_msg'                       => (is => 'rw', isa => 'Str');

#use fields qw(problem result overall_time memory max_memory error_msg);

#sub new
#{
#    my $class = shift;
#    my $self = fields::new($class);
#    $self->{problem} = "unknown";
#    $self->{result} = "unknow";
#    $self->{overall_time} = "";
#    $self->{memory} = 0;
#    $self->{max_memory} = 0;
#    $self->{error_msg} = "";
#    return $self;
#}

sub analyze_problem
{
    my ($self, $problem) = @_;
    $self->problem(fileparse($problem,  qr/\.[^.]*/));
    $self->result("unknown");
    $self->overall_time("NULL");
    $self->memory(0);
    $self->max_memory(0);
    $self->error_msg("");
    my $unsat_stat = "sat";
    my $sat_stat = "unsat";
    my $unknown_stat = "unknown";
    open (PROBLEM, $problem) or die "could not open '$problem'\n";
    close PROBLEM;
}

sub add_core_dump
{
    my $self = shift;
    $self->result("error");
    $self->error_msg("Segmentation fault");
}

sub analyze_errors
{
    my ($self, $err) = @_;
    my $error_msg;
    foreach my $line (split /\n/, $err)
    {
	if($line =~ /c TIME/) {
	    my @match;
	    if(@match=($line =~ /Maximum resident set size: (\d+), real time:\s*(\d+).(\d+), user time:\s*(\d+).(\d+), system time:\s*(\d+).(\d+)/)) {
		$self->max_memory($match[0] / 1000);
		$self->overall_time($match[1] . "." . $match[2]);
	    } else {
		print "SCRIPT_ERROR: could not parse output of time: $line"
	    }
	}
	#elsif ($line =~ /^s /) {
	#    
	#}
	#else {
	#    $self->result ("error");
	#    $error_msg .= $line
	#}
    }

    if($error_msg) {
	$error_msg =~ s/\n//g;
	$self->error_msg($error_msg);
    }
}

sub add_signal
{
    my ($self, $signal_num) = @_;
    $self->result("error");
    $self->error_msg("Signal $signal_num, " . $self->error_msg);
}

sub result_string
{
    my $self = shift;
    return ($self->problem. ", " .$self->result. ", " .

	    $self->overall_time. ", " .
	    $self->error_msg)
}

sub result_array
{
    my $self = shift;
    return ($self->problem,
	    $self->result,
	    "-",
	    "-",
	    $self->overall_time,
	    $self->error_msg);
}

sub analyze_output
{
    my ($self, $line) = @_;
    my @match;

    if (  $line =~ /^\% Termination reason: Satisfiable\s*$/ )
    {
	#note that the transformation into dfg (and then tptp) negates the
	#formula into the counterexample formulation.
	#Thus, the conjecture is refuted if Vampire returns sat.
	$self->result("false");
    }

    elsif (  $line =~ /^\% Termination reason: Refutation\s*$/ )
    {
	#note that the transformation into dfg (and then tptp) negates the
	#formula into the counterexample formulation.
	#Thus, the conjecture is proven if Vampire returns unsat.
	$self->result("true");
    }
}


sub set_timeout
{
    my ($self) = @_;
    $self->result ("timeout");
    $self->error_msg("Timeout");
}


sub safe_error
{

    my ($self, $err) = @_;
    return 0;
}

1;
