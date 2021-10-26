package Prover::dispatch;

use FindBin qw($RealBin);
use lib "$RealBin";
use Prover::GenericSMT;
use Prover::SPASSSPL;
use Prover::Vampire;

use strict;
use warnings;


sub create_dispatcher {

    my ($extension, $prover) = @_;
    my $analyzer;

    #SMTLIB2
    
    if ($extension eq ".smt2")
    {
	$analyzer = Prover::GenericSMT->new();
    }
    
    if ($extension eq ".chc")
    {
	$analyzer = Prover::GenericSMT->new();
    }

    if ($extension eq ".tptp")
    {
	$analyzer = Prover::Vampire->new();
    }

    if ($extension eq ".ftcnf")
    {
	$analyzer = Prover::SPASSSPL->new();
    }

    if(!$analyzer) {
	die "no analyzer created, extension = $extension, prover = $prover";
    }


    
    return $analyzer;
}



1;
