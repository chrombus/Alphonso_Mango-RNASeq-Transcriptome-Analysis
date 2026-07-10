# 🍋 Alphonso_Mango-RNASeq-Transcriptome-Analysis

![License](https://img.shields.io/badge/License-MIT-green)
![R](https://img.shields.io/badge/R-4.4+-blue)
![Platform](https://img.shields.io/badge/Platform-Linux-orange)
![RNA-Seq](https://img.shields.io/badge/RNA--Seq-Bioinformatics-success)

## Overview

This repository contains a comprehensive RNA-seq analysis workflow to investigate the molecular mechanisms underlying fruit development and ripening in **Alphonso mango (*Mangifera indica* L.)**.

The study follows gene expression dynamics across multiple developmental and post-harvest stages using high-throughput RNA sequencing and downstream bioinformatics analyses. The workflow includes quality control, genome alignment, read quantification, differential gene expression analysis, hierarchical clustering, correlation-based co-expression network construction, and functional enrichment analysis.

The primary objective is to identify candidate genes and gene modules associated with fruit ripening, aroma development, and other physiological processes during mango fruit maturation.

---

# Project Objectives

- Perform quality assessment of RNA-seq reads
- Align sequencing reads to the Alphonso mango reference genome
- Quantify gene expression using featureCounts
- Identify differentially expressed genes (DEGs) using NOISeq
- Analyze temporal expression changes during fruit development
- Cluster genes based on expression profiles
- Construct correlation-based gene co-expression networks
- Identify candidate genes associated with ripening
- Perform Gene Ontology (GO) enrichment analysis

---

# Experimental Design

Eight developmental stages were included in this study.

| Stage | Description |
|-------|-------------|
| Flower | Floral tissue |
| 30 DAP | Fruit at 30 Days After Pollination |
| 60 DAP | Fruit at 60 Days After Pollination |
| 90 DAP (Pulp) | Mature fruit pulp |
| 90 DAP (Skin) | Mature fruit peel |
| 5 DAH | Five Days After Harvest |
| 10 DAH | Ten Days After Harvest |
| 15 DAH | Fifteen Days After Harvest |

---

# RNA-Seq Workflow

```text
Raw RNA-Seq Reads
        │
        ▼
Quality Assessment (FastQC)
        │
        ▼
Read Filtering (Fastp)
        │
        ▼
Genome Alignment (HISAT2)
        │
        ▼
Alignment Processing (SAMtools)
        │
        ▼
Read Quantification (featureCounts)
        │
        ▼
Expression Matrix Generation
        │
        ▼
Differential Expression Analysis (NOISeq)
        │
        ▼
Hierarchical Clustering
        │
        ▼
Correlation Analysis
        │
        ▼
Co-expression Network Construction
        │
        ▼
Gene Ontology Enrichment
        │
        ▼
Biological Interpretation
```

---

# Repository Structure

```
alphonso-mango-rnaseq-transcriptomics
│
├── data/
├── scripts/
├── results/
├── figures/
├── notebooks/
├── docs/
└── README.md
```

---

# Software and Tools

| Tool | Purpose |
|------|---------|
| FastQC | Quality assessment |
| Fastp | Adapter trimming and filtering |
| HISAT2 | Genome alignment |
| SAMtools | BAM processing |
| featureCounts | Gene expression quantification |
| NOISeq | Differential expression analysis |
| R | Statistical computing |
| Cytoscape | Co-expression network visualization |

---

# Key Analyses

- RNA-seq quality assessment
- Read preprocessing
- Genome alignment
- Gene quantification
- Differential expression analysis
- Hierarchical clustering
- Expression heatmaps
- Correlation analysis
- Gene co-expression network analysis
- GO enrichment analysis

---

# Results

The analysis identified differentially expressed genes across developmental stages and revealed tissue-specific expression patterns in pulp and skin. Correlation-based co-expression networks were used to identify candidate genes potentially involved in fruit ripening and associated biological processes.

Representative visualizations generated during the study include:

- Quality control reports
- Expression heatmaps
- Cluster-specific expression profiles
- Volcano plots
- Correlation matrices
- Co-expression networks
- GO enrichment plots

---

# Future Work

- Weighted Gene Co-expression Network Analysis (WGCNA)
- Pathway enrichment analysis
- Candidate gene prioritization
- Functional validation of key genes
- Integration with metabolomics and proteomics

---

# Citation

If you use this repository, please cite:

**Mohd Hamza Khalid.**
*Integrative Transcriptomic Analysis of Alphonso Mango Ripening Using Differential Expression, Clustering, and Correlation-Based Co-expression Network Analysis.*

---

# Author

**Mohd Hamza Khalid**

Bioinformatics • Transcriptomics • RNA-Seq Analysis

---

## License

This project is distributed under the MIT License.
