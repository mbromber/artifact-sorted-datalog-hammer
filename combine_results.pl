#!/usr/bin/env perl
use Getopt::Long;
use File::Basename;
use FindBin qw($RealBin);
use lib "$RealBin";
use analyzer;

my $solver_list = "SPASS-SPL SPASS-SPL-0_6 vampire spacer z3 cvc4";

GetOptions ("solver_list=s" => \$solver_list)
    or die("Error in command line arguments");

my @solvers      = split (/\s+/, $solver_list);

my @prob_names   = fileToArray("Selection/selected_benchmarks");
my @exp_results  = fileToArray("Selection/expected_results");
my @conj_types   = fileToArray("Selection/conjecture_types");

my $probs = scalar @prob_names;

#print @solvers . "\n";

if($probs != scalar @exp_results) {
    die "the file listing the expected results contains a different number of types compared to the number of selected benchmarks." . scalar @exp_results . " vs. " . $probs;
}

if($probs != scalar @conj_types) {
    die "the file listing the conjecture types contains a different number of types compared to the number of selected benchmarks." . scalar @conj_types . " vs. " . $probs;
}

open($out, ">", "Results/results.tex") or die "Cannot open Results/results.tex";

open($out_extended, ">", "Results/extended_results.tex") or die "Cannot open Results/extended_results.tex";

writeTableHeaderToFile($out,@solvers);
writeExtendedTableHeaderToFile($out_extended,@solvers);

for (my $line = 0; $line < $probs; $line++) {
    my $prob_name = $prob_names[$line]; 
    rowPrefix($out,$prob_name,$conj_types[$line],$exp_results[$line]);
    rowPrefix($out_extended,$prob_name,$conj_types[$line],$exp_results[$line]);
    foreach my $solver(@solvers) {
        appendResult($out,$out_extended,$solver,$prob_name, $exp_results[$line]);
    }
    print $out "\\\\ \\hline\n";
    print $out_extended "\\\\ \\hline\n";
}

writeTableFooterToFile($out,@solvers);
writeTableFooterToFile($out_extended,@solvers);

close $out;
close $out_extended;

    
sub writeTableHeaderToFile
{
    my ($out,@solvers) = @_;
    print $out "\\centering\n";
    print $out "{\\scriptsize\n";
    print $out "{\\setlength{\\tabcolsep}{1pt}\n";
    print $out "\\begin{tabular}{|l|c|c|";

    foreach my $solver(@solvers) {
	if($solver eq "SPASS-SPL"){
	    print $out "|r|r|r|";
	}elsif($solver eq "SPASS-SPL-0_6"){
	    print $out "|r|r|r|";
	}elsif($solver eq "vampire"){
	    print $out "|r";
	}elsif($solver eq "spacer"){
	    print $out "|r";
	}elsif($solver eq "z3"){
	    print $out "|r";
	}elsif($solver eq "cvc4"){
	    print $out "|r";
	}else{
	    die "List of solvers contains an unknown solver: " . $solver;
	}
    }
    print $out "|}\n";
    print $out "\\hline\n";
    print $out "\\multicolumn{1}{|c|}{Problem} ";
    print $out "& \\multicolumn{1}{|c|}{Q} ";
    print $out "& \\multicolumn{1}{|c||}{Status} ";
    foreach my $solver(@solvers) {
	if($solver eq "SPASS-SPL"){
	    print $out "& \\multicolumn{1}{|c|}{\$|B_{\\max}|\$} & \\multicolumn{1}{|c|}{\$|\\Delta_{\\phi}|\$} & \\multicolumn{1}{|c||}{SPASS-SPL} ";
	}elsif($solver eq "SPASS-SPL-0_6"){
	    print $out "& \\multicolumn{1}{|c|}{\$|B^o|\$} & \\multicolumn{1}{|c|}{\$|\\Delta^o_{\\phi}|\$} & \\multicolumn{1}{|c||}{SPASS-SPL-v0.6} ";
	}elsif($solver eq "vampire"){
	    print $out "& \\multicolumn{1}{|c|}{vampire} ";
	}elsif($solver eq "spacer"){
	    print $out "& \\multicolumn{1}{|c|}{spacer} ";
	}elsif($solver eq "z3"){
	    print $out "& \\multicolumn{1}{|c|}{z3} ";
	}elsif($solver eq "cvc4"){
	    print $out "& \\multicolumn{1}{|c|}{cvc4} ";
	}else{
	    die "List of solvers contains an unknown solver: " . $solver;
	}
    }
    print $out "\\\\ \\hline \\hline\n";
}


sub writeExtendedTableHeaderToFile
{
    my ($out,@solvers) = @_;
    print $out "\\centering\n";
    print $out "{\\scriptsize\n";
    print $out "{\\setlength{\\tabcolsep}{1pt}\n";
    print $out "\\begin{tabular}{|l|c|c|";

    foreach my $solver(@solvers) {
	if($solver eq "SPASS-SPL"){
	    print $out "|r|r|r|r|r|";
	}elsif($solver eq "SPASS-SPL-0_6"){
	    print $out "|r|r|r|r|r|";
	}elsif($solver eq "vampire"){
	    print $out "|r|r|r|";
	}elsif($solver eq "spacer"){
	    print $out "|r|r|r|";
	}elsif($solver eq "z3"){
	    print $out "|r|r|r|";
	}elsif($solver eq "cvc4"){
	    print $out "|r|r|r|";
	}else{
	    die "List of solvers contains an unknown solver: " . $solver;
	}
    }
    print $out "|}\n";
    
    print $out "\\hline\n";
    print $out "\\multicolumn{3}{|r||}{Solver:} ";
    foreach my $solver(@solvers) {
	if($solver eq "SPASS-SPL"){
	    print $out "& \\multicolumn{5}{|c||}{SPASS-SPL} ";
	}elsif($solver eq "SPASS-SPL-0_6"){
	    print $out "& \\multicolumn{5}{|c||}{SPASS-SPL-v0.6} ";
	}elsif($solver eq "vampire"){
	    print $out "& \\multicolumn{3}{|c||}{vampire} ";
	}elsif($solver eq "spacer"){
	    print $out "& \\multicolumn{3}{|c||}{spacer} ";
	}elsif($solver eq "z3"){
	    print $out "& \\multicolumn{3}{|c||}{z3} ";
	}elsif($solver eq "cvc4"){
	    print $out "& \\multicolumn{3}{|c||}{cvc4} ";
	}else{
	    die "List of solvers contains an unknown solver: " . $solver;
	}
    }
    print $out "\\\\ \\hline\n";
    
    
    print $out "\\multicolumn{1}{|c|}{Problem} ";
    print $out "& \\multicolumn{1}{|c|}{Q} ";
    print $out "& \\multicolumn{1}{|c||}{Status} ";
    foreach my $solver(@solvers) {
	if($solver eq "SPASS-SPL"){
	    print $out "& \\multicolumn{1}{|c|}{\$|B_{\\max}|\$} & \\multicolumn{1}{|c|}{\$|\\Delta_{\\phi}|\$} & \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}elsif($solver eq "SPASS-SPL-0_6"){
	    print $out "& \\multicolumn{1}{|c|}{\$|B^o|\$} & \\multicolumn{1}{|c|}{\$|\\Delta^o_{\\phi}|\$} & \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}elsif($solver eq "vampire"){
	    print $out "& \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}elsif($solver eq "spacer"){
	    print $out "& \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}elsif($solver eq "z3"){
	    print $out "& \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}elsif($solver eq "cvc4"){
	    print $out "& \\multicolumn{1}{|c|}{result}  & \\multicolumn{1}{|c|}{time}  & \\multicolumn{1}{|c||}{memory} ";
	}else{
	    die "List of solvers contains an unknown solver: " . $solver;
	}
    }
    print $out "\\\\ \\hline \\hline\n";
}


sub writeTableFooterToFile
{
    my ($out,@solvers) = @_;
    print $out "\\end{tabular}\n";
    print $out "}\n";
    print $out "}\n";
#    print $out "Benchmark results and statistics.\n";
}

sub rowPrefix
{    
    my($out,$problem,$conj_type,$exp_result) = @_;
    my $problem_name = $problem =~ s/_/\\_/r;
    print $out $problem_name . " & \$\\" . $conj_type . "\$ &" . $exp_result;
}
    
sub appendResult
{
    my($out,$out_extended,$solver,$prob_name, $exp_result) = @_;
    my $solver_results;
    if($solver eq "SPASS-SPL"){
        $solver_results = "Results/CSV/spassspl.csv";
    }elsif($solver eq "SPASS-SPL-0_6"){
        $solver_results = "Results/CSV/spassspl06.csv";
    }elsif($solver eq "vampire"){
        $solver_results = "Results/CSV/vampire.csv";
    }elsif($solver eq "spacer"){
        $solver_results = "Results/CSV/spacer.csv";
    }elsif($solver eq "z3"){
        $solver_results = "Results/CSV/z3.csv";
    }elsif($solver eq "cvc4"){
        $solver_results = "Results/CSV/cvc4.csv";
    }else{
        die "List of solvers contains an unknown solver: " . $solver;
    }


    open (RESULTS, $solver_results) or die "could not open '" . $solver_results . "'\n";
    while (my $line = <RESULTS>){
        my @match;
        if(@match =($line =~/(\N*),(\N*),(\N*),(\N*),(\N*),(\N*),(\N*)/)){
            if($match[0] eq $prob_name){
                if($solver eq "SPASS-SPL"){
                    print $out " &" . $match[2] . " &" . $match[3];
                    print $out_extended " &" . $match[2] . " &" . $match[3];
                } elsif($solver eq "SPASS-SPL-0_6"){
                    print $out " &" . $match[2] . " &" . $match[3];
                    print $out_extended " &" . $match[2] . " &" . $match[3];
                }
                if($match[1] ne "true" && $match[1] ne "false"){
	            print $out " &" . $match[1];
	            print $out_extended " &" . $match[1] . " &" . $match[4] . " &" . $match[5];
                }elsif($match[1] ne $exp_result){
                   print "Warning! Solver " . $solver . "returned the wrong result for benchmark " . $prob_name . ". Expected '" . $exp_result . "' but returned '" . $match[1] . "'\n";
                   print $out " &wrong result";
                   print $out_extended " &" . $match[1] . "(wrong result)" . " &" . $match[4] . " &" . $match[5];
                }else{
                   print $out " &" . $match[4];
                   print $out_extended " &" . $match[1] . " &" . $match[4] . " &" . $match[5];
                }
                return 0;
            }
        }
    }
    
    if($solver eq "SPASS-SPL"){
        print $out " &-  &-";
        print $out_extended " &-  &-";
    } elsif($solver eq "SPASS-SPL-0_6"){
        print $out " &-  &-";
        print $out_extended " &-  &-";
    }
    print $out " &N/A";
    print $out_extended " &N/A &-  &-";
    return 0;
}

sub fileToArray
{
    my ($problem) = @_;
    open (PROBLEM, $problem) or die "could not open '$problem'\n";
    my @lines = ();
    my $pos = 0;
    while (my $line = <PROBLEM>)
    {
	my @match;
	if(@match =($line =~/(\N*)/)){
	    push(@lines,$match[0]);
#	    print "Zeile " . $pos . ": " . $lines[pos] . "\n";
	    $pos++;
	}
    }
    close PROBLEM;
    return @lines;
}
