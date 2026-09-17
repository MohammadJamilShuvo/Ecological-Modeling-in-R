# ============================================================
# 07_run_all.R
# Run the complete demonstration workflow
# ============================================================

scripts <- c(
  "R/01_correlation_analysis.R",
  "R/02_count_models_glm_nb.R",
  "R/03_generalized_additive_models.R",
  "R/04_random_forest.R",
  "R/05_structural_equation_modeling.R",
  "R/06_richness_heatmap.R"
)

for (script in scripts) {
  message("\nRunning: ", script)
  source(script)
}

message("\nAll modeling examples completed.")
message("Outputs are available in the outputs/ directory.")
