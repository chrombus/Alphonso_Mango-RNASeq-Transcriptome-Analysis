#!/bin/bash

###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script : 01_featureCounts.sh
#
#
# Description:
# Quantifies gene expression by assigning aligned reads to annotated genes
# using featureCounts.
#
# Input:
#   - Sorted BAM files
#   - Genome annotation (GTF)
#
# Output:
#   - featureCounts.txt
#
###############################################################################

set -euo pipefail

THREADS=8

GTF="../../data/reference/annotation.gtf"

BAM_DIR="../../results/Alignment/Sorted_BAM"

OUT="../../results/Counts"

mkdir -p "$OUT"

echo "Running featureCounts..."

featureCounts \
-T $THREADS \
-p \
-a "$GTF" \
-o "$OUT/featureCounts.txt" \
"$BAM_DIR"/*.sorted.bam

echo "Gene counting completed."
