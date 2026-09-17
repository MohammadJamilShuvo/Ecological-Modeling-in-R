# ============================================================
# 03_generalized_additive_models.R
# GAMs for nonlinear ecological responses
# ============================================================

source("R/00_setup.R")

dat <- read.csv("data/example_ecology_data.csv")

gam_model <- mgcv::gam(
  collembola_richness ~
    s(elevation, k = 5) +
    s(canopy_closure, k = 5) +
    s(deadwood_volume, k = 5) +
    s(tree_microhabitats, k = 5) +
    forest_structure_index,
  family = nb(),
  method = "REML",
  data = dat
)

print(summary(gam_model))
print(mgcv::gam.check(gam_model))

png("outputs/03_gam_smooths.png", width = 1500, height = 1100, res = 150)
par(mfrow = c(2, 2))
plot(
  gam_model,
  shade = TRUE,
  pages = 1,
  residuals = TRUE
)
dev.off()

# Fit the same generic GAM structure to several biodiversity responses
responses <- c(
  "arachnid_richness",
  "collembola_richness",
  "beetle_richness"
)

gam_models <- lapply(responses, function(response) {
  formula <- as.formula(
    paste0(
      response,
      " ~ s(elevation, k=5) + s(canopy_closure, k=5) + ",
      "s(deadwood_volume, k=5) + s(tree_microhabitats, k=5) + ",
      "forest_structure_index"
    )
  )

  mgcv::gam(
    formula,
    family = nb(),
    method = "REML",
    data = dat
  )
})

names(gam_models) <- responses

gam_aic <- data.frame(
  response = responses,
  AIC = vapply(gam_models, AIC, numeric(1))
)

print(gam_aic)
write.csv(gam_aic, "outputs/03_gam_aic.csv", row.names = FALSE)
