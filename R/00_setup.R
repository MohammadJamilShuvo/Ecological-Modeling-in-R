# ============================================================
# Ecological Modeling in R
# 00_setup.R
# ============================================================

packages <- c(
  "tidyverse",
  "corrplot",
  "MASS",
  "mgcv",
  "performance",
  "randomForest",
  "lavaan",
  "semPlot",
  "RColorBrewer"
)

missing_packages <- packages[!vapply(
  packages,
  requireNamespace,
  logical(1),
  quietly = TRUE
)]

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}

invisible(lapply(packages, library, character.only = TRUE))

if (!dir.exists("outputs")) {
  dir.create("outputs", recursive = TRUE)
}

message("Setup complete.")
