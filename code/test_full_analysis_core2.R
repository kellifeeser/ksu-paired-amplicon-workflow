# ===============================
# full_analysis_core.R
# Reusable analysis script with nested grouping logic
# ===============================

# Parameters:
# KINGDOM: "Bacteria" or "Fungi"
# METAGROUPING: e.g., "Fun_sor_clus2"
# METASUBGROUP: e.g., "F1"
# GLOBAL: "yes" or "no"
# BETA: "Sorensen", "Turnover", "Nestedness"
# PREDD: name of predictor variable (e.g., "pH")
# PREDD_GROUPING: grouping structure for explanatory distance
# PREDD_SUBGROUP: subgroup to extract from PREDD_GROUPING

# -----------------------
# Map BETA to beta diversity matrix
beta_map <- c("Sorensen" = "beta.sor", "Turnover" = "beta.sim", "Nestedness" = "beta.sne")
beta_key <- beta_map[BETA]

# -----------------------
# Retrieve geodist and commdist
if (tolower(GLOBAL) == "yes") {
  geo_key <- glue::glue("geodist_{KINGDOM}")
  geodist <- env_dist_matrices[["all"]][[geo_key]]
  commdist <- betapart_results[[KINGDOM]][["all"]][["pairwise"]][[beta_key]]
} else {
  geo_key <- glue::glue("{METASUBGROUP}_geodist")
  comm_key <- glue::glue("{METASUBGROUP}_{substr(KINGDOM, 1, 3)}")
  geodist <- env_dist_matrices[[METAGROUPING]][[geo_key]]
  pairwise_obj <- betapart_results[[KINGDOM]][[METAGROUPING]][["pairwise"]][[comm_key]]
  commdist <- pairwise_obj[[beta_key]]
}

# -----------------------
# Summary of Pairwise Spatial Distances (F1 vs. non-F1)
if (tolower(GLOBAL) != "yes") {
  dist1 <- env_dist_matrices[[METAGROUPING]][[glue::glue("{METASUBGROUP}_geodist")]]
  other_subgroup <- setdiff(names(env_dist_matrices[[METAGROUPING]]), glue::glue("{METASUBGROUP}_geodist"))[1]
  dist2 <- env_dist_matrices[[METAGROUPING]][[other_subgroup]]

  vec1 <- as.numeric(dist1)
  vec2 <- as.numeric(dist2)

  dist_df <- data.frame(
    Distance = c(vec1, vec2),
    Group = factor(c(rep(METASUBGROUP, length(vec1)), rep("non-F1", length(vec2))))
  )

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

  ad1 <- nortest::ad.test(vec1)
  ad2 <- nortest::ad.test(vec2)
  var_test <- car::leveneTest(Distance ~ Group, data = dist_df)
  var_p <- var_test$`Pr(>F)`[1]

  mean_test <- if (ad1$p.value > 0.05 & ad2$p.value > 0.05 &&
                   abs(var(vec1) - var(vec2)) < 0.5 * max(var(vec1), var(vec2))) {
    t.test(Distance ~ Group, data = dist_df)
  } else {
    wilcox.test(Distance ~ Group, data = dist_df)
  }

  mean_p <- mean_test$p.value
  median_test <- coin::median_test(Distance ~ Group, data = dist_df, exact = FALSE)
  median_p <- coin::pvalue(median_test)

  cat(glue::glue("
**Summary of Pairwise Spatial Distances**
- {METASUBGROUP} Mean ± SD: {round(mean(vec1), 2)} ± {round(sd(vec1), 2)} km
- non-F1 Mean ± SD: {round(mean(vec2), 2)} ± {round(sd(vec2), 2)} km
- Mean difference p = {signif(mean_p, 3)} ({ifelse(mean_p < 0.05, 'significant', 'not significant')})
- Median difference p = {signif(median_p, 3)}
- Variance difference p = {signif(var_p, 3)}
"))
}

# -----------------------
# Spatial structure of explanatory predictor distance matrix (PREDD)
if (!is.null(PREDD)) {
  if (tolower(GLOBAL) == "yes") {
    pred_dist <- env_dist_matrices[["all"]][[glue::glue("pred_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[["all"]][[glue::glue("geodist_{KINGDOM}")]]
  } else {
    pred_dist <- env_dist_matrices[[PREDD_GROUPING]][[glue::glue("{PREDD_SUBGROUP}_{tolower(PREDD)}")]]
    geo_use <- env_dist_matrices[[PREDD_GROUPING]][[glue::glue("{PREDD_SUBGROUP}_geodist")]]
  }

  mantel_env_geo <- vegan::mantel(pred_dist, geo_use, permutations = 999)
  r_pred <- round(mantel_env_geo$statistic, 2)
  p_pred <- signif(mantel_env_geo$signif, 3)

  cat(glue::glue("
**Spatial Structure of Explanatory Matrix ({PREDD})**
- Mantel r = {r_pred}, p = {p_pred}
- Interpretation: {ifelse(p_pred < 0.05, 'Explanatory variable is spatially structured', 'No significant spatial structure')}
"))
}
