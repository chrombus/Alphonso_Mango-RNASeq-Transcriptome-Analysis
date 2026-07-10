###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script : run_clustering_pipeline.R
# Description:
# Complete hierarchical clustering workflow including:
#   • Data import
#   • Hierarchical clustering
#   • Cluster assignment
#   • Cluster export
#   • Cluster annotation
#   • Heatmap generation
#   • Cluster statistics
#
###############################################################################

rm(list=ls())

############################
# Load libraries
############################

library(dplyr)
library(pheatmap)

############################
# Create output folders
############################

dir.create("../../results/Clusters",
           recursive=TRUE,
           showWarnings=FALSE)

dir.create("../../results/Clusters/Individual_Clusters",
           recursive=TRUE,
           showWarnings=FALSE)

dir.create("../../results/Heatmaps",
           recursive=TRUE,
           showWarnings=FALSE)

############################
# Load Expression Matrix
############################

expr <- read.csv(
"../../data/processed/cpm_expression_matrix.csv",
row.names = 1,
check.names = FALSE
)

expr <- log2(expr+1)

cat("Genes :",nrow(expr),"\n")
cat("Samples :",ncol(expr),"\n")

############################
# Distance Matrix
############################

gene_dist <- dist(
expr,
method="euclidean"
)

############################
# Hierarchical Clustering
############################

hc <- hclust(
gene_dist,
method="ward.D2"
)

############################
# Save clustering object
############################

saveRDS(
hc,
"../../results/Clusters/Gene_Clusters.rds"
)

############################
# Dendrogram
############################

png(
"../../results/Clusters/Gene_Dendrogram.png",
width=2500,
height=1800,
res=300
)

plot(
hc,
hang=-1,
cex=.25,
main="Hierarchical Clustering of Alphonso Mango Genes",
xlab="Genes",
sub=""
)

dev.off()

############################
# Number of clusters
############################

k <- 8

############################
# Assign clusters
############################

cluster_membership <- cutree(
hc,
k=k
)

cluster_assignment <- data.frame(

Geneid=names(cluster_membership),

Cluster=cluster_membership

)

write.csv(

cluster_assignment,

"../../results/Clusters/Cluster_Assignment.csv",

row.names=FALSE

)

############################
# Export individual clusters
############################

for(i in 1:k){

genes <- names(cluster_membership[
cluster_membership==i
])

cluster_data <- expr[genes,]

write.csv(

cluster_data,

paste0(
"../../results/Clusters/Individual_Clusters/Cluster_",
i,
".csv"
)

)

}

############################
# Annotation
############################

annotation <- read.csv(
"../../data/processed/featureCounts_annotated.csv"
)

annotated <- left_join(

cluster_assignment,

annotation[,c(

"Geneid",

"ProteinID",

"Product"

)],

by="Geneid"

)

write.csv(

annotated,

"../../results/Clusters/Annotated_Clusters.csv",

row.names=FALSE

)

############################
# Heatmap
############################

png(

"../../results/Heatmaps/Cluster_Heatmap.png",

width=3500,

height=3500,

res=300

)

pheatmap(

expr,

scale="row",

show_rownames=FALSE,

fontsize_col=12,

clustering_method="ward.D2"

)

dev.off()

############################
# Cluster statistics
############################

stats <- cluster_assignment |>

count(Cluster)

colnames(stats) <- c(

"Cluster",

"Number_of_Genes"

)

write.csv(

stats,

"../../results/Clusters/Cluster_Statistics.csv",

row.names=FALSE

)

############################
# Summary
############################

cat("\n")
cat("=====================================\n")
cat("CLUSTERING PIPELINE COMPLETED\n")
cat("=====================================\n")
cat("Genes clustered :",nrow(expr),"\n")
cat("Clusters created :",k,"\n")
cat("Outputs saved in results/Clusters\n")
cat("=====================================\n")
