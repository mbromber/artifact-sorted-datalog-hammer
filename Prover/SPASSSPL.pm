package Prover::SPASSSPL;

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
has 'maxtpsize'                       => (is => 'rw', isa => 'Str');
has 'sizehconj'                       => (is => 'rw', isa => 'Str');
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
    $self->overall_time("-");
    $self->memory(0);
    $self->max_memory(0);
    $self->error_msg("");
    $self->maxtpsize("-");
    $self->sizehconj("-");
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
        my @match;
	if($line =~ /c TIME/) {
	    if(@match=($line =~ /Maximum resident set size: (\d+), real time:\s*(\d+).(\d+), user time:\s*(\d+).(\d+), system time:\s*(\d+).(\d+)/)) {
		$self->max_memory($match[0] / 1000);
		$self->overall_time($match[1] . "." . $match[2]);
	    } else {
		print "SCRIPT_ERROR: could not parse output of time: $line"
	    }
	}elsif(@match=($line =~ /\N*std::bad_alloc\N*/)){
	  $self->result("memout");
	  $self->error_msg("Out of memory");
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
    return ($self->problem. ", " . $self->result. ", " .
	    $self->maxtpsize. ", " .
	    $self->sizehconj. ", " .
	    $self->overall_time. ", " .
	    $self->error_msg)
}

sub result_array
{
    my $self = shift;
    return ($self->problem,
	    $self->result,
	    $self->maxtpsize,
	    $self->sizehconj,
	    $self->overall_time,
	    $self->error_msg);
}

sub analyze_output
{
    my ($self, $line) = @_;
    my @match;

    if (  $line =~ /^\s*Conjecture refuted!\s*$/ )
    {
	$self->result("false");
    }

    elsif (  $line =~ /^\s*Conjecture proven!\s*$/ )
    {
	$self->result("true");
    }

    elsif (  ( @match = ( $line =~ /^\s*size of largest test point set:\s*(\d+)\s*$/) ) == 1 )
    {
	$self->maxtpsize($match[0] . "");
    }
    
    elsif (  ( @match = ( $line =~ /^\s*size of the test point set\s*:\s*(\d+)\s*$/) ) == 1 )
    {
	$self->maxtpsize($match[0] . "");
    }

    elsif (  ( @match = ( $line =~ /^\s*size of hammered conjecture\s*:\s*(\d+)\s*$/) ) == 1 )
    {
	$self->sizehconj($match[0] . "");
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
