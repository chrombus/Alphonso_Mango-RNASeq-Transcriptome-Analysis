# Transcriptomic Analysis of Alphonso Mango Fruit Development and Ripening

## Overview

This project presents a reference-based RNA-Seq transcriptome analysis of Alphonso mango (*Mangifera indica*) to investigate molecular mechanisms involved in fruit development and ripening.

The workflow identifies differentially expressed genes (DEGs), tissue-specific expression patterns, gene co-expression modules, and highly correlated genes associated with fruit quality traits including aroma, flavour, and ripening.

---

## Objectives

- Reference-based transcriptome analysis
- Differential Gene Expression (edgeR)
- Hierarchical Clustering
- Weighted Gene Co-expression Network Analysis (WGCNA)
- Correlation-based Gene Network Analysis

---

## Dataset

Species:
- Mangifera indica (Alphonso)

Developmental Stages

- Flower
- 30 Days After Pollination (DAP)
- 60 DAP
- 90 DAP (Pulp)
- 90 DAP (Skin)
- 5 Days After Harvest (DAH)
- 10 DAH
- 15 DAH

---

## RNA-Seq Workflow

Raw RNA-Seq Reads
        │
        ▼
FastQC
        │
        ▼
fastp
        │
        ▼
HISAT2 Alignment
        │
        ▼
SAMtools
        │
        ▼
featureCounts
        │
        ▼
edgeR
        │
 ┌──────┴────────┐
 ▼               ▼
Clustering     WGCNA
        │
        ▼
Correlation Analysis

---

## Software Used

| Tool | Purpose |
|------|---------|
| FastQC | Read Quality Assessment |
| fastp | Read Filtering |
| HISAT2 | Genome Alignment |
| SAMtools | BAM Processing |
| featureCounts | Gene Quantification |
| edgeR | Differential Expression |
| WGCNA | Co-expression Analysis |
| R | Statistical Computing |

---

## Major Results

✔ Identified 35,756 annotated genes

✔ Stage-specific Differentially Expressed Genes

✔ Tissue-specific expression clusters

✔ Four major WGCNA modules

✔ Correlated gene networks associated with fruit development

---

## Repository Structure

scripts/
Contains all Bash and R scripts.

results/
Contains DEG tables, plots and analysis outputs.

workflow/
Pipeline diagram.

docs/
Internship report.

---

## Future Work

- GO Enrichment Analysis
- KEGG Pathway Analysis
- Hub Gene Identification
- Aroma Biosynthesis Pathway Analysis

---

## Citation

If you use this repository, please cite the original publication together with this work.
