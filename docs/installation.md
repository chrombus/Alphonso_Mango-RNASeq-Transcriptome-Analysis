# Installation Guide

## Overview

This guide describes how to set up the software environment required to reproduce the RNA-seq analysis workflow presented in this repository.

The workflow was developed and tested on Linux using R and standard bioinformatics tools.

---

# System Requirements

## Operating System

- Ubuntu 22.04 LTS (recommended)
- Ubuntu 20.04 LTS
- Other Linux distributions should also work

---

# Hardware Requirements

Minimum:

- 8 GB RAM
- Dual-core processor
- 100 GB storage

Recommended:

- 32 GB RAM or more
- Quad-core (or higher) processor
- 500 GB available storage
- SSD storage for faster processing

---

# Software Requirements

The following software should be installed before running the analysis.

| Software | Purpose |
|----------|---------|
| FastQC | Quality assessment |
| Fastp | Read trimming |
| HISAT2 | Genome alignment |
| SAMtools | Alignment processing |
| featureCounts (Subread) | Read counting |
| R (≥ 4.4) | Statistical analysis |
| RStudio (optional) | R development environment |
| Cytoscape | Network visualization |

---

# Installing Bioinformatics Tools

## FastQC

```bash
sudo apt install fastqc
```

Verify installation:

```bash
fastqc --version
```

---

## Fastp

```bash
sudo apt install fastp
```

Verify installation:

```bash
fastp --version
```

---

## HISAT2

```bash
sudo apt install hisat2
```

Verify installation:

```bash
hisat2 --version
```

---

## SAMtools

```bash
sudo apt install samtools
```

Verify installation:

```bash
samtools --version
```

---

## featureCounts (Subread)

```bash
sudo apt install subread
```

Verify installation:

```bash
featureCounts -v
```

---

# Installing R

Install R from your operating system's package manager or from the official R project website.

Verify installation:

```bash
R --version
```

---

# Required R Packages

Start R:

```r
install.packages(c(
  "tidyverse",
  "data.table",
  "pheatmap",
  "corrplot",
  "igraph",
  "reshape2",
  "ggplot2"
))

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("NOISeq")
```

---

# Cytoscape

Download and install the latest version of Cytoscape for network visualization.

---

# Clone the Repository

```bash
git clone https://github.com/<your-username>/alphonso-mango-rnaseq-transcriptomics.git
```

Move into the project directory:

```bash
cd alphonso-mango-rnaseq-transcriptomics
```

---

# Directory Check

Your repository should have the following structure before starting the analysis:

```text
data/
scripts/
results/
docs/
assets/
```

---

# Input Files

Place the following files in the appropriate directories before running the pipeline.

## Raw RNA-seq reads

```
data/raw/
```

## Reference genome

```
data/reference/
```

Required files:

- Genome FASTA
- Genome annotation (GTF)

---

# Running the Workflow

Run the scripts in numerical order:

```text
01_QC
↓

02_Alignment
↓

03_Counting
↓

04_Normalization
↓

05_DifferentialExpression
↓

06_Clustering
↓

07_Correlation
↓

08_CoexpressionNetwork
↓

09_GO
```

---

# Expected Output

After successful execution, the repository will contain:

- Quality control reports
- Alignment files
- Gene count matrix
- Differentially expressed genes
- Cluster assignments
- Correlation matrices
- Co-expression networks
- GO enrichment results
- Publication-quality figures

---

# Troubleshooting

If you encounter installation or package issues, refer to:

```
docs/troubleshooting.md
```

for common solutions.
