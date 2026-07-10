# Methodology

## Overview

This project presents a complete RNA sequencing (RNA-seq) analysis workflow for investigating transcriptional changes during fruit development and ripening in **Alphonso mango (*Mangifera indica* L.)**. The analysis includes quality assessment, preprocessing, genome alignment, expression quantification, differential expression analysis, hierarchical clustering, correlation-based co-expression network construction, and functional interpretation.

---

# Biological Samples

RNA-seq datasets were generated from different developmental and post-harvest stages of Alphonso mango.

## Developmental Stages

| Sample | Description |
|---------|-------------|
| Flower | Floral tissue |
| 30 DAP | 30 Days After Pollination |
| 60 DAP | 60 Days After Pollination |
| 90 DAP (Pulp) | Mature pulp tissue |
| 90 DAP (Skin) | Mature peel tissue |
| 5 DAH | Five Days After Harvest |
| 10 DAH | Ten Days After Harvest |
| 15 DAH | Fifteen Days After Harvest |

---

# Analysis Workflow

The complete computational workflow consisted of the following steps:

```
Raw Reads
    │
FastQC
    │
Fastp
    │
HISAT2
    │
SAMtools
    │
featureCounts
    │
Expression Matrix
    │
NOISeq
    │
Hierarchical Clustering
    │
Correlation Analysis
    │
Co-expression Network
    │
GO Enrichment
```

---

# 1. Quality Assessment

### Tool

FastQC

### Purpose

Quality assessment was performed on raw RNA-seq reads to evaluate sequencing quality before downstream analysis.

The following parameters were examined:

- Per-base sequence quality
- GC content
- Sequence duplication levels
- Adapter contamination
- Overrepresented sequences
- Read length distribution

---

# 2. Read Filtering

### Tool

Fastp

### Purpose

Low-quality bases and sequencing adapters were removed from raw reads.

Filtering improves mapping efficiency and reduces technical noise in downstream analyses.

---

# 3. Genome Alignment

### Tool

HISAT2

### Reference Genome

Alphonso mango reference genome

### Purpose

Filtered reads were aligned to the reference genome to determine the genomic origin of each transcript.

The resulting SAM files were converted into sorted BAM files using SAMtools.

---

# 4. Gene Expression Quantification

### Tool

featureCounts

### Purpose

Aligned reads were assigned to annotated genes to generate gene-level read counts.

The resulting count matrix served as the input for downstream statistical analyses.

---

# 5. Differential Gene Expression Analysis

### Tool

NOISeq

### Reason for Selection

The available RNA-seq dataset did not contain biological replicates.

NOISeq is a non-parametric method suitable for differential expression analysis of RNA-seq data without replicates.

### Pairwise Comparisons

- Flower vs 30 DAP
- 30 DAP vs 60 DAP
- 60 DAP vs 90 DAP (Pulp)
- 60 DAP vs 90 DAP (Skin)
- 90 DAP vs 5 DAH
- 5 DAH vs 10 DAH
- 10 DAH vs 15 DAH

Differentially expressed genes were identified using log2 fold change and NOISeq probability statistics.

---

# 6. Hierarchical Clustering

Normalized expression values were used to group genes according to similar expression patterns.

Separate clustering analyses were performed for:

- Pulp tissue
- Skin tissue

Genes exhibiting similar temporal expression profiles were grouped into expression clusters for downstream interpretation.

---

# 7. Correlation Analysis

Pearson correlation coefficients were calculated between selected bait genes and all expressed genes.

Highly correlated genes were identified using predefined correlation thresholds.

These correlations formed the basis for constructing gene co-expression networks.

---

# 8. Co-expression Network Analysis

Correlation networks were generated for selected bait genes involved in fruit ripening.

Each node represents a gene.

Each edge represents a significant positive correlation between two genes.

The resulting edge and node tables were visualized using Cytoscape.

---

# 9. Functional Annotation

Genes identified from differential expression and network analyses were annotated using available genome annotation files.

Functional descriptions included:

- Gene ID
- Protein ID
- Product annotation

---

# 10. Gene Ontology Enrichment

Gene Ontology (GO) enrichment analysis was performed to classify candidate genes into:

- Biological Process (BP)
- Molecular Function (MF)
- Cellular Component (CC)

This analysis provides biological interpretation of co-expressed gene modules.

---

# Software

| Software | Version |
|-----------|----------|
| FastQC | Latest |
| Fastp | Latest |
| HISAT2 | Latest |
| SAMtools | Latest |
| featureCounts | Latest |
| R | 4.x |
| NOISeq | Bioconductor |
| Cytoscape | 3.x |

---

# Summary

This workflow integrates RNA-seq preprocessing, expression analysis, clustering, correlation-based co-expression network construction, and functional enrichment to investigate molecular mechanisms regulating Alphonso mango fruit development and ripening.
