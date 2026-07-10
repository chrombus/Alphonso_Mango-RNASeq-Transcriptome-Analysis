# Usage Guide

## Overview

This document describes how to execute the complete RNA-seq analysis workflow.

The workflow is organized into numbered directories inside the `scripts/` folder.

Run the scripts sequentially from **01** to **09**.

---

# Project Structure

```
scripts/

01_QC/
02_Alignment/
03_Counting/
04_Normalization/
05_DifferentialExpression/
06_Clustering/
07_Correlation/
08_CoexpressionNetwork/
09_GO/
10_Visualization/
```

---

# Step 1 — Quality Assessment

Directory

```
scripts/01_QC/
```

Purpose

Evaluate sequencing quality before downstream analysis.

Input

```
data/raw/*.fastq.gz
```

Example

```bash
bash fastqc.sh
```

Output

```
results/QC/
```

Files generated

- HTML reports
- ZIP reports

---

# Step 2 — Read Filtering

Directory

```
scripts/01_QC/
```

Run

```bash
bash fastp.sh
```

Input

```
Raw FASTQ files
```

Output

```
Filtered FASTQ files
```

Stored in

```
data/processed/
```

---

# Step 3 — Genome Alignment

Directory

```
scripts/02_Alignment/
```

Run

```bash
bash hisat2_alignment.sh
```

Input

```
Filtered FASTQ

Genome Index
```

Output

```
SAM files
```

---

# Step 4 — BAM Processing

Run

```bash
bash samtools_sort.sh
```

Output

```
Sorted BAM files
Indexed BAM files
```

Stored in

```
results/Alignment/
```

---

# Step 5 — Gene Quantification

Directory

```
scripts/03_Counting/
```

Run

```bash
bash featureCounts.sh
```

Input

```
Sorted BAM files
Annotation GTF
```

Output

```
featureCounts.txt
```

---

# Step 6 — Expression Matrix

Run

```R
source("build_expression_matrix.R")
```

Output

```
expression_matrix.csv
```

---

# Step 7 — Differential Expression

Directory

```
scripts/05_DifferentialExpression/
```

Run

```R
source("NOISeq_pipeline.R")
```

Comparisons

- Flower vs 30 DAP

- 30 DAP vs 60 DAP

- 60 DAP vs 90 DAP (Pulp)

- 60 DAP vs 90 DAP (Skin)

- 90 DAP vs 5 DAH

- 5 DAH vs 10 DAH

- 10 DAH vs 15 DAH

Output

```
results/DEGs/
```

Generated files

```
CSV tables

Upregulated genes

Downregulated genes

Summary statistics
```

---

# Step 8 — Hierarchical Clustering

Directory

```
scripts/06_Clustering/
```

Run

```R
source("hierarchical_clustering.R")
```

Input

```
Expression Matrix
```

Output

```
Cluster assignments

Heatmaps

Expression profiles
```

Stored in

```
results/Clusters/
```

---

# Step 9 — Correlation Analysis

Directory

```
scripts/07_Correlation/
```

Run

```R
source("correlation_network.R")
```

Input

```
Expression Matrix
```

Output

```
Correlation Matrix

Edge Table
```

Stored in

```
results/Correlation/
```

---

# Step 10 — Co-expression Network

Directory

```
scripts/08_CoexpressionNetwork/
```

Run

```R
source("bait_gene_network.R")
```

Input

```
Correlation Matrix
```

Output

```
Node Table

Edge Table

Network Files
```

These files can be imported directly into Cytoscape.

---

# Step 11 — GO Enrichment

Directory

```
scripts/09_GO/
```

Run

```R
source("GO_analysis.R")
```

Output

```
GO Tables

GO Plots

Functional Categories
```

Stored in

```
results/GO/
```

---

# Step 12 — Visualization

Directory

```
scripts/10_Visualization/
```

Scripts generate

- Heatmaps

- Volcano plots

- Correlation plots

- Cluster profiles

- Network figures

- GO enrichment plots

Output

```
results/Figures/
```

---

# Complete Pipeline

```
Raw FASTQ

↓

FastQC

↓

Fastp

↓

HISAT2

↓

SAMtools

↓

featureCounts

↓

Expression Matrix

↓

NOISeq

↓

Hierarchical Clustering

↓

Correlation Analysis

↓

Co-expression Network

↓

GO Enrichment

↓

Visualization
```

---

# Expected Results

The workflow generates

✅ Quality reports

✅ Alignment files

✅ Gene count matrix

✅ Differentially expressed genes

✅ Heatmaps

✅ Cluster assignments

✅ Correlation matrices

✅ Gene co-expression networks

✅ GO enrichment analysis

✅ Publication-quality figures
