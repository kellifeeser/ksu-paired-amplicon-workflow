# Core logic for extracting and analyzing distance matrices

# Map beta
beta_map <- c("Sorensen" = "beta.sor", "Turnover" = "beta.sim", "Nestedness" = "beta.sne")
beta_layer <- beta_map[Beta]

# Extract distance matrices
if (tolower(Global) == "yes") {
  geo_key <- glue::glue("geodist_{Kingdom}")
  geodist <- env_dist_matrices[["all"]][[geo_key]]
  commdist <- betapart_results[[Kingdom]][["all"]][["pairwise"]][[beta_layer]]
} else {
  geo_key <- glue::glue("{Group}_geodist")
  comm_key <- glue::glue("{Group}_{substr(Kingdom, 1, 3)}")
  geodist <- env_dist_matrices[["Fun_sor_clus2"]][[geo_key]]
  commdist <- betapart_results[[Kingdom]][["Fun_sor_clus2"]][["pairwise"]][[comm_key]][[beta_layer]]
}

# Run Mantel test
mantel_out <- vegan::mantel(commdist, geodist, permutations = 999)
r_val <- round(mantel_out$statistic, 2)
p_val <- signif(mantel_out$signif, 3)

# Report
cat(glue::glue("
**Mantel Test Result**

Kingdom: {Kingdom}  
Group: {Group}  
Beta Diversity Metric: {Beta}  
→ Mantel r = {r_val}, p = {p_val}
"))
