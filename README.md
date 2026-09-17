# Ecological Modeling in R

A reusable portfolio of **ecological and biodiversity modeling workflows in R**, generalized from analyses developed for a forest arthropod eDNA study.

This repository is designed to demonstrate practical experience with statistical modeling, ecological data analysis, model diagnostics, machine learning, structural equation modeling, and visualization. The examples use **synthetic data**, so the repository is independent of any single manuscript or study system.

## Methods demonstrated

- Pearson correlation analysis and correlation matrices
- Poisson generalized linear models (GLMs)
- Negative-binomial GLMs for overdispersed count data
- Model diagnostics and AIC-based model comparison
- Generalized additive models (GAMs)
- Random forest regression and variable importance
- Structural equation modeling (SEM)
- Ecological richness heatmaps
- Reproducible modular R workflows

<img width="1672" height="941" alt="9247e345-1cb3-4ccc-b8d0-d8013a7246af" src="https://github.com/user-attachments/assets/68a2aaee-a057-43f5-8fb7-05d88be1d3fb" />

## Repository structure

```text
Ecological-Modeling-in-R/
├── README.md
├── LICENSE
├── .gitignore
├── ORIGIN.md
├── data/
│   ├── example_ecology_data.csv
│   └── example_heatmap_data.csv
├── R/
│   ├── 00_setup.R
│   ├── 01_correlation_analysis.R
│   ├── 02_count_models_glm_nb.R
│   ├── 03_generalized_additive_models.R
│   ├── 04_random_forest.R
│   ├── 05_structural_equation_modeling.R
│   ├── 06_richness_heatmap.R
│   └── 07_run_all.R
└── outputs/
```

## Quick start

Open the repository as an RStudio project/folder and run:

```r
source("R/07_run_all.R")
```

The script installs missing packages, runs the workflow, and saves example figures in `outputs/`.

## Example data

`data/example_ecology_data.csv` is a synthetic ecological dataset containing environmental predictors and biodiversity count responses. It is included only for demonstration and teaching purposes.

Variables include:

- elevation
- canopy closure
- forest structure index
- deadwood volume
- tree-related microhabitat abundance
- conifer percentage
- mean DBH
- arthropod-group richness
- total richness

## Skills represented

### Count-data modeling

The repository compares Poisson and negative-binomial GLMs and demonstrates why distribution choice matters for ecological count responses.

### Nonlinear ecological responses

GAMs are used to model flexible nonlinear relationships between biodiversity responses and environmental gradients.

### Machine learning

Random forest regression is used to model biodiversity responses and evaluate predictor importance.

### Structural equation modeling

A compact SEM illustrates direct and indirect relationships among forest structure, habitat features, and biodiversity responses.

### Reproducible visualization

Correlation plots, model-effect plots, variable-importance plots, SEM diagrams, and heatmaps are produced from modular scripts.

## Packages

Main packages:

- `tidyverse`
- `corrplot`
- `MASS`
- `mgcv`
- `performance`
- `randomForest`
- `lavaan`
- `semPlot`
- `RColorBrewer`

## Background

This portfolio repository was generalized from analytical code developed for:

**Shuvo, M. J., Tabassum, T., & Segelbacher, G. (2025). Optimizing eDNA metabarcoding techniques for assessing arthropod communities in tree‐related microhabitats. Environmental DNA, 7(1), e70064. https://doi.org/10.1002/edn3.70064**
&
**Shuvo, M. J., Wohlwend, M., Heer, K., Paillet, Y., & Segelbacher, G. (2026). Influence of Deadwood, Tree‐Related Microhabitats, and Forest Structural Features on Saproxylic Arthropod Diversity. Ecology and evolution, 16(5), e73600. https://doi.org/10.1002/ece3.73600**

## Author

**Mohammad Jamil Shuvo**  
Ecological genetics · molecular ecology · biodiversity genomics · ecological modeling · reproducible workflows

## License

Code in this repository is released under the MIT License. The synthetic example datasets are provided for unrestricted educational and demonstration use.
