#!/bin/bash

###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script  : fastqc.sh
#
# Author  : Mohd Hamza Khalid
#
# Description:
# Performs quality assessment of raw paired-end RNA-seq reads using FastQC.
#
# Input:
#   data/raw/*.fastq.gz
#
# Output:
#   results/QC/FastQC/
#
# Usage:
#   bash fastqc.sh
###############################################################################

set -e

RAW_DIR="../../data/raw"
OUT_DIR="../../results/QC/FastQC"

mkdir -p "$OUT_DIR"

echo "======================================="
echo "Running FastQC"
echo "======================================="

fastqc \
    "$RAW_DIR"/*.fastq.gz \
    --outdir "$OUT_DIR"

echo "---------------------------------------"
echo "FastQC completed successfully."
echo "Results saved to:"
echo "$OUT_DIR"
echo "---------------------------------------"
