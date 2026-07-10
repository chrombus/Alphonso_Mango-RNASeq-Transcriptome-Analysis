###############################################################################
# Filter Lowly Expressed Genes
###############################################################################

library(edgeR)

counts <- read.csv(
"../../data/processed/expression_matrix.csv",
row.names = 1
)

dge <- DGEList(counts)

keep <- filterByExpr(dge)

filtered <- counts[keep, ]

write.csv(
filtered,
"../../data/processed/filtered_expression_matrix.csv"
)
