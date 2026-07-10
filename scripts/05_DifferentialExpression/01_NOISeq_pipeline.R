###############################################################################
# Differential Expression using NOISeq
###############################################################################

library(NOISeq)

counts <- read.csv(
"../../data/processed/expression_matrix.csv",
row.names = 1
)

myfactors <- data.frame(
Condition=c(
"Flower",
"DAP30",
"DAP60",
"DAP90_Pulp",
"DAP90_Skin",
"DAH5",
"DAH10",
"DAH15"
)
)

mydata <- readData(
data = counts,
factors = myfactors
)

# Pairwise comparison example
res <- noiseq(
mydata,
k = 0.5,
factor = "Condition",
conditions = c("Flower","DAP30")
)

write.csv(
res@results,
"../../results/DEGs/Flower_vs_30DAP.csv"
)
