#!/bin/bash

###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script  : fastp.sh
#
# Author  : Mohd Hamza Khalid
#
# Description:
# Performs adapter trimming and quality filtering using fastp.
#
# Input:
#   data/raw/
#
# Output:
#   data/processed/
#
###############################################################################

set -e

RAW="../../data/raw"
OUT="../../data/processed"

mkdir -p "$OUT"

for R1 in "$RAW"/*_R1.fastq.gz
do

sample=$(basename "$R1" _R1.fastq.gz)

R2="$RAW/${sample}_R2.fastq.gz"

echo "Processing $sample"

fastp \
-i "$R1" \
-I "$R2" \
-o "$OUT/${sample}_R1.clean.fastq.gz" \
-O "$OUT/${sample}_R2.clean.fastq.gz" \
-h "$OUT/${sample}.html" \
-j "$OUT/${sample}.json"

done

echo "All samples processed."
