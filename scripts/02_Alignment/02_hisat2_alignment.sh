#!/bin/bash

###############################################################################
# Script : 02_hisat2_alignment.sh
#
# Purpose:
# Align paired-end RNA-seq reads against the Alphonso mango genome.
###############################################################################

set -euo pipefail

THREADS=8

RAW="../../data/processed"

INDEX="../../data/reference/index/mango"

OUT="../../results/Alignment/SAM"

mkdir -p "$OUT"

for R1 in "$RAW"/*_R1.clean.fastq.gz
do

sample=$(basename "$R1" _R1.clean.fastq.gz)

R2="$RAW/${sample}_R2.clean.fastq.gz"

echo "=================================="
echo "Aligning $sample"
echo "=================================="

hisat2 \
-p $THREADS \
-x "$INDEX" \
-1 "$R1" \
-2 "$R2" \
-S "$OUT/${sample}.sam"

done

echo "Alignment completed."
