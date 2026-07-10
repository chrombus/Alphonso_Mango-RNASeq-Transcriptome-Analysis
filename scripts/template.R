###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script  : 05_DifferentialExpression/NOISeq_pipeline.R
#
# Author  : Mohd Hamza Khalid
#
# Institute : CSIR-National Chemical Laboratory (CSIR-NCL), Pune
#
# Description:
# This script performs differential gene expression analysis using NOISeq
# for RNA-seq datasets generated from multiple developmental stages of
# Alphonso mango fruit.
#
# Input:
#   - featureCounts matrix
#   - Sample metadata
#
# Output:
#   - Differentially expressed genes
#   - Upregulated genes
#   - Downregulated genes
#   - Summary statistics
#
# Dependencies:
#   NOISeq
#   tidyverse
#   data.table
#
# Usage:
#   source("NOISeq_pipeline.R")
#
###############################################################################

rm(list = ls())

# Load libraries -----------------------------------------------------------

library(tidyverse)
library(data.table)

# Set working directory ----------------------------------------------------

# setwd("your/project/path")

# Import data --------------------------------------------------------------

# analysis starts here
