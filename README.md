# Artifact for Paper "A Sorted Datalog Hammer for Supervisor Verification Conditions Modulo Simple Linear Arithmetic"

by Martin Bromberger, Irina Dragoste, Rasha Faqeh, Christof Fetzer, Larry González, Markus Krötzsch, Maximilian Marx, Harish K Murali, and Christoph Weidenbach. 2021.

## Abstract

This is the artifact for the paper "A Sorted Datalog Hammer for Supervisor Verification Conditions Modulo Simple Linear Arithmetic".

It contains and documents the tool SPASS-SPL, as well as all other tools and benchmarks necessary to reproduce the experiments from the paper. 
SPASS-SPL contains an implementation of the sorted Datalog hammer (the main theoretical result in the paper) and uses the Datalog reasoner VLog via an API to solve the hammered formulas.
To make the reproduction of the experiments easier, the artifact also contains scripts for running the experiments and compiling the result table included in the paper (Figure 2). For detailed instructions on how to reproduce the results, see the included README.md

We will upload this artifact on Zenodo if the paper and artifact get accepted. This way we will guarantee that the artifact is archived permanently and stays publicly available.

The artifact is also available online as a GitHub repository (containing the same files). The GitHub page has the advantage that it displays this readme file in an easier to read format:

https://github.com/mbromber/artifact-sorted-datalog-hammer

## Setup Steps

1. Install Dependencies

        cd packages
        sudo dpkg -i *.deb
        cd ..

**Note:** This installs all the dependencies for the replication of our experiments. The dependencies are saved as pip packages in the directory packages. This artifact assumes access to Python3.8 and pip3 20.0.2

**Note:** We recommend to prevent the system from locking the screen automatically. This can be done with the following command: `gsettings set org.gnome.desktop.session idle-delay 0`

2. Grant execution permissions to scripts

        chmod 755 run_selection.pl
        chmod 755 combine_results.pl
        chmod 755 bin/*
    
## Testing Functionality

The following series of commands can be used to check the artifact for any technical issues. The results should be two tables as pdf files. The first one corresponds to the result table in our paper, but with the time limit decreased to 10 seconds. The second one is an extended version of the first table.

    ./run_selection.pl --solver="SPASS-SPL" --timelimit=10
    ./run_selection.pl --solver="SPASS-SPL-0_6" --timelimit=10
    ./run_selection.pl --solver="vampire" --timelimit=10
    ./run_selection.pl --solver="spacer" --timelimit=10
    ./run_selection.pl --solver="cvc4" --timelimit=10
    ./run_selection.pl --solver="z3" --timelimit=10
    ./combine_results.pl
    cd Results
    make
    xdg-open table.pdf &
    xdg-open extended_table.pdf &
    cd ..

## Artifact Instructions

This artifact contains two scripts that simplify the replication of the benchmark experiments presented in the paper. The first script [run_selection.pl](#the-script-for-running-benchmarks) runs a selection of benchmarks for a given solver and stores its results in a CSV file in the folder [Results/CSV/](Results/CSV/). The second script [combine_results.pl](#the-script-for-combining-results) combines the returned CSV files into two LaTeX tables: one corresponds to the result table from our paper and the other provides some additional details. A more detailed description of both scripts can be found after this section.

### Run Experiment
The following series of commands execute the tools [SPASS-SPL](#spass-spl-v07), [SPASS-SPL v0.6](#spass-spl-v06), vampire, spacer, z3, and cvc4 on all applicable benchmarks with a time limit of 40 minutes (=2400 seconds). Running all commands at once takes roughly 31 hours. This is mainly due to the two SMT solvers z3 and cvc4 that time out on most of the tested problems. Therefore, we decided to split the whole experiment into more manageable parts. Each part can be executed in less than 5 hours. That should make it possible to run the experiment comfortably in the span of several days including breaks between each step.

**Note:** It is also possible to run an abridged version of the experiment by decreasing the time limit. For instance, 10 minutes (=600 seconds) should be enough time to produce a fair approximation of the original results and takes overall only 8 hours to execute. This can be done by replacing all occurrences of `--timelimit=2400` with `--timelimit=600`.

    ./run_selection.pl --solver="SPASS-SPL" --timelimit=2400
    ./run_selection.pl --solver="SPASS-SPL-0_6" --timelimit=2400
    ./run_selection.pl --solver="vampire" --timelimit=2400
    ./run_selection.pl --solver="spacer" --timelimit=2400
    ./run_selection.pl --solver="cvc4" --timelimit=2400 --selection="Selection/smt-selection_part1"
    ./run_selection.pl --solver="cvc4" --timelimit=2400 --append --selection="Selection/smt-selection_part2"
    ./run_selection.pl --solver="cvc4" --timelimit=2400 --append --selection="Selection/smt-selection_part3"
    ./run_selection.pl --solver="cvc4" --timelimit=2400 --append --selection="Selection/smt-selection_part4"
    ./run_selection.pl --solver="cvc4" --timelimit=2400 --append --selection="Selection/smt-selection_part5"
    ./run_selection.pl --solver="z3" --timelimit=2400 --selection="Selection/smt-selection_part1"
    ./run_selection.pl --solver="z3" --timelimit=2400 --append --selection="Selection/smt-selection_part2"
    ./run_selection.pl --solver="z3" --timelimit=2400 --append --selection="Selection/smt-selection_part3"
    ./run_selection.pl --solver="z3" --timelimit=2400 --append --selection="Selection/smt-selection_part4"
    ./run_selection.pl --solver="z3" --timelimit=2400 --append --selection="Selection/smt-selection_part5"
    
### Show Results
The following commands combine the results computed and stored in the previous step into two tables and opens them in the Document Viewer.

    ./combine_results.pl
    cd Results
    make
    xdg-open table.pdf &
    xdg-open extended_table.pdf &
    cd ..

**Note:** We ran the experiments in the [TACAS 22 artifact evaluation VM](https://zenodo.org/record/5537147) on a system with an Intel Core i7-9700K CPU with
eight 3.60GHz cores. Your run times may differ from the results in the paper depending on the system you use, but the difference in the results should be consistent over all tools. Therefore, you should be able to reproduce the general tendency of the results from the paper independent of the system you use.

**Note:** The previous versions of our scripts had some limitations that we fixed in the meantime. For an SMT/CHC solver, they determined only whether the solver returned sat, unsat, or terminated without one of the two results. The latter was always marked as a timeout. The current versions now also recognize whether the solver returned unknown, actually reached the time limit or exited with an error (usually because the solver needed too much memory). As a result, we can now determine that z3 exited with an error on the problem lc_u5 (most likely due to a memout) and cvc4 returned unknown for the problems lc_e2, lc_e3, lc_u1, and lc_u2. We plan to add this information to the camera ready version of the paper if it gets accepted.

### The Script for Running Benchmarks

The script [run_selection.pl](run_selection.pl) can be used to run a given solver on a selection of benchmarks and to store its results in a CSV file in the folder [Results/CSV/](Results/CSV/). Moreover, the results are also printed to the console to show the progress of the script. The format is `<benchmark name>,<result>,<tp-size>,<hc-sizes>,<run time>,<max memory>,<error messages>`. `<tp-size>` stands for the size of the largest test-point set introduced by the sorted/original Hammer if the solver is SPASS-SPL or SPASS-SPL-0_6. `<hc-size>` stands for size of the hammered universal conjecture
if the solver is SPASS-SPL or SPASS-SPL-0_6. For all other solvers, both entries are always `-`.


#### Synopsis
    ./run_selection.pl [OPTIONS]
    
#### Options
    --solver="NAME"
The NAME of the solver/tool to be run on the selection of benchmarks. If this option is missing, SPASS-SPL is picked by default as the solver. Valid NAMEs are SPASS-SPL, SPASS-SPL-0_6, vampire, spacer, z3, and cvc4.

    --selection="FILE"
The FILE (path relative to the folder of this script) containing a selection of benchmarks. The FILE has to be formatted so each line contains a file path to a valid input file for the specified solver/tool. Examples for the various tools can be found in the folder [Selection/](Selection/). Each of those examples selects all applicable benchmarks from our benchmark set for the specified solver or solver class. If this option is missing, the script picks as default the corresponding selection file for the solver/tool from this folder.

    --timelimit=TIME
This option specifies a time limit of TIME (in seconds) for each benchmark problem. (By default no time limit is set.) This means the solver/tool is aborted if it cannot solve the problem in the specified time limit and the result `timeout` is stored in the entry for the problem of the respective CSV file. 

    --max_memory=MEMORY
This option specifies a memory limit of MEMORY (in Gbit) for each benchmark problem. (By default 8 Gbit is set as the memory limit.) This means the solver/tool is aborted if it cannot solve the problem given the specified memory limit. Unfortunately, the script cannot always recognize this. If it does, the result `memout` is stored in the entry for the problem of the respective CSV file. Otherwise, `error` is stored in the entry.

    --append
By default the script overwrites the CSV file storing the previous results for the solver/tool. With this option the new results are appended to the old ones. This makes it possible to split the selection of benchmarks over several files in order to make breaks in between.


### The Script for Combining Results

The script [combine_results.pl](combine_results.pl) can be used to combine the CSV files returned by the [run_selection.pl script](#the-script-for-running-benchmarks) into two LaTeX tables: one corresponds to the result table from our paper and the other provides some additional details.

#### Table Legends
Columns:
* **Problem:** the name of the benchmark problem.
* **Q:** the type of the problems conjecture, i.e., whether the conjecture is existential $\exists$ or universal $\forall$.
* **Status:** the status of the benchmark problem, i.e., true if the conjecture is entailed and false otherwise.
* **$B_{max}$:** the size of the largest test-point set introduced by the sorted Hammer.
* **$B^o$:** the size of the test-point set introduced by the original Hammer
* **$\Delta_{\phi}$:** the size of the hammered universal conjecture (after the sorted hammer).
* **$\Delta_{\phi}^o$:** the size of the hammered universal conjecture (after the original hammer).

The remaining columns are labeled after the solvers/tools and list the respective results for each of the benchmark problems. In the case of the normal table, the results are compiled into one entry as follows:
* An entry **"N/A"** means that there was no result for the benchmark problem in the tools CSV file. This happens if the selection file of the tool did not contain an entry for a file of the same name (format: PATH/NAME.EXTENSION). This is possible because not all problems can be expressed in every tools input format, e.g., it is not possible to encode a universal conjecture (or, to be more precise, its negation) in the CHC format and SPASS-SPL-0_6 is not sound when the problem contains integer variables.
* An entry **"timeout"** means that the tool could not solve the problem in the given time limit
* An entry **"unknown"** means that the tool terminated in the time limit without returning a result or an error.
* An entry **"memout"** means that the tool ran out of memory (and our script was able to recognize this).
* An entry **"error"** means that the tool exited with an error. (Sometimes "error" is returned because the tool ran out of memory and our script did not recognize it.)
* An entry **"wrong result"** means that the tool exited with the wrong result, e.g., true although the status of the problem is false.
* Otherwise, the entry contains the time needed (in seconds) to solve the problem.

In the case of the extended table, the results are compiled into three subcolumns:
* **result:** the returned result of the tool, i.e., "true" or "false" if the tool returned the correct result, "true (wrong result)" or "false (wrong result)" if the tool returned the wrong result, or "N/A", "timeout", "memout", "unknown" or "error" under the conditions described above.
* **time:** the time needed until the solver returned its result.
* **memory:** the maximum amount of memory used before the solver returned its result.

#### Synopsis
    ./combine_results.pl [OPTIONS]
    
#### Options
    --solver_list="SOLVERS"
A list of solver/tool names separated by a space, e.g., "SPASS-SPL z3". Valid names are SPASS-SPL, SPASS-SPL-0_6, vampire, spacer, z3, and cvc4. Only the results of the listed solvers are compiled into tables. By default all solvers are selected.


It is possible to modify the list of benchmark problems whose results are listed in the table. This can be done by modifying the files [Selection/selected_benchmarks], [Selection/expected_results], and [Selection/conjecture_types]. (This is not necessary for the replication of experiments.)

## Tools Tested

### SPASS-SPL (v0.7)

[SPASS-SPL (v0.7)](bin/SPASS-SPL) can be used as a decision procedure for the first-order fragment of pure approximately grounded Horn Bernays-Schoenfinkel modulo simple linear (mixed real-integer) arithmetic (HBS(SLR)AP). To solve an HBS(SLR)AP problem encoded in the [FTCNF language](#ftcnf-language), execute [SPASS-SPL](bin/SPASS-SPL) with the option `-d`:

    ./bin/SPASS-SPL -d <file>.ftcnf

[SPASS-SPL](bin/SPASS-SPL) will then apply the sorted Datalog Hammer to transform the HBS(SLR)AP clause set (modulo a universal conjecture) into an equisatisfiable Datalog program. After that is done, [SPASS-SPL](bin/SPASS-SPL) solves the Datalog program with the Datalog reasoner [VLog](https://github.com/karmaresearch/vlog) that has been integrated into [SPASS-SPL](bin/SPASS-SPL) via an API.

[SPASS-SPL](bin/SPASS-SPL) returns `Conjecture proven!` if the universal conjecture is entailed by the clause set and otherwise `Conjecture refuted!`.

If the input file `<file>.ftcnf` contains no universal conjecture, then [SPASS-SPL](bin/SPASS-SPL) will assume `false` as the universal conjecture. In this case, [SPASS-SPL](bin/SPASS-SPL) returns `Conjecture proven!` if the clause set is unsatisfiable (because "false" can only be entailed by an unsatisfiable clause set) and `Conjecture refuted!` if the clause set is satisfiable.

#### Transformation of FTCNF problems into other input languages

[SPASS-SPL](bin/SPASS-SPL) can transform FTCNF problems into the SMT-LIB 2.6 and into the CHC competition format. The respective options to do so are `-S -p` and `-C -p`.

[SPASS-SPL](bin/SPASS-SPL) can also be used to transform FTCNF problems after the application of the sorted Hammer into the DFG language of SPASS (with the options `-d -D -p`) and from DFG with the tool [dfg2tptp](bin/dfg2tptp) in the `bin` folder into the tptp format.

We already transformed all problems into the various formats. They can be found in the `Benchmarks` folder under the folder named after the respective file ending. For instance, `Benchmarks/smt2/ecu_u1.smt2` is the output of `./bin/SPASS-SPL -S -p Benchmarks/ftcnf/ecu_u1.ftcnf`

**Note:** The FTCNF benchmark problems encode a set of clauses coupled with a conjecture. The tools have to check whether the conjecture is a consequence of the clause set. The transformations encode this via the counter example formulation, i.e., by negating the conjecture and adding it to the clause set. As a result, the transformed problem is unsatisfiable if and only if the conjecture is a consequence. Our run_selection.pl script is aware of this and stores the result "true" (i.e., true that the conjecture is a consequence) if a tool returns unsatisfiable for one of the transformed benchmark problems and "false" if it returns satisfiable.

#### Additional Options

* Option `-h`: hammer statistics, prints statistics of the Datalog hammer. (The size of largest test point set and the size of hammered universal conjecture.)
* Option `-q <query>`: returns all derivable facts over our test points matching the given query. (Only applicable in combination with -d). E.g. <query> := "P(X0,X1)" returns all facts derivable for the predicate P.
* Option `-qall`: returns all derivable facts over our test points. (Only applicable in combination with -d).
* Option `-m`: if the input contains a universal conjecture that SPASS-SPL refutes, then this option prints all facts over the test point set and the conjecture predicate that could not be derived. (If the test point scheme is not total over the query, we can still refute it but not return any facts here.)

### SPASS-SPL (v0.6)

[SPASS-SPL (v0.6)](bin/SPASS-SPL-0_6) can solve clause sets modulo conjectures over the first-order fragment of pure positively grounded Horn Bernays-Schoenfinkel modulo simple linear real arithmetic (HBS(SLR)PP). To determine whether an HBS(SLR)PP clause set entails a universal conjecture (both encoded in one file in the [FTCNF language](#ftcnf-language)), execute [SPASS-SPL](bin/SPASS-SPL-0_6) with the options `-d -n`:

    ./bin/SPASS-SPL-v0_6 -d -n <file>.ftcnf

To determine whether a HBS(SLR)PP clause set is satisfiable (encoded in the [FTCNF language](#ftcnf-language)), execute [SPASS-SPL](bin/SPASS-SPL-0_6) with the options `-d`:

    ./bin/SPASS-SPL-v0_6 -d <file>.ftcnf

In both cases, [SPASS-SPL](bin/SPASS-SPL-0_6) will then apply the original Datalog Hammer to transform the HBS(SLR)PP clause set (modulo a universal conjecture) into an equisatisfiable Datalog program. After that is done, [SPASS-SPL](bin/SPASS-SPL-0_6) solves the Datalog program with the Datalog reasoner [VLog](https://github.com/karmaresearch/vlog) that has been integrated into [SPASS-SPL](bin/SPASS-SPL-0_6) via an API.

SPASS-SPL returns `Conjecture proven!` if the universal conjecture is entailed by the clause set and otherwise `Conjecture refuted!`.

If the input file `<file>.ftcnf` contains no universal conjecture, then SPASS-SPL will assume `false` as the universal conjecture. In this case, [SPASS-SPL](bin/SPASS-SPL-0_6) returns `Conjecture proven!` if the clause set is unsatisfiable (because "false" can only be entailed by an unsatisfiable clause set) and `Conjecture refuted!` if the clause set is satisfiable.

### Other Tools
For comparison, we also tested for our experiments several state-of-the-art theorem provers for related logics (with the best settings we found):
* the satisfiability modulo theories (SMT) solver [cvc4-1.8](bin/cvc4) [[3]](#References) with settings `--multi-trigger-cache --full-saturate-quant`;
* the SMT solver [z3-4.8.12](bin/z3) [[1]](#References) with its default settings;
* the constrained horn clause (CHC) solver [spacer](bin/z3) [[2]](#References) with its default settings (needs to be executed via [z3-4.8.12](bin/z3) by giving it an smt2 input file that defines the input logic as HORN);
* the first-order theorem prover [vampire-4.5.1](bin/vampire) [[4]](#References) with settings `--memory_limit 8000 --time_limit 0 -p off`, i.e., with memory extended to 8GB, without internal time limit and without proof output.

For the SMT/CHC solvers, we directly transformed the benchmarks into their respective formats. For vampire, we applied our sorted Hammer before transforming to TPTP format. The various licenses of the tools can be found in the folder [Licenses/].

## FTCNF Language
FTCNF is the input language of SPASS-SPL. It is possible to express any BS(LA) formula in this language. SPASS-SPL has 3 sorts: "R" for Real, "I" for Integer, and "F", which stands for a finite set whose elements are exactly the constants of the sort. (This means that we SPASS-SPL supports only one first-order sort at the moment!) Default sort for all variables and constants is "R". Default sort for all predicates with an argument of sort "R" or "I" is "R". Default sort for all predicates with an argument of sort "F" is "F". In order to change the sort of a variable/constant, it has to be declared in the `<preamble>` of the input file. For instance `p(x:I),p(y:F)` declares the variable x as an integer variable and the variable y as a variable over F.

A clause written in the language looks as follows:

    <(+(-(*(3,x),*(x,e(y,2))),6),5),  =(y,z) || P(x,y), Q(z,w) -> R(a,w), Q(z,z).

The full grammar of the language is defined below:

    <preamble>   ::= [["p("<var>":"<RIF>")" | "p("<const>":"<RIF>")"] [","["p("<var>":"<RIF>")" | "p("<const>":"<RIF>")"]]*]
    <comment>    ::= "%" <anystring until EOL>
    
    <clause>     ::= [<constraint> "||"] <atoms> "->" <atoms> "."
    <gclause>    ::= g [<constraint> "||"] "->" <atom> "."
    <tclause>    ::= t <catom> "||" -> <atom> "."
    <constraint> ::= <catom> ["," <catom>]*
    <atoms>      ::= [<atom> ["," <atom>]*]
    <atom>       ::= <upercaseletter>[<number> | <letter>]*"("[<terms>]")"
    <terms>      ::= <term> ["," <term>]*
    <term>       ::= <var> | <const>
    <RIF>        ::= "R" | "I" | "F" 
    <const>      ::= <abcd>[[<lowercasestring>] | [<RIF>] | [<number>]]*
    <var>        ::= <xyzuvw>[[<lowercasestring>] | [<RIF>] | [<number>]]*
    <abcd>       ::= "a" | "b" | "c" | "d" 
    <xyzuvw>     ::= "x" | "y" | "z" | "u" | "v" | "w" 
    <catom>      ::= <crel>"("<cterm>,<cterm>")"
    <crel>       ::= "<" | ">" | "=" | "<=" | ">=" | "!="
    <cterm>      ::= "+("<cterm>,<cterm>[,<cterm>]*")" | "*("<cterm>,<cterm>[,<cterm>]*")" | "-("<cterm>,<cterm>")" | "-"<number> | <number> | <var>
    <number>     ::= ["0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"]+
    
    <SUPLOGin>   ::= <comment>* <preamble> <clause>* <tclause>* [<gclause>]

All variables in a `<clause>` are assumed to be universally quantified.

The optional `<gclause>` defines a universal conjecture that is supposed to be verified for our set of clauses `<clause>*`. More complex positive universal conjectures have to be manually flattened to this format according to the process outlined in https://arxiv.org/abs/2107.03189.

Existential conjectures cannot be encoded directly into the FTCNF format. However, an existential conjecture can be added by manually flattening it according to the process outlined in https://arxiv.org/abs/2107.03189 until the conjecture consists only of a conjunction of atoms <atoms>*, which can then be added as a clause "<atoms>* || -> .". The existential conjecture is entailed by the original clause set if the new clause set is unsatisfiable.

### Restrictions

* The strings "Goal", "Missing", and "Oa" cannot be used as predicate symbols because they are reserved for our Datalog hammer.
* The sorted/original Datalog hammer only works for the horn fragment, i.e., at most one atom is allowed on the right side of the implication arrow `->`.
* Any variable in the theory `<constraint>` of a clause `<constraint> || <premisses> -> <head> .` must also appear in the first-order part `<premisses> -> <head>`. If this is not the case for a variable `x`, then the problem still can be fixed by
first introducing a fresh unary predicate `Q`, adding the literal `Q(x)` to `<premisses>`, and finally by adding a clause `-> Q(x).` to our clause set.
* The sorted Datalog hammer only works for simple bounds and approximately grounded inequalities whose finiteness can be approximated over non-recursive clauses. This includes all positively grounded inequalities.
* The previous version of SPASS-SPL (v0.6) was not yet able to recognize and handle theory constraints beyond simple bounds, unless they are positively grounded variable comparisons (i.e., $x \LAOP y$ with $\LAOP \in \{\leq, <, \neq, =, >, \geq\}$). As a provisional workaround, it was also possible to "highlight" positively grounded theory atoms `<catom>` manually. To do so, the theory atom had to be replaced by a first-order `<atom>` over a fresh predicate and the same variables as <catom>. The interpretation of `<atom>` can then be fixed to `<catom>` with the help of a theory pattern clause `<tclause> ::= <catom> || -> <atom>`. The Datalog hammer will then treat `<catom>` as if it were a positively grounded theory atom that always simplifies to true or false in elim(S,N). The user has to check themselves if this is actually the case or the result is no longer guaranteed to be sound. Although the current version of SPASS-SPL (v0.7) can recognize all approximately grounded (and therefore the subsumed positively grounded) inequalities automatically, we still kept the theory pattern feature so old input files can still be executed by SPASS-SPL (v0.7).

# References

1. Barrett, C., Conway, C., Deters,M., Hadarean, L., Jovanovic, D., King, T., Reynolds, A., Tinelli, C.: CVC4. In: CAV, LNCS, vol. 6806 (2011)

2. Komuravelli, A., Gurfinkel, A., Chaki, S.: SMT-based model checking for recursive programs. In: CAV. Lecture Notes in Computer Science, vol. 8559, pp. 17–34. Springer (2014)

3. de Moura, L., Bjørner, N.: Z3: An efficient SMT solver. In: Tools and Algorithms for the Construction and Analysis of Systems, LNCS, vol. 4963 (2008)

4. Riazanov, A., Voronkov, A.: The design and implementation of vampire. AI Communications 15(2-3), 91–110 (2002)

# Acknowledgements

This work is partly supported by Deutsche Forschungsgemeinschaft (DFG, German Research Foundation)
in project number 389792660 (TRR 248, [Center for Perspicuous Systems](https://www.perspicuous-computing.science/)), and by the Bundesministerium für Bildung und Forschung (BMBF, Federal Ministry of Education and Research) in the [Center for Scalable Data Analytics and Artificial Intelligence](https://www.scads.de) (ScaDS.AI).
