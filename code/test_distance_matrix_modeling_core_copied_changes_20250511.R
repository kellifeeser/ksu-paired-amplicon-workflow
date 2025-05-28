# ===============================
# full_analysis_core.R
# Reusable function-based analysis script
# ===============================

library(glue)
library(ggplot2)
library(vegan)
library(car)
library(coin)
library(nortest)
library(e1071)
library(cowplot)
library(dplyr)
library(tibble)

# why isnt extract_matrices function used in Compare Pairwise Geographic Distances function?
# write a loop to paste all sd colnames with ", " inbw so that it looks likes c("Site","Grass", ... )
# ---- Function: Extract Distance Matrices ----
extract_matrices <- function(KINGDOM, METAGROUPING, METASUBGROUP, GLOBAL, BETA) {
  beta_map <- c("Sorensen" = "beta.sor", "Turnover" = "beta.sim", "Nestedness" = "beta.sne")
  beta_key <- beta_map[BETA]
  
  if (tolower(GLOBAL) == "yes") {
    geo <- env_dist_matrices[["all"]][[glue("geodist_{KINGDOM}")]]
    comm <- betapart_results[[KINGDOM]][["all"]][["pairwise"]][[beta_key]]
  } else {
    geo <- env_dist_matrices[[METAGROUPING]][[glue("{METASUBGROUP}_geodist")]]
    comm_key <- glue("{METASUBGROUP}_{substr(KINGDOM, 1, 3)}")
    comm <- betapart_results[[KINGDOM]][[METAGROUPING]][["pairwise"]][[comm_key]][[beta_key]]
  }
  
  return(list(geodist = geo, commdist = comm))
}

# ---- Function: Compare Pairwise Geographic Distances ----
plot_spatial_distance_distribution <- function(METAGROUPING, METASUBGROUP, KINGDOM, save = FALSE) {
  dist1 <- env_dist_matrices[[METAGROUPING]][[glue("{METASUBGROUP}_geodist")]]
  other_key <- setdiff(names(env_dist_matrices[[METAGROUPING]]), glue("{METASUBGROUP}_geodist"))[1]
  dist2 <- env_dist_matrices[[METAGROUPING]][[other_key]]
  
  vec1 <- as.numeric(dist1)
  vec2 <- as.numeric(dist2)
  
  dist_df <- data.frame(
    Distance = c(vec1, vec2),
    Group = factor(c(rep(METASUBGROUP, length(vec1)), rep("Other", length(vec2))),
                   levels = c(METASUBGROUP, "Other"))
  )
  
  ad1 <- ad.test(vec1)
  ad2 <- ad.test(vec2)
  subtitle_text <- glue("{METASUBGROUP}: mean = {round(mean(vec1), 1)} km, p = {signif(ad1$p.value, 3)} | Other: mean = {round(mean(vec2), 1)} km, p = {signif(ad2$p.value, 3)}")
  
  col_1 <- "#8E0152"; col_2 <- "#7FBC41"
  qq1 <- ggplot(data.frame(Distance = vec1), aes(sample = Distance)) +
    stat_qq(color = col_1) + stat_qq_line(color = scales::alpha(col_1, 0.4)) +
    labs(title = glue("Q–Q: {METASUBGROUP}")) + theme_minimal()
  
  qq2 <- ggplot(data.frame(Distance = vec2), aes(sample = Distance)) +
    stat_qq(color = col_2) + stat_qq_line(color = scales::alpha(col_2, 0.4)) +
    labs(title = "Q–Q: Other") + theme_minimal()
  
  violin <- ggplot(dist_df, aes(x = Group, y = Distance, fill = Group)) +
    geom_violin(alpha = 0.3) + geom_boxplot(width = 0.15, outlier.shape = NA) +
    scale_fill_manual(values = c(METASUBGROUP = col_1, Other = col_2)) +
    labs(title = glue("Distribution of Spatial Distances ({KINGDOM}, {METAGROUPING})"),
         subtitle = subtitle_text, y = "Distance (km)", x = NULL) +
    theme_minimal()
  
  spatial_fig <- plot_grid(plot_grid(qq1, qq2, labels = c("A", "B"), ncol = 2),
                           violin, ncol = 1, rel_heights = c(0.4, 0.6))
  
  print(spatial_fig)
  
  if (save) {
    ggsave(glue("spatial_dist_{KINGDOM}_{METASUBGROUP}.png"), plot = spatial_fig,
           width = 10, height = 6, dpi = 300)
  }
}

# ---- Function: Spatial Structure of Explanatory Distance Matrix ----
test_spatial_structure_of_predd <- function(PREDD, KINGDOM, GLOBAL, PREDD_GROUPING = NULL, PREDD_SUBGROUP = NULL) {
  if (tolower(GLOBAL) == "yes") {
    pred_dist <- env_dist_matrices[["all"]][[glue("pred_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[["all"]][[glue("geodist_{KINGDOM}")]]
  } else {
    pred_dist <- env_dist_matrices[[PREDD_GROUPING]][[glue("{PREDD_SUBGROUP}_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[[PREDD_GROUPING]][[glue("{PREDD_SUBGROUP}_geodist")]]
  }
  
  mantel_env_geo <- mantel(pred_dist, geo_use, permutations = 999)
  r_pred <- round(mantel_env_geo$statistic, 2)
  p_pred <- signif(mantel_env_geo$signif, 3)
  
  cat(glue("
**Spatial Structure of Explanatory Matrix: {PREDD}**
- Mantel r = {r_pred}, p = {p_pred}
- Interpretation: {ifelse(p_pred < 0.05, 'Significant spatial structure detected', 'No significant spatial pattern')}
"))
}
