# nique_otus_and_abundance <- function(physeq, factor_var) {
  
  # Extract OTU table - taxa are rows
  otu_table <- as.data.frame(t(as.data.frame(phylo2vegan_OTU(Fun_wholecommunity.r))))
  
  # Extract sample data
  sample_data <- as(sample_data(Fun_wholecommunity.r), "data.frame")
  
  # Get unique factor levels
  factor_levels <- unique(sample_data[, "clus_sor_k10"])
  
  # Initialize empty vectors to store results
  num_unique_otus <- numeric(length(factor_levels))
  gamma_proportion <- numeric(length(factor_levels))
  summed_rel_abundance <- numeric(length(factor_levels))
  avg_abundance <- numeric(length(factor_levels))
  sd_abundance <- numeric(length(factor_levels))
  
  # Iterate over factor levels
  for (i in seq_along(factor_levels)) {
    # Subset sample data for the current level
    subset_samples <- sample_data[, "clus_sor_k10"] == 1
    
    # Subset OTU table for the current level
    subset_otus <- otu_table[, subset_samples]
    
    # Identify unique OTUs for the current level and count them
    num_unique_otus[i] <- sum(rowSums(subset_otus) > 0)
    
    # Calculate proportion of unique OTUs vs total OTU count (proportion of gamma present)
    gamma_proportion[i] <- num_unique_otus[i] / ncol(subset_otus)
    
    # Identify OTUs exclusively found in the current factor level
    exclusive_otus <- rowSums(otu_table[, !subset_samples]) == 0 & rowSums(subset_otus) > 0
    
    # Filter the OTU table to include only the unique OTUs
    subset_exclusive_otus <- otu_table[exclusive_otus, ]
    
    # Calculate average and standard deviation of relative abundance for unique OTUs
    avg_abundance[i] <- mean(rowMeans(subset_otus))
    sd_abundance[i] <-sd(rowMeans(subset_otus))
    
    
  }
  
  # Combine results into a data frame
  result_df <- data.frame(
    Factor_Level = factor_levels,
    Num_Unique_OTUs = num_unique_otus, #total # of OTUs observed
    gamma_proportion = gamma_proportion,
    Num_Unique_OTUs = num_unique_otus, # OTUs observed exclusively at factor level
    summed_rel_abundance[i] <- sum(rowMeans(subset_otus))*100,
    Avg_Relative_Abundance = avg_abundance*100,
    SD_Relative_Abundance = sd_abundance*100
  )
  
  # return(result_df)
# }

# Example usage:
# unique_otus_and_abundance(my_phyloseq_object, "Treatment")

UOA_Fwc_clus_sor_k10 <- unique_otus_and_abundance(Fun_wholecommunity.r, "clus_sor_k10")