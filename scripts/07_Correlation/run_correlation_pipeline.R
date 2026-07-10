###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script : run_correlation_pipeline.R
#
#
# Description:
# Performs Pearson correlation analysis between a bait gene and all
# expressed genes.
###############################################################################

rm(list = ls())

library(dplyr)

############################
# User Settings
############################

bait_gene <- "LOC123222473"      # Change as required
threshold <- 0.90

############################
# Create folders
############################

dir.create("../../results/Correlation",
           recursive = TRUE,
           showWarnings = FALSE)

############################
# Load CPM Matrix
############################

expr <- read.csv(
  "../../data/processed/cpm_expression_matrix.csv",
  row.names = 1,
  check.names = FALSE
)

expr <- log2(expr + 1)

############################
# Check bait gene
############################

if(!(bait_gene %in% rownames(expr))){
  stop("Bait gene not found in expression matrix.")
}

bait_expression <- as.numeric(expr[bait_gene, ])

############################
# Calculate Pearson Correlation
############################

cor_values <- apply(expr, 1, function(x){

  cor(
    bait_expression,
    as.numeric(x),
    method = "pearson",
    use = "complete.obs"
  )

})

############################
# Build Results Table
############################

cor_table <- data.frame(

  Geneid = names(cor_values),

  Correlation = cor_values

)

############################
# Remove NA values
############################

cor_table <- cor_table |>

  filter(!is.na(Correlation))

############################
# Sort by correlation
############################

cor_table <- cor_table |>

  arrange(desc(abs(Correlation)))

############################
# Save full correlation table
############################

write.csv(

  cor_table,

  paste0(
    "../../results/Correlation/",
    bait_gene,
    "_all_correlations.csv"
  ),

  row.names = FALSE

)

############################
# Filter significant correlations
############################

filtered <- cor_table |>

  filter(abs(Correlation) >= threshold)

write.csv(

  filtered,

  paste0(
    "../../results/Correlation/",
    bait_gene,
    "_filtered_correlations.csv"
  ),

  row.names = FALSE

)

############################
# Create Cytoscape Edge File
############################

edges <- data.frame(

  Source = bait_gene,

  Target = filtered$Geneid,

  Weight = filtered$Correlation

)

write.csv(

  edges,

  paste0(
    "../../results/Correlation/",
    bait_gene,
    "_edges.csv"
  ),

  row.names = FALSE

)

############################
# Summary
############################

summary_table <- data.frame(

  Bait_Gene = bait_gene,

  Total_Genes = nrow(cor_table),

  Correlated_Genes = nrow(filtered),

  Threshold = threshold

)

write.csv(

  summary_table,

  paste0(
    "../../results/Correlation/",
    bait_gene,
    "_summary.csv"
  ),

  row.names = FALSE

)

cat("\n=====================================\n")
cat("Correlation Analysis Completed\n")
cat("Bait Gene :", bait_gene, "\n")
cat("Total Genes :", nrow(cor_table), "\n")
cat("Filtered Genes :", nrow(filtered), "\n")
cat("=====================================\n")
