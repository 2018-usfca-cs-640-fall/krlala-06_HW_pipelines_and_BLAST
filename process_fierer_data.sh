#!/bin/bash

# Script to process Fierer 16S dataset
# Including downloading from NCBI SRA
# Running fastqc, trimming, converting
# to fasta from fastq, and finally
# BLASTING with command -line blastn

# Karan Lala
# krlala@usfca.edu
# October , 2018

# the pipe and tail -n +2 is a handy way to exclude the first line
#for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
#do
#    fastq-dump -v $SRA_number -O data/raw_data
#done


# Run fastqc on all the files
#fastqc data/raw_data/*.fastq --outdir=output/fastqc

# Info on the Trimmomatic tool available here: http://www.usadellab.org/cms/index.php?page=trimmomatic
for file in data/raw_data/*.fastq
do
  TrimmomaticSE -threads 2 -phred33 "$file" data/trimmed/$(basename -s .fastq "$file").trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

#Convert fastq file to fasta
for file in data/trimmed/*
do
bioawk -c fastx '{print ">"$name"\n"$seq}' "$file" > data/trimmedfasta/$(basename -s .fastq "$file").trim.fasta
done


