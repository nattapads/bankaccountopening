library(tidyverse)
library(plotly)
library(factoextra)

# Data preparation
df = read.csv('BankingSurveyModified.csv')
df.active <- df[, 1:13]
head(df)
head(df.active)

# PCA Computation
res.pca <- prcomp(df.active, scale = TRUE)

# Visualise PCA
fviz_pca_var(res.pca,
             col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE)

# Visualise PCA grouped by column
gpbyComp <- as.factor(df$Job)
fviz_pca_biplot(res.pca, 
                col.ind = gpbyComp,
                addEllipses = T,
                ellipse.type = "confidence",
                ellipse.level = 0.95,
                col.var = "black",
                repel = TRUE )