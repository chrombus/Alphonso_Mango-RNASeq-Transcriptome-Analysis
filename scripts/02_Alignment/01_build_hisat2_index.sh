#!/bin/bash

###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script : 01_build_hisat2_index.sh
#
# Purpose:
# Build HISAT2 genome index from the reference genome.
#
###############################################################################

set -euo pipefail

GENOME="../../data/reference/genome.fa"
INDEX="../../data/reference/index/mango"

mkdir -p ../../data/reference/index

echo "Building HISAT2 index..."

hisat2-build \
"$GENOME" \
"$INDEX"

echo "Genome index successfully created."
