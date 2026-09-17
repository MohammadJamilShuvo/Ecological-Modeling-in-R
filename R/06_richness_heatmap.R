# ============================================================
# 06_richness_heatmap.R
# Heatmap visualization of biodiversity patterns
# ============================================================

source("R/00_setup.R")

heatmap_dat <- read.csv("data/example_heatmap_data.csv")

p <- ggplot(
  heatmap_dat,
  aes(
    x = arthropod_group,
    y = substrate,
    fill = mean_richness
  )
) +
  geom_tile(color = "white") +
  geom_text(
    aes(label = mean_richness),
    size = 4
  ) +
  scale_fill_gradientn(
    colours = RColorBrewer::brewer.pal(9, "Blues"),
    name = "Mean richness"
  ) +
  labs(
    x = "Arthropod group",
    y = "Substrate / tree species",
    title = "Example biodiversity richness heatmap"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank()
  )

print(p)

ggsave(
  "outputs/06_richness_heatmap.png",
  plot = p,
  width = 8,
  height = 6,
  dpi = 300
)
