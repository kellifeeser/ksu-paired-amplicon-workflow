---
title: "RAM: Spatial Origins and Cross-Kingdom Congruence in Bacterial and Fungal Communities"
subtitle: "Constrasting fungal F1 subassemblage vs. non-F1 subassemblages and associated bacterial communities"
author: "Kelli Feeser"
date: "2025-03-24"
output:
  bookdown::html_document2:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
    keep_md: yes
  html_notebook:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
  html_document:
    code_folding: hide
    css: styles.css
    number_sections: yes
    toc: yes
    toc_depth: 4
    toc_float: true
    fig.caption: yes
editor_options:
  chunk_output_type: inline
bibliography: RAMreferences.bib
notes:
  - "add 'csl: apa.csl  # optional for APA-style formatting' to yaml"
---

\

::: homelink
<a href="https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html" target="_blank" style="text-align:right">Back to Home</a>
:::

\

------------------------------------------------------------------------

Document last updated: 2025-03-24

------------------------------------------------------------------------

\



# Introduction

- Microbial communities are spatially structured due to both intrinsic (biotic) and extrinsic (environmental) factors.
- Bacteria and fungi co-occur but may exhibit divergent spatial regimes.
- This study investigates spatial dependence in paired bacterial and fungal communities.
- We evaluate:
  - Spatial distance distributions between [SUBGROUPS]
  - Spatial decay of community dissimilarity within and across [GROUPS]
  - Spatial structure in explanatory dissimilarity matrices
  - Spatial detrending of explanatory matrices
  - Cross-kingdom associations (bacteria ↔ fungi)

# Methods

## Baseline Model: Spatial Origins of Compositional Structure

- A spatial structure in a response matrix Y can emerge from:
  - (i) **Spatial autocorrelation**: biotic processes internal to communities
  - (ii) **Induced spatial dependence**: spatially structured external environmental gradients
- We follow the framework of [@lichstein2007plant] and [@borcard2018numerical] to disentangle these components.

## Geographic and Community Dissimilarity Matrices



# not integrated
# Spatial distance

## Fungal F1 vs. non-F1 - comparisons of pairwise geographic distances between samples within each subassemblage group



``` r
dist1 <- env_dist_matrices[["Fun_sor_clus2"]][["F1_geodist"]]
dist2 <- env_dist_matrices[["Fun_sor_clus2"]][["non-F1_geodist"]]

# Data prep
vec1 <- as.numeric(dist1)
vec2 <- as.numeric(dist2)

dist_df <- data.frame(
  Distance = c(vec1, vec2),
  Group = factor(c(rep("F1", length(vec1)), rep("non-F1", length(vec2))),
                 levels = c("F1", "non-F1"))
)

library(dplyr)
# Summary stats
summary_stats <- dist_df %>%
  dplyr::group_by(Group) %>%
  dplyr::summarise(
    N = n(),
    Mean = mean(Distance),
    SD = sd(Distance),
    Median = median(Distance),
    Min = min(Distance),
    Max = max(Distance),
    Variance = var(Distance),
    Skewness = skewness(Distance),
    Kurtosis = kurtosis(Distance),
    .groups = "drop"
  )

# Normality tests
ad_f1 <- ad.test(vec1)
ad_nonf1 <- ad.test(vec2)

# Variance test
var_test <- leveneTest(Distance ~ Group, data = dist_df)

# Mean/median test
if (ad_f1$p.value > 0.05 & ad_nonf1$p.value > 0.05 &
    abs(var(vec1) - var(vec2)) < 0.5 * max(var(vec1), var(vec2))) {
  mean_test <- t.test(Distance ~ Group, data = dist_df)
  test_label <- "t-test"
} else {
  mean_test <- wilcox.test(Distance ~ Group, data = dist_df)
  test_label <- "Wilcoxon rank-sum test"
}

# Add flags to summary table
summary_stats <- summary_stats %>%
  mutate(
    Normality = c(ifelse(ad_f1$p.value < 0.05, "No", "Yes"),
                  ifelse(ad_nonf1$p.value < 0.05, "No", "Yes"))
  )

var_p <- var_test$`Pr(>F)`[1]
mean_p <- mean_test$p.value

summary_stats <- summary_stats %>%
  mutate(
    Var_Differs = ifelse(var_p < 0.05, "Yes", "No"),
    Mean_Differs = ifelse(mean_p < 0.05, "Yes", "No")
  )

# Custom colors
col_f1 <- "#8E0152"; col_f1_line <- "#8E015266"
col_nonf1 <- "#7FBC41"; col_nonf1_line <- "#276419"
fill_colors <- c("F1" = col_f1, "non-F1" = col_nonf1)

# Minimal black theme with min font size 10
black_theme <- theme_minimal(base_size = 14) +
  theme(
    text = element_text(color = "black"),
    axis.text = element_text(color = "black", size = 12),
    axis.title = element_text(color = "black"),
    plot.title = element_text(color = "black", face = "bold"),
    strip.text = element_text(color = "black")
  )

# Q–Q plots
qq_f1 <- ggplot(data.frame(Distance = vec1), aes(sample = Distance)) +
  stat_qq(color = col_f1) + stat_qq_line(color = col_f1_line) +
  labs(title = "Q–Q Plot: F1") +
  black_theme

qq_nonf1 <- ggplot(data.frame(Distance = vec2), aes(sample = Distance)) +
  stat_qq(color = col_nonf1) + stat_qq_line(color = col_nonf1_line) +
  labs(title = "Q–Q Plot: non-F1") +
  black_theme

# Violin + boxplot
p_dist <- ggplot(dist_df, aes(x = Group, y = Distance, fill = Group)) +
  geom_violin(trim = FALSE, alpha = 0.3) +
  geom_boxplot(width = 0.18, outlier.shape = NA, alpha = 0.9) +
  geom_jitter(width = 0.05, alpha = 0.08, size = 0.2) +
  scale_fill_manual(values = fill_colors) +
  labs(title = "C. Distance Distributions", y = "Distance (km)", x = NULL) +
  black_theme +
  theme(legend.position = "none")

# Combine plots
plot_grid(
  plot_grid(qq_f1, qq_nonf1, labels = c("A", "B"), ncol = 2),
  p_dist,
  ncol = 1, rel_heights = c(0.4, 0.6)
)
```

<div class="figure">
<img src="/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_files/figure-html/fig-spatial-dist-1.png" alt="Figure 1. Q–Q plots and distribution of spatial distances within F1 and non-F1 groups."  />
<p class="caption">(\#fig:fig-spatial-dist)Figure 1. Q–Q plots and distribution of spatial distances within F1 and non-F1 groups.</p>
</div>



``` r
library(spam)

# Convert dist objects to vectors
vec1 <- as.numeric(dist1)
vec2 <- as.numeric(dist2)

# Combine for group-level stats
dist_df <- data.frame(
  Distance = c(vec1, vec2),
  Group = factor(c(rep("F1", length(vec1)), rep("non-F1", length(vec2))))
)

# Basic summary stats
summary_stats <- dist_df %>%
  dplyr::group_by(Group) %>%
  dplyr::summarise(
    N = n(),
    Mean = mean(Distance),
    SD = sd(Distance),
    Median = median(Distance),
    Min = min(Distance),
    Max = max(Distance),
    Variance = var(Distance),
    Skewness = skewness(Distance),
    Kurtosis = kurtosis(Distance),
    .groups = "drop"
  )

# Extended stats
f1_ext <- data.frame(
  Group = "F1",
  IQR = IQR(vec1),
  Range = diff(range(vec1)),
  CV = sd(vec1) / mean(vec1)
)
nf1_ext <- data.frame(
  Group = "non-F1",
  IQR = IQR(vec2),
  Range = diff(range(vec2)),
  CV = sd(vec2) / mean(vec2)
)


# Convert all numeric columns in summary_stats to character
summary_stats <- summary_stats %>%
  mutate(across(where(is.numeric), ~ format(round(.x, 2), nsmall = 2)))


# Merge
summary_stats <- summary_stats %>%
  left_join(bind_rows(f1_ext, nf1_ext), by = "Group")

# Statistical tests
## Normality (for mean test choice)
ad_f1 <- nortest::ad.test(vec1)
ad_nf1 <- nortest::ad.test(vec2)

## Variance test
var_test <- leveneTest(Distance ~ Group, data = dist_df)
var_p <- var_test$`Pr(>F)`[1]

## Mean test
mean_test <- if (ad_f1$p.value > 0.05 && ad_nf1$p.value > 0.05 &&
                 abs(var(vec1) - var(vec2)) < 0.5 * max(var(vec1), var(vec2))) {
  t.test(Distance ~ Group, data = dist_df)
} else {
  wilcox.test(Distance ~ Group, data = dist_df)
}
mean_p <- mean_test$p.value

## Median test
median_test_res <- coin::median_test(Distance ~ Group, data = dist_df, exact = FALSE)
median_p <- coin::pvalue(median_test_res)

## Effect size: Cohen's d
cohen_d <- abs(mean(vec1) - mean(vec2)) / sqrt(((sd(vec1)^2 + sd(vec2)^2) / 2))

## Log-response ratio
log_ratio <- log(mean(vec1) / mean(vec2))

# Bootstrapped CI: Cohen's d
cohen_d_boot <- function(x, y, R = 1000) {
  data <- c(x, y)
  boot_fun <- function(d, i) {
    d1 <- d[i[1:length(x)]]
    d2 <- d[i[(length(x)+1):(length(x)+length(y))]]
    (mean(d1) - mean(d2)) / sqrt((var(d1) + var(d2)) / 2)
  }
  boot_obj <- boot(data, boot_fun, R = R)
  ci <- boot.ci(boot_obj, type = "perc")$percent[4:5]
  round(ci, 2)
}
ci_d <- cohen_d_boot(vec1, vec2)

# Bootstrapped CI: Log-response
log_ratio_boot <- function(x, y, R = 1000) {
  data <- c(x, y)
  boot_fun <- function(d, i) {
    d1 <- d[i[1:length(x)]]
    d2 <- d[i[(length(x)+1):(length(x)+length(y))]]
    log(mean(d1) / mean(d2))
  }
  boot_obj <- boot(data, boot_fun, R = R)
  ci <- boot.ci(boot_obj, type = "perc")$percent[4:5]
  round(ci, 2)
}
ci_lr <- log_ratio_boot(vec1, vec2)

# Boot CI for skewness & kurtosis
boot_ci_metric <- function(x, metric_fun, R = 1000) {
  boot_obj <- boot::boot(x, function(data, i) metric_fun(data[i]), R = R)
  boot::boot.ci(boot_obj, type = "perc")$percent[4:5]
}

skew_ci_f1 <- round(boot_ci_metric(vec1, skewness), 2)
skew_ci_nf1 <- round(boot_ci_metric(vec2, skewness), 2)
skew_differs <- ifelse(skew_ci_f1[2] < skew_ci_nf1[1] || skew_ci_nf1[2] < skew_ci_f1[1], "different", "not different")

kurt_ci_f1 <- round(boot_ci_metric(vec1, kurtosis), 2)
kurt_ci_nf1 <- round(boot_ci_metric(vec2, kurtosis), 2)
kurt_differs <- ifelse(kurt_ci_f1[2] < kurt_ci_nf1[1] || kurt_ci_nf1[2] < kurt_ci_f1[1], "different", "not different")

# Create comparison row
comparison_row <- data.frame(
  Group = "Comparison",
  N = NA,
  Mean = as.character(glue::glue("{ifelse(mean_p < 0.05, 'different', 'not different')} (p = {signif(mean_p, 3)})")),
  SD = NA,
  Median = as.character(glue::glue("{ifelse(median_p < 0.05, 'different', 'not different')} (p = {signif(median_p, 3)})")),
  Min = NA,
  Max = NA,
  Variance = as.character(glue::glue("{ifelse(var_p < 0.05, 'different', 'not different')} (p = {signif(var_p, 3)})")),
  Skewness = as.character(glue::glue("{skew_differs} (CI F1: {skew_ci_f1[1]}–{skew_ci_f1[2]}, non-F1: {skew_ci_nf1[1]}–{skew_ci_nf1[2]})")),
  Kurtosis = as.character(glue::glue("{kurt_differs} (CI F1: {kurt_ci_f1[1]}–{kurt_ci_f1[2]}, non-F1: {kurt_ci_nf1[1]}–{kurt_ci_nf1[2]})")),
  IQR = NA,
  Range = NA,
  CV = NA,
  Cohens_d = round(cohen_d, 2),
  Log_Response_Ratio = round(log_ratio, 2),
  Cohens_d_CI = as.character(glue::glue("{ci_d[1]}–{ci_d[2]}")),
  Log_Response_CI = as.character(glue::glue("{ci_lr[1]}–{ci_lr[2]}")),
  stringsAsFactors = FALSE
)

summary_stats_aligned <- summary_stats %>%
  mutate(
    IQR = NA_character_,
    Range = NA_character_,
    CV = NA_character_,
    Cohens_d = NA,
    Log_Response_Ratio = NA,
    Cohens_d_CI = NA_character_,
    Log_Response_CI = NA_character_
  ) %>%
  mutate(across(everything(), as.character))


# Coerce all columns in both data frames to character
summary_stats_chr <- summary_stats_aligned
summary_stats_chr[] <- lapply(summary_stats_chr, as.character)

comparison_row_chr <- comparison_row
comparison_row_chr[] <- lapply(comparison_row_chr, as.character)

# Now bind Final table
final_stats <- bind_rows(summary_stats_chr, comparison_row_chr)

# Display table with descriptive caption
kable(final_stats, digits = 2,
      caption = "Table 1. Summary statistics for spatial distances within F1 and non-F1 groups. 
      We compared group means using a t-test or Wilcoxon test based on normality and variance homogeneity. 
      Medians were compared using Mood’s median test. 
      Variance was tested using Levene’s test. 
      We investigated effect size using Cohen’s d (Cohens_d) and the log-response ratio (Log_Response_Ratio), each with 95% bootstrapped confidence intervals. 
      Differences in skewness and kurtosis were assessed via non-overlapping bootstrapped confidence intervals.") %>%
  kable_styling(bootstrap_options = c("striped", "hover"), font_size = 10, full_width = FALSE)
```

<table class="table table-striped table-hover" style="font-size: 10px; width: auto !important; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:fig1-summary-table)(\#tab:fig1-summary-table)Table 1. Summary statistics for spatial distances within F1 and non-F1 groups. 
      We compared group means using a t-test or Wilcoxon test based on normality and variance homogeneity. 
      Medians were compared using Mood’s median test. 
      Variance was tested using Levene’s test. 
      We investigated effect size using Cohen’s d (Cohens_d) and the log-response ratio (Log_Response_Ratio), each with 95% bootstrapped confidence intervals. 
      Differences in skewness and kurtosis were assessed via non-overlapping bootstrapped confidence intervals.</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Group </th>
   <th style="text-align:left;"> N </th>
   <th style="text-align:left;"> Mean </th>
   <th style="text-align:left;"> SD </th>
   <th style="text-align:left;"> Median </th>
   <th style="text-align:left;"> Min </th>
   <th style="text-align:left;"> Max </th>
   <th style="text-align:left;"> Variance </th>
   <th style="text-align:left;"> Skewness </th>
   <th style="text-align:left;"> Kurtosis </th>
   <th style="text-align:left;"> IQR </th>
   <th style="text-align:left;"> Range </th>
   <th style="text-align:left;"> CV </th>
   <th style="text-align:left;"> Cohens_d </th>
   <th style="text-align:left;"> Log_Response_Ratio </th>
   <th style="text-align:left;"> Cohens_d_CI </th>
   <th style="text-align:left;"> Log_Response_CI </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> F1 </td>
   <td style="text-align:left;"> 16653 </td>
   <td style="text-align:left;"> 740.382594018701 </td>
   <td style="text-align:left;"> 442.944273364031 </td>
   <td style="text-align:left;"> 709.757034012749 </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> 1560.05496626967 </td>
   <td style="text-align:left;"> 196199.629305989 </td>
   <td style="text-align:left;"> -0.321095637790914 </td>
   <td style="text-align:left;"> -1.08153375527334 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> non-F1 </td>
   <td style="text-align:left;"> 45150 </td>
   <td style="text-align:left;"> 640.336103102797 </td>
   <td style="text-align:left;"> 380.144152765119 </td>
   <td style="text-align:left;"> 646.181563446685 </td>
   <td style="text-align:left;"> 0 </td>
   <td style="text-align:left;"> 1444.52845708873 </td>
   <td style="text-align:left;"> 144509.57688151 </td>
   <td style="text-align:left;"> 0.00311661431198584 </td>
   <td style="text-align:left;"> -1.00006721302135 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Comparison </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> different (p = 2.75e-157) </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> different (p = 0) </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> different (p = 1.7e-223) </td>
   <td style="text-align:left;"> different (CI F1: -0.35–-0.3, non-F1: -0.01–0.02) </td>
   <td style="text-align:left;"> different (CI F1: -1.11–-1.05, non-F1: -1.01–-0.99) </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;"> 0.24 </td>
   <td style="text-align:left;"> 0.15 </td>
   <td style="text-align:left;"> -0.02–0.02 </td>
   <td style="text-align:left;"> -0.01–0.01 </td>
  </tr>
</tbody>
</table>









``` r
# --- Extract group rows from final_stats ---
f1 <- final_stats %>% filter(Group == "F1")
nf1 <- final_stats %>% filter(Group == "non-F1")
cmp <- final_stats %>% filter(Group == "Comparison")

# --- Convert values to numeric ---
getnum <- function(x) as.numeric(x)
f1_mean <- getnum(f1$Mean); f1_sd <- getnum(f1$SD)
nf1_mean <- getnum(nf1$Mean); nf1_sd <- getnum(nf1$SD)
f1_median <- getnum(f1$Median); nf1_median <- getnum(nf1$Median)
f1_var <- getnum(f1$Variance); nf1_var <- getnum(nf1$Variance)
f1_cv <- getnum(f1$CV); nf1_cv <- getnum(nf1$CV)
f1_iqr <- getnum(f1$IQR); nf1_iqr <- getnum(nf1$IQR)
f1_skew <- getnum(f1$Skewness); nf1_skew <- getnum(nf1$Skewness)
f1_kurt <- getnum(f1$Kurtosis); nf1_kurt <- getnum(nf1$Kurtosis)

# --- Skew and kurtosis interpretations ---
interpret_skew <- function(x) {
  if (x > 0.5) "positively skewed (long right tail)"
  else if (x < -0.5) "negatively skewed (long left tail)"
  else "approximately symmetric"
}
interpret_kurt <- function(x) {
  if (x > 3.5) "leptokurtic (heavy tails/outliers)"
  else if (x < 2.5) "platykurtic (light tails, peaked)"
  else "mesokurtic (normal-like)"
}

skew_f1_text <- interpret_skew(f1_skew)
skew_nf1_text <- interpret_skew(nf1_skew)
kurt_f1_text <- interpret_kurt(f1_kurt)
kurt_nf1_text <- interpret_kurt(nf1_kurt)

# --- Compare which group is more skewed/kurtotic ---
skew_group <- ifelse(f1_skew > nf1_skew, "F1", "non-F1")
kurt_group <- ifelse(f1_kurt > nf1_kurt, "F1", "non-F1")

# --- Directional differences ---
greater_mean <- ifelse(f1_mean > nf1_mean, "F1", "non-F1")
greater_median <- ifelse(f1_median > nf1_median, "F1", "non-F1")
greater_var <- ifelse(f1_var > nf1_var, "F1", "non-F1")
greater_cv <- ifelse(f1_cv > nf1_cv, "F1", "non-F1")
greater_iqr <- ifelse(f1_iqr > nf1_iqr, "F1", "non-F1")

# --- Spatial clustering interpretation logic ---
clustered_group <- ifelse(
  f1_var < nf1_var & f1_cv < nf1_cv & f1_iqr < nf1_iqr,
  "F1",
  ifelse(nf1_var < f1_var & nf1_cv < f1_cv & nf1_iqr < f1_iqr,
         "non-F1", "neither group")
)
justification <- case_when(
  clustered_group == "F1" ~ "This is supported by lower variance, CV, and IQR in F1 samples.",
  clustered_group == "non-F1" ~ "This is supported by consistently lower dispersion metrics in non-F1.",
  TRUE ~ "Dispersion metrics were similar across groups, providing no clear evidence of tighter clustering."
)

# --- Format p-values from comparison row ---
format_pval <- function(p_string) gsub("p = 0", "p < 0.001", p_string)
mean_text <- format_pval(cmp$Mean)
median_text <- format_pval(cmp$Median)
var_text <- format_pval(cmp$Variance)

# --- Tail analysis: extreme values above 95th percentile of full distribution ---
high_thresh <- quantile(c(vec1, vec2), 0.95)
f1_extreme <- mean(vec1 > high_thresh)
nf1_extreme <- mean(vec2 > high_thresh)

extreme_group <- ifelse(f1_extreme > nf1_extreme, "F1", "non-F1")
tail_reason <- case_when(
  f1_extreme > nf1_extreme ~ "a heavier upper tail and more long-distance pairings",
  nf1_extreme > f1_extreme ~ "more spatial outliers or dispersed pairings",
  TRUE ~ "similar long-distance outlier behavior"
)
tail_interpretation <- glue::glue("This suggests that **{extreme_group}** had {tail_reason}.")

# --- Relative dispersion (CV and range ratios) ---
cv_ratio <- round(f1_cv / nf1_cv, 2)
range_ratio <- round(diff(range(vec1)) / diff(range(vec2)), 2)
dispersion_summary <- case_when(
  cv_ratio < 0.9 & range_ratio < 0.9 ~ "F1 had lower relative spread than non-F1 across both CV and range.",
  cv_ratio > 1.1 & range_ratio > 1.1 ~ "F1 was more dispersed than non-F1 across both CV and range.",
  TRUE ~ "Dispersion varied across metrics, with no consistent trend."
)

# --- Call your reusable functions for effect sizes ---
cohen <- describe_cohen_d(vec1, vec2)
cliff <- describe_cliffs_delta(vec1, vec2)

# --- Final interpretation output ---
cat(glue::glue("
### Summary of Group Differences

F1 mean ± SD: {round(f1_mean, 1)} ± {round(f1_sd, 1)} km  
non-F1 mean ± SD: {round(nf1_mean, 1)} ± {round(nf1_sd, 1)} km  
Group means: {mean_text} → **{greater_mean}** had the greater mean  
Medians: {median_text} → **{greater_median}** had the higher median  
Variance: {var_text} → **{greater_var}** had greater variability  
CV and IQR were greater in **{greater_cv}** and **{greater_iqr}**

### Distribution Shape

F1 distribution: {skew_f1_text}, {kurt_f1_text}  
non-F1 distribution: {skew_nf1_text}, {kurt_nf1_text}

### Tail Analysis (Extreme Distances)

95th percentile threshold: {round(high_thresh, 1)} km  
Proportion exceeding threshold:  
- F1: {round(100 * f1_extreme, 1)}%  
- non-F1: {round(100 * nf1_extreme, 1)}%  
{tail_interpretation}

### Relative Dispersion

CV ratio (F1 / non-F1): {cv_ratio}  
Range ratio (F1 / non-F1): {range_ratio}  
{dispersion_summary}

### Effect Size and Probability-Based Inference

{cohen$text}  
{cliff$text}

### Ecological Interpretation: Spatial Clustering & Heterogeneity

Based on these results, **{clustered_group}** appears more spatially clustered — i.e., sample pairs are generally closer geographically.  
{justification}  
Skewness and kurtosis suggest differences in spatial structure, with **{skew_group}** more asymmetrically dispersed and **{kurt_group}** showing more extreme values or outliers.  
This may reflect differing dispersal constraints, landscape heterogeneity, or spatial sampling extent between groups.
"))
```

### Summary of Group Differences

F1 mean ± SD: 740.4 ± 442.9 km  
non-F1 mean ± SD: 640.3 ± 380.1 km  
Group means: different (p = 2.75e-157) → **F1** had the greater mean  
Medians: different (p < 0.001) → **F1** had the higher median  
Variance: different (p = 1.7e-223) → **F1** had greater variability  
CV and IQR were greater in **NA** and **NA**

### Distribution Shape

F1 distribution: approximately symmetric, platykurtic (light tails, peaked)  
non-F1 distribution: approximately symmetric, platykurtic (light tails, peaked)

### Tail Analysis (Extreme Distances)

95th percentile threshold: 1267.9 km  
Proportion exceeding threshold:  
- F1: 10.7%  
- non-F1: 2.2%  
This suggests that **F1** had a heavier upper tail and more long-distance pairings.

### Relative Dispersion

CV ratio (F1 / non-F1): NA  
Range ratio (F1 / non-F1): 1.08  
Dispersion varied across metrics, with no consistent trend.

### Effect Size and Probability-Based Inference

Cohen’s *d* = 0.25 (small effect), 95% CI: NA  
Cliff’s delta = 0.14 (CI: 0.13–0.15)  
→ Estimated probability that a randomly selected x < y: 43%  
→ Estimated probability that x > y: 57%

### Ecological Interpretation: Spatial Clustering & Heterogeneity

Based on these results, **NA** appears more spatially clustered — i.e., sample pairs are generally closer geographically.  
Dispersion metrics were similar across groups, providing no clear evidence of tighter clustering.  
Skewness and kurtosis suggest differences in spatial structure, with **non-F1** more asymmetrically dispersed and **non-F1** showing more extreme values or outliers.  
This may reflect differing dispersal constraints, landscape heterogeneity, or spatial sampling extent between groups.

## Map of Sample Locations
Colored by "F1" vs "non-F1" (sd$Fun_sor_clus2)
With distance-based shading or clustering option




``` r
# 1. Base map: Sample locations
map_plot <- ggplot(sd, aes(x = Longitude, y = Latitude, color = Fun_sor_clus2)) +
  geom_point(size = 3, alpha = 0.8) +
  coord_fixed() +
  scale_color_manual(values = c("F1" = "#8E0152", "non-F1" = "#7FBC41")) +
  labs(title = "Sample Locations by Group",
       x = "Longitude", y = "Latitude",
       color = "Fungal Subassemblage") +
  theme_minimal(base_size = 12)
```

### Sample Map + Convex Hulls


``` r
# Convex hulls by group
hull_df <- sd %>%
  group_by(Fun_sor_clus2) %>%
  dplyr::slice(chull(Longitude, Latitude))

ggplot(sd, aes(x = Longitude, y = Latitude, color = Fun_sor_clus2, fill = Fun_sor_clus2)) +
  geom_polygon(data = hull_df, aes(group = Fun_sor_clus2), alpha = 0.2, color = NA) +
  geom_point(size = 2, alpha = 0.9) +
  scale_color_manual(values = c("F1" = "#8E0152", "non-F1" = "#7FBC41")) +
  scale_fill_manual(values = c("F1" = "#8E0152", "non-F1" = "#7FBC41")) +
  theme_minimal(base_size = 12) +
  coord_fixed() +
  labs(
    title = "Sample Locations with Convex Hulls",
    subtitle = "Group-specific spatial extent",
    x = "Longitude", y = "Latitude",
    color = "Group", fill = "Group"
  )
```

![](/Users/L347123/Desktop/ksu-paired-amplicon-workflow/docs/github_F1_vs_nonF1_files/figure-html/fig-map-hulls-1.png)<!-- -->

## Distance–Decay Plots
Pairwise spatial vs ecological distance
Regression (linear or exponential decay or loess)

### Spatial distance matrices and decay modeling

#### Methods

To assess **isolation by distance**, we constructed a geographic distance matrix (`GeoDist`) representing the pairwise Euclidean distances (in kilometers) between all sample locations, derived from sample coordinates.

We evaluated **spatial structure in ecological dissimilarity** by modeling pairwise community dissimilarity (e.g., Bray–Curtis) as a function of geographic distance. This framework quantifies spatial dependence in compositional variation, consistent with expectations under dispersal limitation or spatially structured environmental filtering.

To characterize the form of spatial decay, we fit multiple models, including **linear regression**, **log-linear regression** (exponential decay), and **non-parametric LOESS smoothing**. Model performance was compared visually, and significance of spatial structure was assessed using **Mantel tests**, which evaluate global correlation between distance matrices [@borcard2018numerical].

Because geographic distance is often correlated with other spatially structured variables (e.g., climate, edaphic gradients, host identity), we first tested the spatial structure of each **explanatory distance matrix** by modeling it as a function of geographic distance. Where spatial autocorrelation was present, we applied **spatial detrending**: the explanatory distance matrix was regressed against geographic distance, and the residuals were retained. These **spatially detrended explanatory matrices** represent the variation independent of spatial position, following recommended procedures for controlling spatial structure in distance-based modeling [@borcard2018numerical].

These detrended explanatory matrices (e.g., climatic dissimilarity, environmental gradients, trait distances) were then used in place of geographic distance to model ecological dissimilarity. This allowed us to test whether **non-spatial drivers** explain variation in community structure after accounting for the spatial component.

#### Results: Spatial dependence and explanatory dissimilarity

Pairwise ecological dissimilarity increased with geographic distance, consistent with **spatially structured variation** in community composition.  
Mantel tests confirmed significant associations between ecological and geographic distances across all groups (*r* = [...], *p* = [...]), indicating spatial autocorrelation in community dissimilarity.

Decay model fits revealed [linear / exponential / non-linear] patterns depending on group, with [group A] showing [steeper / flatter] decay relative to [group B]. The fitted LOESS models suggested [continuous / threshold-like / saturating] decay in ecological dissimilarity with spatial separation.

Several **explanatory dissimilarity matrices** (e.g., [climate, environment, trait]) also exhibited significant spatial structure when modeled as a function of geographic distance, indicating that spatial position may confound their ecological effects.

To account for this, each explanatory distance matrix was **spatially detrended** using regression against geographic distance, and the residuals were retained. These residualized matrices represent **non-spatial components** of the explanatory variables [@borcard2018numerical].

When these detrended matrices were used to model ecological dissimilarity, we observed [stronger / weaker / similar] patterns relative to models using raw explanatory distances. This suggests that [spatial autocorrelation / non-spatial environmental gradients] explain a substantial portion of the observed ecological variation.


#### Figures and Tables


``` r
# library(vegan)
# library(geosphere)
# library(glue)
# library(cowplot)

geo_dist <- env_dist_matrices[["all"]][["geodist_Fun"]]
dist1 <- env_dist_matrices[["Fun_sor_clus2"]][["F1_geodist"]]
dist2 <- env_dist_matrices[["Fun_sor_clus2"]][["non-F1_geodist"]]

comm_dist_all <- betapart_results[["Fun"]][["all"]][["pairwise"]][["beta.sor"]]
comm_dist_F1 <- betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["F1_Fun"]][["beta.sor"]]
comm_dist_non_F1 <- betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["non-F1_Fun"]][["beta.sor"]]





# Create pairwise dataframe from two dist objects
pairwise_decay_df <- function(comm_dist, sd_df, lat_col = "Latitude", lon_col = "Longitude") {
  sample_ids <- rownames(as.matrix(comm_dist))

  # Subset metadata using rownames
  meta <- sd_df[rownames(sd_df) %in% sample_ids, ]
  meta <- meta[match(sample_ids, rownames(meta)), ]

  if (!all(rownames(meta) == sample_ids)) {
    stop("Sample names in metadata (rownames) do not match those in distance matrix.")
  }

  # Get coordinates
  coords <- meta %>%
    select(all_of(c(lon_col, lat_col))) %>%
    as.matrix()
  rownames(coords) <- rownames(meta)

  # Geographic distances
  geo_mat <- geosphere::distm(coords) / 1000  # km
  rownames(geo_mat) <- colnames(geo_mat) <- rownames(meta)

  # Community distance matrix
  comm_mat <- as.matrix(comm_dist)

  # Lower triangle only
  idx <- which(lower.tri(comm_mat), arr.ind = TRUE)

  tibble(
    Sample1 = rownames(comm_mat)[idx[, 1]],
    Sample2 = rownames(comm_mat)[idx[, 2]],
    GeoDist = geo_mat[idx],
    CommDist = comm_mat[idx]
  )
}

# Decay data for all groups
# All samples
decay_all <- pairwise_decay_df(comm_dist_all, sd)

# F1 only
sd_f1 <- sd %>% filter(Fun_sor_clus2 == "F1")
decay_f1 <- pairwise_decay_df(comm_dist_F1, sd_f1)

# non-F1 only
sd_nf1 <- sd %>% filter(Fun_sor_clus2 == "non-F1")
decay_nf1 <- pairwise_decay_df(comm_dist_non_F1, sd_nf1)








decay_all  <- pairwise_decay_df(geo_dist, comm_dist_all)
decay_f1   <- pairwise_decay_df(as.dist(geo_mat[f1_samples, f1_samples]),
                                comm_dist_F1)
decay_nf1  <- pairwise_decay_df(as.dist(geo_mat[nf1_samples, nf1_samples]),
                                comm_dist_non_F1)

# Fit + plot decay models
fit_decay_plot <- function(df, group_label, mantel_stat, mantel_p) {
  df <- df %>% drop_na()

  lm_fit <- lm(CommDist ~ GeoDist, data = df)
  log_fit <- lm(log(CommDist + 1e-6) ~ GeoDist, data = df)
  loess_fit <- loess(CommDist ~ GeoDist, data = df, span = 0.75)

  preds <- tibble(GeoDist = seq(min(df$GeoDist), max(df$GeoDist), length.out = 300)) %>%
    mutate(
      Linear = predict(lm_fit, newdata = .),
      Exponential = exp(predict(log_fit, newdata = .)),
      LOESS = predict(loess_fit, newdata = .)
    ) %>%
    pivot_longer(-GeoDist, names_to = "Model", values_to = "Prediction")

  ggplot(df, aes(x = GeoDist, y = CommDist)) +
    geom_point(alpha = 0.25) +
    geom_line(data = preds, aes(x = GeoDist, y = Prediction, color = Model), linewidth = 1) +
    scale_color_manual(values = c("Linear" = "blue", "Exponential" = "red", "LOESS" = "black")) +
    labs(
      title = glue("Distance–Decay: {group_label}"),
      subtitle = glue("Mantel r = {round(mantel_stat, 2)}, p = {mantel_p}"),
      x = "Geographic Distance (km)",
      y = "Community Dissimilarity"
    ) +
    theme_minimal(base_size = 12)
}

# Mantel tests
mantel_all  <- mantel(comm_dist_all, geo_dist, permutations = 999)
mantel_f1   <- mantel(as.dist(comm_dist_F1), as.dist(geo_mat[f1_samples, f1_samples]), permutations = 999)
mantel_nf1  <- mantel(as.dist(comm_dist_non_F1), as.dist(geo_mat[nf1_samples, nf1_samples]), permutations = 999)

# Plots
p_all  <- fit_decay_plot(decay_all, "All Samples", mantel_all$statistic, mantel_all$signif)
p_f1   <- fit_decay_plot(decay_f1, "F1 Only", mantel_f1$statistic, mantel_f1$signif)
p_nf1  <- fit_decay_plot(decay_nf1, "non-F1 Only", mantel_nf1$statistic, mantel_nf1$signif)

plot_grid(p_all, p_f1, p_nf1, ncol = 1, labels = c("A", "B", "C"))
```

## Spatial Correlogram
Moran’s I or Mantel-based correlogram
Evaluate autocorrelation over distance lags

## maybe? aes_group_order, aes_position, isoreg {stats} Isotonic / Monotone Regression
Description
Compute the isotonic (monotonically increasing nonparametric) least squares regression which is piecewise constant.





