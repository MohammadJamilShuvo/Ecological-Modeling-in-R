# ============================================================
# 04_random_forest.R
# Random forest regression and variable importance
# ============================================================

source("R/00_setup.R")

set.seed(42)

dat <- read.csv("data/example_ecology_data.csv")

rf_model <- randomForest::randomForest(
  total_richness ~ elevation +
    canopy_closure +
    forest_structure_index +
    deadwood_volume +
    tree_microhabitats +
    percent_conifer +
    mean_dbh,
  data = dat,
  ntree = 1000,
  importance = TRUE
)

print(rf_model)

importance_table <- as.data.frame(
  randomForest::importance(rf_model)
)

importance_table$predictor <- rownames(importance_table)
rownames(importance_table) <- NULL

write.csv(
  importance_table,
  "outputs/04_random_forest_importance.csv",
  row.names = FALSE
)

png("outputs/04_random_forest_importance.png", width = 1200, height = 900, res = 150)
randomForest::varImpPlot(
  rf_model,
  main = "Random forest variable importance"
)
dev.off()
