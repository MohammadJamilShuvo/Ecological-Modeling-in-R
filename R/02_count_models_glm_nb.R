# ============================================================
# 02_count_models_glm_nb.R
# Poisson and negative-binomial models for ecological counts
# ============================================================

source("R/00_setup.R")

dat <- read.csv("data/example_ecology_data.csv")

# Poisson GLM
poisson_model <- glm(
  arachnid_richness ~ elevation +
    canopy_closure +
    forest_structure_index +
    deadwood_volume +
    tree_microhabitats +
    percent_conifer,
  family = poisson(link = "log"),
  data = dat
)

# Negative-binomial GLM
nb_model <- MASS::glm.nb(
  arachnid_richness ~ elevation +
    canopy_closure +
    forest_structure_index +
    deadwood_volume +
    tree_microhabitats +
    percent_conifer,
  data = dat
)

cat("\nPoisson GLM\n")
print(summary(poisson_model))

cat("\nNegative-binomial GLM\n")
print(summary(nb_model))

# Compare information criteria
model_comparison <- AIC(poisson_model, nb_model)
print(model_comparison)

write.csv(
  model_comparison,
  "outputs/02_glm_model_comparison.csv",
  row.names = TRUE
)

# Basic dispersion check for Poisson model
dispersion_ratio <- sum(residuals(poisson_model, type = "pearson")^2) /
  df.residual(poisson_model)

cat("\nPoisson dispersion ratio:", round(dispersion_ratio, 2), "\n")

# Diagnostic panel for the selected NB model
png("outputs/02_negative_binomial_diagnostics.png", width = 1400, height = 1100, res = 150)
print(performance::check_model(nb_model))
dev.off()
