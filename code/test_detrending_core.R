# ==========================================
# detrending_core.R
# Functions for spatial detrending of explanatory dissimilarity matrices
# ==========================================
# Author: Your Name
# Date: YYYY-MM-DD

# DESCRIPTION:
# This script provides functions to spatially detrend any explanatory distance matrix
# using linear regression against geographic distances (GeoDist), extracting the residual
# matrix that represents the non-spatial component of variation.

# This supports both global and grouped detrending.
# Intended for use in spatially explicit beta diversity models.

# PARAMETERS expected to be defined in calling environment:
# PREDD: string, name of the explanatory variable (e.g., "pH")
# KINGDOM: "Bacteria" or "Fungi" (only used to match geodist naming)
# GLOBAL: "yes" or "no"
# PREDD_GROUPING: name of group-level container (e.g., "Fun_sor_clus2")
# PREDD_SUBGROUP: specific subgroup (e.g., "F1")

library(glue)
library(vegan)

# ----------------------------------------------------------
# Function: spatial_detrend()
# Performs regression of PREDD distance matrix against GeoDist
# Returns: residual matrix (symmetric, square) with same dimnames
# ----------------------------------------------------------
spatial_detrend <- function(PREDD, KINGDOM, GLOBAL, PREDD_GROUPING = NULL, PREDD_SUBGROUP = NULL) {
  # Step 1: Retrieve matrices
  if (tolower(GLOBAL) == "yes") {
    pred_mat <- env_dist_matrices[["all"]][[glue("pred_{tolower(PREDD)}")]]
    geo_mat <- env_dist_matrices[["all"]][[glue("geodist_{KINGDOM}")]]
  } else {
    pred_mat <- env_dist_matrices[[PREDD_GROUPING]][[glue("{PREDD_SUBGROUP}_{tolower(PREDD)}")]]
    geo_mat <- env_dist_matrices[[PREDD_GROUPING]][[glue("{PREDD_SUBGROUP}_geodist")]]
  }

  # Step 2: Validate
  stopifnot(all(dim(pred_mat) == dim(geo_mat)))
  stopifnot(identical(rownames(pred_mat), rownames(geo_mat)))

  # Step 3: Extract lower triangle
  idx <- which(lower.tri(pred_mat), arr.ind = TRUE)
  pred_vals <- pred_mat[idx]
  geo_vals <- geo_mat[idx]

  # Step 4: Fit model and compute residuals
  lm_mod <- lm(pred_vals ~ geo_vals)
  resids <- resid(lm_mod)

  # Step 5: Reconstruct residual matrix
  res_mat <- matrix(NA, nrow = nrow(pred_mat), ncol = ncol(pred_mat))
  res_mat[idx] <- resids
  res_mat <- res_mat + t(res_mat)  # symmetric
  diag(res_mat) <- 0
  rownames(res_mat) <- rownames(pred_mat)
  colnames(res_mat) <- colnames(pred_mat)

  # Step 6: Return as dist object
  dist_resid <- as.dist(res_mat)
  attr(dist_resid, "method") <- glue("resid_{PREDD}_vs_GeoDist")

  return(list(
    residual_matrix = dist_resid,
    model = lm_mod,
    summary = summary(lm_mod)
  ))
}


# ----------------------------------------------------------
# Function: plot_detrending()
# Visualizes raw vs. detrended relationship
# ----------------------------------------------------------
plot_detrending <- function(pred_mat, geo_mat, residual_matrix, PREDD, KINGDOM, GROUP = "All") {
  idx <- which(lower.tri(pred_mat), arr.ind = TRUE)
  pred_vals <- pred_mat[idx]
  geo_vals <- geo_mat[idx]
  resid_vals <- as.matrix(residual_matrix)[idx]

  df <- tibble::tibble(
    GeoDist = geo_vals,
    Raw = pred_vals,
    Residual = resid_vals
  )

  p1 <- ggplot(df, aes(x = GeoDist, y = Raw)) +
    geom_point(alpha = 0.3, color = "#1f78b4") +
    geom_smooth(method = "lm", se = TRUE, color = "black") +
    labs(title = glue::glue("Raw Distance: {PREDD} vs. GeoDist ({KINGDOM}, {GROUP})"),
         x = "Geographic Distance (km)",
         y = glue::glue("{PREDD} Dissimilarity")) +
    theme_minimal()

  p2 <- ggplot(df, aes(x = GeoDist, y = Residual)) +
    geom_point(alpha = 0.3, color = "#33a02c") +
    geom_smooth(method = "lm", se = TRUE, color = "black") +
    labs(title = glue::glue("Detrended: Residual {PREDD} vs. GeoDist ({KINGDOM}, {GROUP})"),
         x = "Geographic Distance (km)",
         y = glue::glue("Residual {PREDD} Distance")) +
    theme_minimal()

  cowplot::plot_grid(p1, p2, labels = c("A", "B"))
}
