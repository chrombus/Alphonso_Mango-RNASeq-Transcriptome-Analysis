###############################################################################
# Project : Integrative Transcriptomic Analysis of Alphonso Mango Ripening
#
# Script : run_network_pipeline.R
#
#
# Description:
# Builds a bait gene-centered co-expression network from filtered
# Pearson correlation results and exports Cytoscape-ready files.
###############################################################################

rm(list = ls())

library(dplyr)

############################
# User Settings
############################

bait_gene <- "LOC123222473"

############################
# Create folders
############################

dir.create("../../results/Network",
           recursive=TRUE,
           showWarnings=FALSE)

############################
# Load filtered correlations
############################

edges <- read.csv(

paste0(

"../../results/Correlation/",

bait_gene,

"_filtered_correlations.csv"

)

)

############################
# Annotation
############################

annotation <- read.csv(

"../../data/processed/featureCounts_annotated.csv"

)

############################
# Create Edge Table
############################

edge_table <- data.frame(

Source=bait_gene,

Target=edges$Geneid,

Weight=edges$Correlation

)

write.csv(

edge_table,

paste0(

"../../results/Network/",

bait_gene,

"_Edge_Table.csv"

),

row.names=FALSE

)

############################
# Create Node Table
############################

nodes <- unique(

c(

bait_gene,

edges$Geneid

)

)

node_table <- data.frame(

Geneid=nodes

)

node_table <- left_join(

node_table,

annotation[,c(

"Geneid",

"ProteinID",

"Product"

)],

by="Geneid"

)

write.csv(

node_table,

paste0(

"../../results/Network/",

bait_gene,

"_Node_Table.csv"

),

row.names=FALSE

)

############################
# Network Statistics
############################

network_summary <- data.frame(

Bait_Gene=bait_gene,

Nodes=nrow(node_table),

Edges=nrow(edge_table),

Mean_Correlation=mean(edge_table$Weight),

Max_Correlation=max(edge_table$Weight),

Min_Correlation=min(edge_table$Weight)

)

write.csv(

network_summary,

paste0(

"../../results/Network/",

bait_gene,

"_Network_Summary.csv"

),

row.names=FALSE

)

############################
# Degree Statistics
############################

degree_table <- edge_table |>

count(Source)

degree_table <- data.frame(

Gene=bait_gene,

Degree=nrow(edge_table)

)

write.csv(

degree_table,

paste0(

"../../results/Network/",

bait_gene,

"_Degree.csv"

),

row.names=FALSE

)

############################
# Finished
############################

cat("\n=====================================\n")
cat("Network Construction Completed\n")
cat("=====================================\n")
cat("Bait Gene :",bait_gene,"\n")
cat("Nodes :",nrow(node_table),"\n")
cat("Edges :",nrow(edge_table),"\n")
cat("=====================================\n")
