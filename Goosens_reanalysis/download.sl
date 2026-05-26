#!/bin/bash

#SBATCH -n 1
#SBATCH --cpus-per-task=100
#SBATCH --mem=100g
#SBATCH -t 5:00:00
#SBATCH --mail-type=begin,end,fail
#SBATCH --mail-user=arijitm@ad.unc.edu
module load sratoolkit
mkdir -p sra fastq tmp

while read SRR; do
    echo "Processing $SRR"

    # Download .sra
    prefetch $SRR --output-directory sra

    # Convert to FASTQ
    fasterq-dump sra/$SRR \
        --split-files \
        --threads 32 \
        --temp tmp \
        --outdir fastq

    # Compress output
    gzip fastq/${SRR}*.fastq

done < srr_ids.txt
