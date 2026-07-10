# RNA-Seq Analysis Workflow

## Overview

This document describes the complete workflow used to analyze RNA sequencing (RNA-seq) data from Alphonso mango fruit development and ripening. The workflow is organized into sequential steps, where the output of one stage serves as the input for the next.

---

# Workflow Summary

```
Raw FASTQ Files
        │
        ▼
Quality Control
(FastQC)
        │
        ▼
Read Trimming & Filtering
(Fastp)
        │
        ▼
Genome Indexing
(HISAT2-build)
        │
        ▼
Read Alignment
(HISAT2)
        │
        ▼
Alignment Processing
(SAMtools)
        │
        ▼
Gene Quantification
(featureCounts)
        │
        ▼
Expression Matrix
        │
        ▼
Differential Expression
(NOISeq)
        │
        ▼
Hierarchical Clustering
        │
        ▼
Correlation Analysis
        │
        ▼
Co-expression Network
        │
        ▼
Gene Ontology Enrichment
        │
        ▼
Biological Interpretation
```

---

# Step 1 – Input Data

### Input

Raw paired-end RNA-seq FASTQ files.

Example:

```
Flower_R1.fastq.gz
Flower_R2.fastq.gz

30DAP_R1.fastq.gz
30DAP_R2.fastq.gz
```

### Output

Raw sequencing reads ready for quality assessment.

---

# Step 2 – Quality Assessment

### Tool

FastQC

### Input

FASTQ files

### Output

- HTML reports
- ZIP reports

Stored in:

```
results/QC/
```

Purpose:

- Assess sequencing quality
- Detect adapter contamination
- Examine GC content
- Identify low-quality regions

---

# Step 3 – Read Filtering

### Tool

Fastp

### Input

Raw FASTQ files

### Output

Clean FASTQ files

Stored in

```
data/processed/
```

Purpose

- Remove adapters
- Remove low-quality bases
- Improve mapping efficiency

---

# Step 4 – Genome Indexing

### Tool

HISAT2-build

### Input

Reference genome FASTA

### Output

Genome index files

Stored in

```
data/reference/
```

This step is performed only once.

---

# Step 5 – Genome Alignment

### Tool

HISAT2

### Input

Filtered FASTQ files

Reference genome index

### Output

SAM files

Purpose

Align RNA-seq reads to the Alphonso mango reference genome.

---

# Step 6 – BAM Processing

### Tool

SAMtools

Operations:

- Convert SAM → BAM
- Sort BAM
- Index BAM

Output:

```
results/Alignment/
```

---

# Step 7 – Gene Quantification

### Tool

featureCounts

Input:

- Sorted BAM files
- Genome annotation (GTF)

Output:

```
featureCounts.txt
```

Stored in

```
results/Counts/
```

---

# Step 8 – Expression Matrix

The raw read counts were converted into an expression matrix for downstream statistical analyses.

Output

```
expression_matrix.csv
```

Stored in

```
data/processed/
```

---

# Step 9 – Differential Expression Analysis

### Tool

NOISeq

Comparisons:

- Flower vs 30 DAP
- 30 DAP vs 60 DAP
- 60 DAP vs 90 DAP (Pulp)
- 60 DAP vs 90 DAP (Skin)
- 90 DAP vs 5 DAH
- 5 DAH vs 10 DAH
- 10 DAH vs 15 DAH

Output

Differentially expressed genes (DEGs)

Stored in

```
results/DEGs/
```

---

# Step 10 – Hierarchical Clustering

Input

Normalized expression matrix

Output

- Cluster assignments
- Cluster heatmaps

Stored in

```
results/Clusters/
```

Separate analyses were performed for:

- Pulp
- Skin

---

# Step 11 – Correlation Analysis

Pearson correlation coefficients were calculated between bait genes and all expressed genes.

Output

Correlation matrices

Stored in

```
results/Correlation/
```

---

# Step 12 – Co-expression Network

Highly correlated genes were used to construct gene co-expression networks.

Output

- Edge tables
- Node tables
- Cytoscape session files

Stored in

```
results/Network/
```

---

# Step 13 – Functional Enrichment

Gene Ontology enrichment was performed using candidate genes obtained from the differential expression and co-expression analyses.

Output

- GO tables
- GO plots

Stored in

```
results/GO/
```

---

# Final Outputs

The workflow produces:

- Quality control reports
- Alignment statistics
- Gene count matrix
- Differentially expressed genes
- Expression heatmaps
- Cluster assignments
- Correlation matrices
- Co-expression networks
- Functional enrichment results

---

# Directory Overview

```
data/
    raw/
    processed/
    reference/

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

results/
    QC/
    Alignment/
    Counts/
    DEGs/
    Clusters/
    Correlation/
    Network/
    GO/
```

---

# Reproducibility

Each analysis step is organized as an independent script. Running the scripts in numerical order reproduces the complete analysis workflow from raw sequencing reads to biological interpretation.
