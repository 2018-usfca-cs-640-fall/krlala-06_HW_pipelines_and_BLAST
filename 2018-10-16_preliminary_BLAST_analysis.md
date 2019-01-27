Analysis

**Code used for creating simpler blast result files: c=1; for file in output/Blast_results/*; do cat "$file" | cut -d " " -f 1-2 | cut -d "," -f 1 | uniq -c | sort > output/simple_results/"$c".simple.csv; ((c++)); done**

# Analyzing output of script :

## FastQC checks:
The fast QC report looks at a number of parameters. Per base sequence quality
and quality scores are the broadest indicators of the quality of the data.
*using only the last two numbers in the file name to refer to them*
The per base sequence quality is expected to trail off and lower at then end of
each sequencing run.
Despite that, the sequences can be grouped into:
Checks on such parameters need to be analyzed, and are only supplementary,
as while some checks can fail, they can fail with the expected data too,
since the checks are programmed to identify specific conditions.

Checked runs: These sequences have acceptable per base sequence quality. 81,83,
85-92,94-98.

Concern runs: These sequence runs aren't necessarily bad, but not very reliable.
80, 82, 84

Failed checks: These sequences should be run again due to low sequence quality.
93,99
Sequence duplication levels and overrepresented sequences: These sequences may
be contaminated, or have had over PCR amplification of certain sequences, or may
just represent the biological sample, which has a large number of the particular
sequence. None of the sequences here passed this check, and hints towards
more abundance of certain bacteria, as seen from the QC graphs. This would also
end up failing other checks in the QC program.

###Looking at Blast results:

The Blast results show names of bacteria found on the mouse(computer) and hands
of individuals in the Fierer et al study.
The .csv files display the names of the bacteria, and related information like
accession number, gi number, e- value and query match score.(against the nt
database)

A cursory evaluation of the files reveals that certain bacteria occur far more
often than other- The bacteroidetes endosymbiont of *Metaseiulus Occidentalis* in
sample 80, for example.

*Metaseiulus Occidentalis* if a predatory mite, and has several microbial
symbionts as well as its own mitochondrial and nuclear genomes. It has a large
mitochondrial genome due to triplication of genes and has a haploid chromosome
number of 3.

- From a comparison of the different organisms found on the mouse and hand for
the same individual, it is seen that the samples obtained from the hand have
a tendency for over-representation of certain organisms, while the mouse samples
are more varied, and in certain cases have more instances of some other organism.
This disparity is probably due a number of factors, greatest being the switch in
the surrounding environment that influences growth.

- While every sample differs from each other, some similarities are noted. For
example, in some of the hand samples, there exists the mite which takes up most
of the sequencing data, but it isn't usually found in the samples on the mouse.

- Interestingly, some samples show presence of *Solemya Pervernicosa*.
Solemya is a genus of saltwater clams, and a question that comes up is, how 
this organism, found in a marine environment, is found on these samples? Out 
of a few possible explanations, is it possible that these individuals had contact
with said organism, and the degree of cleanliness of their hands affect whether
it is seen or not? Or maybe it is something more innocent.

- I was surprised to see occurrences of E.coli, though rare.

- *Bartonella washoensis* This can cause meningitis in humans.


In general, this was an interesting pipeline of commands, and provided a glimpse 
into actual bioinformatics pipelines flows and applications.
It also seems like certain organisms end up as a large population found on human
hands, showing a complex microbiome. How might washing hands effect this, how 
often?
Harmful bacteria also seem to be present throughout, but perhaps in the amounts
they're present in, they aren't harmful, or simply unable to get past skin.
It makes sense since bacteria are ubiquitous, but was still surprising to me.

