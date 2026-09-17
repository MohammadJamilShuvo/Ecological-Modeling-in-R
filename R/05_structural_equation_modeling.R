# ============================================================
# 05_structural_equation_modeling.R
# Structural equation model for direct and indirect effects
# ============================================================

source("R/00_setup.R")

dat <- read.csv("data/example_ecology_data.csv")

sem_dat <- dat %>%
  select(
    forest_structure_index,
    canopy_closure,
    deadwood_volume,
    tree_microhabitats,
    arachnid_richness,
    collembola_richness,
    beetle_richness,
    total_richness
  ) %>%
  mutate(across(everything(), ~ as.numeric(scale(.x))))

# A compact example causal structure:
# forest structure -> habitat features
# habitat features -> arthropod groups
# arthropod groups -> total richness
sem_model <- '
  deadwood_volume ~ forest_structure_index + canopy_closure
  tree_microhabitats ~ forest_structure_index + deadwood_volume

  arachnid_richness ~ canopy_closure + tree_microhabitats
  collembola_richness ~ canopy_closure + deadwood_volume + tree_microhabitats
  beetle_richness ~ deadwood_volume + tree_microhabitats

  total_richness ~ arachnid_richness + collembola_richness + beetle_richness
'

sem_fit <- lavaan::sem(
  sem_model,
  data = sem_dat,
  estimator = "ML",
  missing = "FIML"
)

print(
  summary(
    sem_fit,
    standardized = TRUE,
    fit.measures = TRUE,
    rsquare = TRUE
  )
)

fit_stats <- lavaan::fitMeasures(
  sem_fit,
  c("chisq", "df", "pvalue", "cfi", "tli", "rmsea", "srmr")
)

print(fit_stats)

write.csv(
  data.frame(metric = names(fit_stats), value = as.numeric(fit_stats)),
  "outputs/05_sem_fit_statistics.csv",
  row.names = FALSE
)

png("outputs/05_sem_path_diagram.png", width = 1500, height = 1100, res = 150)
semPlot::semPaths(
  sem_fit,
  what = "std",
  whatLabels = "std",
  layout = "tree2",
  residuals = FALSE,
  intercepts = FALSE,
  edge.label.cex = 0.9,
  sizeMan = 7,
  nCharNodes = 0
)
dev.off()
