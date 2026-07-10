#!/bin/bash

set -euo pipefail

SAM="../../results/Alignment/SAM"

BAM="../../results/Alignment/BAM"

mkdir -p "$BAM"

for file in "$SAM"/*.sam
do

sample=$(basename "$file" .sam)

samtools view \
-bS \
"$file" \
> "$BAM/${sample}.bam"

done

echo "SAM → BAM conversion complete."
