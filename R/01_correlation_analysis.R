# ============================================================
# 01_correlation_analysis.R
# Correlation analysis for environmental and biodiversity data
# ============================================================

source("R/00_setup.R")

dat <- read.csv("data/example_ecology_data.csv")

environment_vars <- dat %>%
  select(
    elevation,
    canopy_closure,
    forest_structure_index,
    deadwood_volume,
    tree_microhabitats,
    percent_conifer,
    mean_dbh
  )

biodiversity_vars <- dat %>%
  select(
    arachnid_richness,
    collembola_richness,
    beetle_richness,
    total_richness
  )

environment_cor <- cor(
  environment_vars,
  use = "pairwise.complete.obs",
  method = "pearson"
)

biodiversity_cor <- cor(
  biodiversity_vars,
  use = "pairwise.complete.obs",
  method = "pearson"
)

png("outputs/01_correlation_environment.png", width = 1400, height = 1100, res = 150)
corrplot(
  environment_cor,
  method = "color",
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45
)
dev.off()

png("outputs/01_correlation_biodiversity.png", width = 1200, height = 1000, res = 150)
corrplot(
  biodiversity_cor,
  method = "color",
  type = "upper",
  order = "hclust",
  tl.col = "black",
  tl.srt = 45
)
dev.off()

print(round(environment_cor, 2))
print(round(biodiversity_cor, 2))
