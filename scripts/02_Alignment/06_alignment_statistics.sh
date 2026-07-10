#!/bin/bash

set -euo pipefail

INPUT="../../results/Alignment/Sorted_BAM"

OUTPUT="../../results/Alignment/Statistics"

mkdir -p "$OUTPUT"

for bam in "$INPUT"/*.sorted.bam
do

sample=$(basename "$bam" .sorted.bam)

samtools flagstat \
"$bam" \
> "$OUTPUT/${sample}_flagstat.txt"

done

echo "Alignment statistics generated."
