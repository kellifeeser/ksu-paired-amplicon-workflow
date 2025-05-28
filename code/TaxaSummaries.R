# Taxa summaries

library(microbiome)

# 1) a list of all the fungal and bacterial taxa from blue grama from the Sev, 
# 2) list of generalists and specialists just from the Sev data 
  # (if possible, if not all blue grama is fine - actually maybe send both), 
# 3) some of the plots you have created showing differences between bacterial and fungal communities with the edaphic or env variables (pick your favorites - will not go into these in detail, so it simply for visual/contextual impact).


##### all sites, only blue grama ##### 
# Fun - all sites, only blue grama

Fun_siteAll_grassBOGR1 <- subset_samples(Fun_wholecommunity, Grass=="BOGR")
Fun_siteAll_grassBOGR2 <- prune_taxa(taxa_sums(Fun_siteAll_grassBOGR1) > 0, Fun_siteAll_grassBOGR1)
Fun_siteAll_grassBOGR <- Fun_siteAll_grassBOGR2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Fun_siteAll_grassBOGR

Fun_siteAll_grassBOGR_taxa <- cbind(tax_table(Fun_siteAll_grassBOGR),otu_table(Fun_siteAll_grassBOGR))

write.csv(Fun_siteAll_grassBOGR_taxa, file = "../processed_data/taxa_summaries/Fun_siteAll_grassBOGR_taxa.csv")

# Bac - all sites, only blue grama

Bac_siteAll_grassBOGR1 <- subset_samples(Bac_wholecommunity, Grass=="BOGR")
Bac_siteAll_grassBOGR2 <- prune_taxa(taxa_sums(Bac_siteAll_grassBOGR1) > 0, Bac_siteAll_grassBOGR1)
Bac_siteAll_grassBOGR <- Bac_siteAll_grassBOGR2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Bac_siteAll_grassBOGR

Bac_siteAll_grassBOGR_taxa <- cbind(tax_table(Bac_siteAll_grassBOGR),otu_table(Bac_siteAll_grassBOGR))

write.csv(Bac_siteAll_grassBOGR_taxa, file = "../processed_data/taxa_summaries/Bac_siteAll_grassBOGR_taxa.csv")
######################################


##### site=SEV, only blue grama ##### 
# Fun - site=SEV, only blue grama

Fun_siteSEV_grassBOGR1 <- subset_samples(Fun_wholecommunity, Grass=="BOGR" & Site=="SEV")
Fun_siteSEV_grassBOGR2 <- prune_taxa(taxa_sums(Fun_siteSEV_grassBOGR1) > 0, Fun_siteSEV_grassBOGR1)
Fun_siteSEV_grassBOGR <- Fun_siteSEV_grassBOGR2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Fun_siteSEV_grassBOGR

Fun_siteSEV_grassBOGR_taxa <- cbind(tax_table(Fun_siteSEV_grassBOGR),otu_table(Fun_siteSEV_grassBOGR))

write.csv(Fun_siteSEV_grassBOGR_taxa, file = "../processed_data/taxa_summaries/Fun_siteSEV_grassBOGR_taxa.csv")

# Bac - site=SEV, only blue grama

Bac_siteSEV_grassBOGR1 <- subset_samples(Bac_wholecommunity, Grass=="BOGR" & Site=="SEV")
Bac_siteSEV_grassBOGR2 <- prune_taxa(taxa_sums(Bac_siteSEV_grassBOGR1) > 0, Bac_siteSEV_grassBOGR1)
Bac_siteSEV_grassBOGR <- Bac_siteSEV_grassBOGR2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Bac_siteSEV_grassBOGR

Bac_siteSEV_grassBOGR_taxa <- cbind(tax_table(Bac_siteSEV_grassBOGR),otu_table(Bac_siteSEV_grassBOGR))

write.csv(Bac_siteSEV_grassBOGR_taxa, file = "../processed_data/taxa_summaries/Bac_siteSEV_grassBOGR_taxa.csv")
######################################


##### site=SEV, only blue grama ##### 

# Fun - site=SEV, only blue grama
Fun_siteSEV_grassAll_onlyGenSpe1 <- subset_samples(Fun_wholecommunity, Site=="SEV")
Fun_siteSEV_grassAll_onlyGenSpe2 <- prune_taxa(taxa_sums(Fun_siteSEV_grassAll_onlyGenSpe1) > 0, Fun_siteSEV_grassAll_onlyGenSpe1)
Fun_siteSEV_grassAll_onlyGenSpe3 <- Fun_siteSEV_grassAll_onlyGenSpe2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Fun_siteSEV_grassAll_onlyGenSpe <- subset_taxa(Fun_siteSEV_grassAll_onlyGenSpe3, Sign!="NS")
Fun_siteSEV_grassAll_onlyGenSpe

Fun_siteSEV_grassAll_onlyGenSpe_taxa <- cbind(tax_table(Fun_siteSEV_grassAll_onlyGenSpe),otu_table(Fun_siteSEV_grassAll_onlyGenSpe))

write.csv(Fun_siteSEV_grassAll_onlyGenSpe_taxa, file = "../processed_data/taxa_summaries/Fun_siteSEV_grassAll_onlyGenSpe_taxa.csv")

# Bac - site=SEV, only blue grama
Bac_siteSEV_grassAll_onlyGenSpe1 <- subset_samples(Bac_wholecommunity, Site=="SEV")
Bac_siteSEV_grassAll_onlyGenSpe2 <- prune_taxa(taxa_sums(Bac_siteSEV_grassAll_onlyGenSpe1) > 0, Bac_siteSEV_grassAll_onlyGenSpe1)
Bac_siteSEV_grassAll_onlyGenSpe3 <- Bac_siteSEV_grassAll_onlyGenSpe2 %>% 
  transform_sample_counts(function(x) {x / sum(x)} )
Bac_siteSEV_grassAll_onlyGenSpe <- subset_taxa(Bac_siteSEV_grassAll_onlyGenSpe3, Sign!="NS")
Bac_siteSEV_grassAll_onlyGenSpe

Bac_siteSEV_grassAll_onlyGenSpe_taxa <- cbind(tax_table(Bac_siteSEV_grassAll_onlyGenSpe),otu_table(Bac_siteSEV_grassAll_onlyGenSpe))

write.csv(Bac_siteSEV_grassAll_onlyGenSpe_taxa, file = "../processed_data/taxa_summaries/Bac_siteSEV_grassAll_onlyGenSpe_taxa.csv")
######################################