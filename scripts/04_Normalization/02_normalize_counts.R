###############################################################################
# Normalize Counts
###############################################################################

library(edgeR)

counts <- read.csv(
"../../data/processed/filtered_expression_matrix.csv",
row.names = 1
)

dge <- DGEList(counts)

dge <- calcNormFactors(dge)

cpm_matrix <- cpm(dge)

write.csv(
cpm_matrix,
"../../data/processed/cpm_expression_matrix.csv"
)
