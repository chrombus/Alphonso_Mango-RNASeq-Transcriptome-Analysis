#!/bin/bash

###############################################################################
# Script : multiqc.sh
#
# Description:
# Combines all FastQC reports into a single MultiQC report.
###############################################################################

set -e

INPUT="../../results/QC/FastQC"
OUTPUT="../../results/QC/MultiQC"

mkdir -p "$OUTPUT"

multiqc "$INPUT" -o "$OUTPUT"

echo "MultiQC report generated."
