# BacFun:Loop through each Fun_sor_clus2 ----
for (Fun_F1ornonF1 in var_Fun_sor_clus2) {
  # Subset samples by Fun_sor_clus2 for bacteria
  subset_bacteria <- subset_samples(Bac_wholecommunity, Fun_sor_clus2 == Fun_F1ornonF1)
  
  # Subset samples by Fun_sor_clus2 for fungi
  subset_fungi <- subset_samples(Fun_wholecommunity, Fun_sor_clus2 == Fun_F1ornonF1)
  
  # Prune OTUs based on presence in each subset
  pruned_bacteria <- prune_taxa(taxa_sums(subset_bacteria) > 0, subset_bacteria)
  pruned_fungi <- prune_taxa(taxa_sums(subset_fungi) > 0, subset_fungi)
  
  # Bac
  # Make OTU df for bacteria
  Bac_Fun_sor_clus2_otu <- as.data.frame(t(otu_table(pruned_bacteria)))
  
  # Create presence absence matrices for bacteria
  Bac_Fun_sor_clus2_otu.pres.abs <- decostand(x = Bac_Fun_sor_clus2_otu, method = "pa")
  
  # Get betapart objects for bacteria
  Bac.Fun_sor_clus2.core <- betapart.core(Bac_Fun_sor_clus2_otu.pres.abs) # n obs. of n_OTUs variables
  betapart_results$Bac$Fun_sor_clus2$core[[paste0(Fun_F1ornonF1,"_Bac")]] <- Bac.Fun_sor_clus2.core
  
  # Multiple site measures for bacteria
  Bac.Fun_sor_clus2.multi <- beta.multi(Bac.Fun_sor_clus2.core, index.family = "sorensen")
  betapart_results$Bac$Fun_sor_clus2$multi[[paste0(Fun_F1ornonF1,"_Bac")]] <- Bac.Fun_sor_clus2.multi
  
  # Sampling across equal sites for bacteria
  n_sites.Bac.Fun_sor_clus2 <- ave(as.numeric(factor(sample_data(pruned_bacteria)$Site)), 
                                      sample_data(pruned_bacteria)$Fun_sor_clus2, 
                                      FUN = function(x) length(unique(x)))
  
  Bac.Fun_sor_clus2.samp.bysamples <- beta.sample(Bac.Fun_sor_clus2.core, index.family = "sorensen", 
                                                     sites = min(ave(as.numeric(factor(sample_data(pruned_bacteria)$SampleID)), sample_data(pruned_bacteria)$Fun_sor_clus2, FUN = function(x) length(unique(x)))), 
                                                     samples = 1000)
  betapart_results$Bac$Fun_sor_clus2$resamp[[paste0(Fun_F1ornonF1,"_Bac_nsamples",min(ave(as.numeric(factor(sample_data(pruned_bacteria)$SampleID)), sample_data(pruned_bacteria)$Fun_sor_clus2, FUN = function(x) length(unique(x)))))]] <- Bac.Fun_sor_clus2.samp.bysamples
  
  # skip if only one site per cluster
  if (length(unique(n_sites.Bac.Fun_sor_clus2)) == 1 && unique(n_sites.Bac.Fun_sor_clus2) == 1) {
    # Get the name of the looped variable
    message(paste("Skipping bacterial beta.sample for bacterial", Fun_F1ornonF1, "due to only 1 Site per Fun_sor_clus2 level."))
  } else {
    # Otherwise, proceed with beta.sample
    # min_n_sites <- min(n_sites.Bac.Fun_sor_clus2)
    
    Bac.Fun_sor_clus2.samp.bysites <- beta.sample(Bac.Fun_sor_clus2.core, index.family = "sorensen", 
                                                     sites = min(ave(as.numeric(factor(sample_data(pruned_bacteria)$Site)), sample_data(pruned_bacteria)$Fun_sor_clus2, FUN = function(x) length(unique(x)))), 
                                                     samples = 1000)
    betapart_results$Bac$Fun_sor_clus2$resamp[[paste0(Fun_F1ornonF1,"_Bac_nsites",min(ave(as.numeric(factor(sample_data(pruned_bacteria)$Site)), sample_data(pruned_bacteria)$Fun_sor_clus2, FUN = function(x) length(unique(x)))))]] <- Bac.Fun_sor_clus2.samp.bysites
  }
  
  # Pairwise measures for bacteria
  Bac.Fun_sor_clus2.pairwise <- beta.pair(Bac.Fun_sor_clus2.core, index.family = "sorensen")
  betapart_results$Bac$Fun_sor_clus2$pairwise[[paste0(Fun_F1ornonF1,"_Bac")]] <- Bac.Fun_sor_clus2.pairwise
  
  # Fun
  # Make OTU df for fungi
  Fun_Fun_sor_clus2_otu <- as.data.frame(t(otu_table(pruned_fungi)))
  
  # Create presence absence matrices for fungi
  Fun_Fun_sor_clus2_otu.pres.abs <- decostand(x = Fun_Fun_sor_clus2_otu, method = "pa")
  
  # Get betapart objects for fungi
  Fun.Fun_sor_clus2.core <- betapart.core(Fun_Fun_sor_clus2_otu.pres.abs) # n obs. of n_OTUs variables
  betapart_results$Fun$Fun_sor_clus2$core[[paste0(Fun_F1ornonF1,"_Fun")]] <- Fun.Fun_sor_clus2.core
  
  # Multiple site measures for fungi
  Fun.Fun_sor_clus2.multi <- beta.multi(Fun.Fun_sor_clus2.core, index.family = "sorensen")
  betapart_results$Fun$Fun_sor_clus2$multi[[paste0(Fun_F1ornonF1,"_Fun")]] <- Fun.Fun_sor_clus2.multi
  
  # Sampling across equal sites for fungi
  n_sites.Fun.Fun_sor_clus2 <- ave(as.numeric(factor(sample_data(pruned_fungi)$Site)), 
                                      sample_data(pruned_fungi)$Fun_sor_clus2, 
                                      FUN = function(x) length(unique(x)))
  
  Fun.Fun_sor_clus2.samp.bysamples <- beta.sample(Fun.Fun_sor_clus2.core, index.family = "sorensen", 
                                                     sites = min(ave(as.numeric(factor(sample_data(pruned_fungi)$SampleID)), sample_data(pruned_fungi)$Fun_sor_clus2, FUN = function(x) length(unique(x)))), 
                                                     samples = 1000)
  betapart_results$Fun$Fun_sor_clus2$resamp[[paste0(Fun_F1ornonF1,"_Fun_nsamples",min(ave(as.numeric(factor(sample_data(pruned_fungi)$SampleID)), sample_data(pruned_fungi)$Fun_sor_clus2, FUN = function(x) length(unique(x)))))]] <- Fun.Fun_sor_clus2.samp.bysamples
  
  # skip if only one site per cluster
  if (length(unique(n_sites.Fun.Fun_sor_clus2)) == 1 && unique(n_sites.Fun.Fun_sor_clus2) == 1) {
    # Get the name of the looped variable
    message(paste("Skipping fungal beta.sample for bacterial", Fun_F1ornonF1, "due to only 1 Site per Fun_sor_clus2 level."))
  } else {
    # Otherwise, proceed with beta.sample
    Fun.Fun_sor_clus2.samp.bysites <- beta.sample(Fun.Fun_sor_clus2.core, index.family = "sorensen", 
                                                     sites = min(ave(as.numeric(factor(sample_data(pruned_fungi)$Site)), sample_data(pruned_fungi)$Fun_sor_clus2, FUN = function(x) length(unique(x)))), 
                                                     samples = 1000)
    betapart_results$Fun$Fun_sor_clus2$resamp[[paste0(Fun_F1ornonF1,"_Fun_nsites",min(ave(as.numeric(factor(sample_data(pruned_fungi)$Site)), sample_data(pruned_fungi)$Fun_sor_clus2, FUN = function(x) length(unique(x)))))]] <- Fun.Fun_sor_clus2.samp.bysites
  }
  
  # Pairwise measures for fungi
  Fun.Fun_sor_clus2.pairwise <- beta.pair(Fun.Fun_sor_clus2.core, index.family = "sorensen")
  betapart_results$Fun$Fun_sor_clus2$pairwise[[paste0(Fun_F1ornonF1,"_Fun")]] <- Fun.Fun_sor_clus2.pairwise
}
# ----