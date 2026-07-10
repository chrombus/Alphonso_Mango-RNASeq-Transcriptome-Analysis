library(ggplot2)

counts <- read.csv(
"../../data/processed/cpm_expression_matrix.csv",
row.names = 1
)

boxplot(
log2(counts+1),
las=2,
main="Normalized Expression Distribution"
)
