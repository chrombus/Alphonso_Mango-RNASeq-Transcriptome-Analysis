###############################################################################
# Annotate DEGs
###############################################################################

library(dplyr)

annotation <- read.csv(
"../../data/processed/featureCounts_annotated.csv"
)

deg <- read.csv(
"../../results/DEGs/DAP30_vs_Flower_UP.csv"
)

colnames(deg)[1] <- "Geneid"

annotated <- left_join(
deg,
annotation[,c("Geneid","ProteinID","Product")],
by="Geneid"
)

write.csv(
annotated,
"../../results/DEGs/DAP30_vs_Flower_UP_Annotated.csv",
row.names=FALSE
)
