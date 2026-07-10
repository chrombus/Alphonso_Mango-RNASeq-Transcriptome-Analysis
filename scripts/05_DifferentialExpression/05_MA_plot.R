###############################################################################
# MA Plot
###############################################################################

library(ggplot2)

deg <- read.csv(
"../../results/DEGs/DAP30_vs_Flower_UP.csv"
)

A <- log2(
(deg$DAP30_mean + deg$Flower_mean)/2 +1
)

ggplot(
deg,
aes(
x=A,
y=M
)
)+

geom_point(
color="steelblue",
alpha=0.7,
size=2
)+

geom_hline(
yintercept=0,
linetype="dashed",
color="red"
)+

theme_classic(base_size = 14)+

labs(
title="MA Plot",
x="Average Expression (A)",
y="Log2 Fold Change (M)"
)

ggsave(
"../../results/Figures/DAP30_vs_Flower_MA.png",
width=8,
height=6,
dpi=300
)
