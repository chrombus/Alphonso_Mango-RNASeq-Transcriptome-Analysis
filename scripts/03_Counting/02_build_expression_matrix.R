###############################################################################
# Build Expression Matrix
###############################################################################

library(data.table)
library(dplyr)

counts <- fread("../../results/Counts/featureCounts.txt",
                skip = 1)

# Remove annotation columns
expression <- counts %>%
  select(-(1:6))

# Set Gene IDs as row names
gene_ids <- counts$Geneid

expression <- as.data.frame(expression)

rownames(expression) <- gene_ids

write.csv(expression,
          "../../data/processed/expression_matrix.csv")
