###############################################################################
# DEG Summary
###############################################################################

library(tidyverse)

input_dir <- "../../results/DEGs/"

files <- list.files(
  input_dir,
  pattern = "*.csv",
  full.names = TRUE
)

summary_table <- data.frame()

for(file in files){

    deg <- read.csv(file)

    comparison <- tools::file_path_sans_ext(basename(file))

    total <- nrow(deg)

    avg_logFC <- mean(deg$M)

    avg_prob <- mean(deg$prob)

    summary_table <- rbind(
      summary_table,
      data.frame(
        Comparison = comparison,
        Genes = total,
        Mean_logFC = round(avg_logFC,3),
        Mean_Probability = round(avg_prob,3)
      )
    )

}

write.csv(
summary_table,
"../../results/DEGs/DEG_summary.csv",
row.names = FALSE
)

print(summary_table)
