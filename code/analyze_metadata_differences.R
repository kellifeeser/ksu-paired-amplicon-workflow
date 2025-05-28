library(phyloseq)
library(dplyr)
library(tibble)
library(ggpubr)
library(ggplot2)
library(glue)
library(effectsize)
library(purrr)
library(tidyr)
library(cowplot)

source("/Users/L347123/Desktop/black-sheep-club/code/sheepish_scripts.R")


analyze_metadata_differences <- function(physeq_object,
                                          group_var = "Fun_sor_clus2",
                                          vars = NULL,
                                          exclude_vars = NULL,
                                          filter = FALSE,
                                          group_levels = c("F1", "non-F1")) {
  
  # physeq_object = Fun_wholecommunity
  # group_var = "Fun_sor_clus2"
  # filter = F
  # exclude_vars = c("clus_sor_k10", "clus_sor_k10_new","Fun_sor_clus2", "SampleID")
  # group_levels = c("F1", "non-F1")
  
  # --- Extract metadata safely ---
  meta <- phylo2vegan_sd(physeq_object)
  meta_df <- as.data.frame(meta)
  meta_df <- meta_df[meta_df[[group_var]] %in% group_levels, ]
  
  # --- Resolve variable selection ---
  all_vars <- setdiff(names(meta_df), group_var)
  .meta_vars <- if (!is.null(exclude_vars)) {
    setdiff(all_vars, exclude_vars)
  } else if (!is.null(vars)) {
    all_vars
  } else {
    vars
  }
  
  results <- list()
  
  for (var in .meta_vars) {
    message(glue::glue("🔍 Processing variable: {var}"))
    vec <- meta_df[[var]]
    
    if (all(is.na(vec)) || length(unique(na.omit(vec))) < 2) {
      message(glue::glue("⚠️ Skipping {var}: constant or all NA"))
      next
    }
    
    df <- meta_df %>%
      dplyr::select(all_of(var), all_of(group_var)) %>%
      dplyr::filter(!is.na(.data[[var]]))
    
    x <- suppressWarnings(as.numeric(df[[var]]))
    is_numeric <- !all(is.na(x))
    
    test_res <- tryCatch({
      if (is_numeric) {
        df[[var]] <- x
        test <- wilcox.test(df[[var]] ~ df[[group_var]])
        eff <- effectsize::rank_biserial(df[[var]], df[[group_var]])
        pval_fmt <- format.pval(test$p.value, digits = 3, eps = .001)
        plot <- ggboxplot(df, x = group_var, y = var, fill = group_var, palette = c("#8E0152","#7FBC41")) +
          stat_compare_means(method = "wilcox.test", label.y.npc = "top") +
          theme_minimal(base_size = 9) +
          theme(legend.position = "none",
                plot.title = element_text(color="black", size=9),
                axis.text = element_text(color="black", size=8)) +
          labs(title = var, x = NULL, y = var)
        
        tibble(
          Variable = var,
          Type = "Numeric",
          Test = "Wilcoxon rank-sum",
          P_value = pval_fmt,
          Effect_size = round(eff$r_rank_biserial, 2),
          test_obj = list(test),
          effect_obj = list(eff),
          plot = list(plot)
        )
        
      } else if (is.factor(vec) || is.character(vec)) {
        tab <- table(df[[var]], df[[group_var]])
        if (all(dim(tab) > 1)) {
          test <- fisher.test(tab)
          pval_fmt <- format.pval(test$p.value, digits = 3, eps = .001)
          tibble(
            Variable = var,
            Type = "Categorical",
            Test = "Fisher's exact",
            P_value = pval_fmt,
            Effect_size = NA,
            test_obj = list(test),
            effect_obj = list(NULL),
            plot = list(NULL)
          )
        } else {
          NULL
        }
      } else {
        NULL
      }
    }, error = function(e) {
      message(glue::glue("❌ Error testing {var}: {e$message}"))
      NULL
    })
    
    if (!is.null(test_res)) results[[var]] <- test_res
  }
  
  # --- Combine and filter ---
  res_df <- results %>%
    keep(~ all(c("P_value", "Variable") %in% names(.x))) %>%
    bind_rows()
  
  if (nrow(res_df) == 0) {
    message("No valid variables returned test results.")
    return(invisible(tibble()))
  }
  
  res_df <- res_df %>%
    dplyr::mutate(P_value_numeric = suppressWarnings(as.numeric(P_value))) %>%
    arrange(P_value_numeric)
  
  if (filter) res_df <- res_df %>% filter(P_value_numeric < 0.1)
  
  # --- Print table ---
  print(
    res_df %>%
      dplyr::select(Variable, Type, Test, P_value, Effect_size) %>%
      knitr::kable(digits = 3, caption = "Metadata features distinguishing F1 vs non-F1") %>%
      kableExtra::kable_styling(full_width = FALSE)
  )
  
  # --- Plot
  plot_list <- res_df %>%
    filter(Type == "Numeric", !is.na(plot)) %>%
    pull(plot)
  
  if (length(plot_list) > 0) {
    ncol_grid <- min(3, length(plot_list))
    print(cowplot::plot_grid(plotlist = plot_list, ncol = 4))
  } else {
    message("No numeric variables passed filtering for plotting.")
  }
  
  invisible(res_df)
}
