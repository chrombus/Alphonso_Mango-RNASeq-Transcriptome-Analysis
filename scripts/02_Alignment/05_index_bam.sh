#!/bin/bash

set -euo pipefail

INPUT="../../results/Alignment/Sorted_BAM"

for bam in "$INPUT"/*.sorted.bam
do

samtools index "$bam"

done

echo "Indexing complete."
