# ===============================
# full_analysis_core.R
# Reusable analysis script for spatial modeling and decay analyses
# ===============================

# ---- Pre-body setup ----
# Required libraries (assume already loaded in Rmd)
# Requires global parameters:
#   KINGDOM, METAGROUPING, GLOBAL, BETA, PREDD

# Maps beta type to matrix key
beta_map <- c("Sorensen" = "beta.sor", "Turnover" = "beta.sim", "Nestedness" = "beta.sne")
beta_key <- beta_map[BETA]

# ---- Matrix Extraction ----
# Extract compositional dissimilarity and geographic distances

if (tolower(GLOBAL) == "yes") {
  geo_key <- glue::glue("geodist_{KINGDOM}")
  geodist <- env_dist_matrices[["all"]][[geo_key]]
  commdist <- betapart_results[[KINGDOM]][["all"]][["pairwise"]][[beta_key]]
} else {
  geo_key <- glue::glue("{METAGROUPING}_geodist")
  comm_key <- glue::glue("{METAGROUPING}_{substr(KINGDOM, 1, 3)}")
  geodist <- env_dist_matrices[["Fun_sor_clus2"]][[geo_key]]
  pairwise_obj <- betapart_results[[KINGDOM]][["Fun_sor_clus2"]][["pairwise"]][[comm_key]]
  commdist <- pairwise_obj[[beta_key]]
}

# ---- Summary of Pairwise Spatial Distances ----
vec1 <- as.numeric(geodist)

# If comparing F1 vs non-F1, extract both distance sets
if (tolower(GLOBAL) != "yes") {
  if (KINGDOM == "Fungi" & METAGROUPING == "F1") {
    dist1 <- env_dist_matrices[["Fun_sor_clus2"]][["F1_geodist"]]
    dist2 <- env_dist_matrices[["Fun_sor_clus2"]][["non-F1_geodist"]]
  } else if (KINGDOM == "Bacteria" & METAGROUPING == "F1") {
    dist1 <- env_dist_matrices[["Fun_sor_clus2"]][["F1_geodist"]]
    dist2 <- env_dist_matrices[["Fun_sor_clus2"]][["non-F1_geodist"]]
  }

  vec1 <- as.numeric(dist1)
  vec2 <- as.numeric(dist2)

  dist_df <- data.frame(
    Distance = c(vec1, vec2),
    Group = factor(c(rep("F1", length(vec1)), rep("non-F1", length(vec2))),
                   levels = c("F1", "non-F1"))
  )

  # Summary table
  summary_stats <- dist_df %>%
    group_by(Group) %>%
    summarise(
      N = n(),
      Mean = mean(Distance),
      SD = sd(Distance),
      Median = median(Distance),
      Min = min(Distance),
      Max = max(Distance),
      Variance = var(Distance),
      Skewness = e1071::skewness(Distance),
      Kurtosis = e1071::kurtosis(Distance),
      .groups = "drop"
    )

  # Add normality and test results (Wilcoxon vs t-test)
  ad_f1 <- nortest::ad.test(vec1)
  ad_nf1 <- nortest::ad.test(vec2)
  var_test <- car::leveneTest(Distance ~ Group, data = dist_df)
  var_p <- var_test$`Pr(>F)`[1]

  mean_test <- if (ad_f1$p.value > 0.05 & ad_nf1$p.value > 0.05 &
                   abs(var(vec1) - var(vec2)) < 0.5 * max(var(vec1), var(vec2))) {
    t.test(Distance ~ Group, data = dist_df)
  } else {
    wilcox.test(Distance ~ Group, data = dist_df)
  }

  mean_p <- mean_test$p.value
  median_test <- coin::median_test(Distance ~ Group, data = dist_df, exact = FALSE)
  median_p <- coin::pvalue(median_test)

  # Output summary
  cat(glue::glue("
**Summary of Pairwise Spatial Distances**
- F1 Mean ± SD: {round(mean(vec1), 2)} ± {round(sd(vec1), 2)} km
- non-F1 Mean ± SD: {round(mean(vec2), 2)} ± {round(sd(vec2), 2)} km
- Mean difference test p = {signif(mean_p, 3)} ({ifelse(mean_p < 0.05, 'significant', 'not significant')})
- Median difference p = {signif(median_p, 3)}
- Variance difference p = {signif(var_p, 3)}
"))
}

# ---- Spatial Structure of Explanatory Distance Matrix ----
if (!is.null(PREDD)) {
  if (tolower(GLOBAL) == "yes") {
    pred_dist <- env_dist_matrices[["all"]][[glue::glue("pred_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[["all"]][[glue::glue("geodist_{KINGDOM}")]]
  } else {
    pred_dist <- env_dist_matrices[["Fun_sor_clus2"]][[glue::glue("{METAGROUPING}_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[["Fun_sor_clus2"]][[glue::glue("{METAGROUPING}_geodist")]]
  }

  mantel_env_geo <- vegan::mantel(pred_dist, geo_use, permutations = 999)
  r_pred <- round(mantel_env_geo$statistic, 2)
  p_pred <- signif(mantel_env_geo$signif, 3)

  cat(glue::glue("
**Spatial Structure of Explanatory Matrix ({PREDD})**
- Mantel r = {r_pred}, p = {p_pred}
- Interpretation: {ifelse(p_pred < 0.05, 'Explanatory variable is spatially structured', 'No significant spatial structure detected')}
"))
}
