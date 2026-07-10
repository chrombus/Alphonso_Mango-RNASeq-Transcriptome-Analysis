###############################################################################
# Volcano Plot
###############################################################################

library(ggplot2)

deg <- read.csv(
"../../results/DEGs/DAP30_vs_Flower_UP.csv"
)

ggplot(deg,
aes(
x=M,
y=-log10(1-prob+1e-10)
))+

geom_point(
color="firebrick",
size=2,
alpha=0.8
)+

theme_bw(base_size = 14)+

labs(
title="DAP30 vs Flower",
x="Log2 Fold Change (M)",
y="-log10(1 - Probability)"
)

ggsave(
"../../results/Figures/DAP30_vs_Flower_Volcano.png",
width=8,
height=6,
dpi=300
)
