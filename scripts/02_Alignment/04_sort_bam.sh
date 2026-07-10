#!/bin/bash

set -euo pipefail

INPUT="../../results/Alignment/BAM"

OUTPUT="../../results/Alignment/Sorted_BAM"

mkdir -p "$OUTPUT"

for bam in "$INPUT"/*.bam
do

sample=$(basename "$bam" .bam)

samtools sort \
-o "$OUTPUT/${sample}.sorted.bam" \
"$bam"

done

echo "Sorting complete."
