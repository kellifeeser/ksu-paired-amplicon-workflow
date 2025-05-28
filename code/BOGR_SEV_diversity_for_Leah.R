# Diversity for Leah



Bac_wholecommunity<-readRDS(file = "../processed_data/clean_rds_saves/Bac_wholecommunity.rds")
Fun_wholecommunity <- readRDS(file="../processed_data/clean_rds_saves/Fun_wholecommunity.rds")

Bac_SEVa<-subset_samples(Bac_wholecommunity, Site=="SEV")
Bac_SEV_BOGRa<-subset_samples(Bac_SEVa, Grass=="BOGR")
Bac_SEV_BOGR <- prune_taxa(taxa_sums(Bac_SEV_BOGRa) > 0, Bac_SEV_BOGRa)
Bac_SEV_BOGR
get_taxa_unique(Bac_SEV_BOGR, taxonomic.rank = "Genus")

Fun_SEVa<-subset_samples(Fun_wholecommunity, Site=="SEV")
Fun_SEV_BOGRa<-subset_samples(Fun_SEVa, Grass=="BOGR")
Fun_SEV_BOGR <- prune_taxa(taxa_sums(Fun_SEV_BOGRa) > 0, Fun_SEV_BOGRa)
Fun_SEV_BOGR
get_taxa_unique(Fun_SEV_BOGR, taxonomic.rank = "Genus")


View(sample_data(Bac_wholecommunity))
View(sample_data(Fun_wholecommunity))

Bac_BOGRa<-subset_samples(Bac_wholecommunity, Grass=="BOGR")
Bac_BOGR <- prune_taxa(taxa_sums(Bac_BOGRa) > 0, Bac_BOGRa)
Bac_BOGR
get_taxa_unique(Bac_BOGR, taxonomic.rank = "Genus")
mean(estimate_richness(Bac_BOGR, measures = "Observed")$Observed)
sd(estimate_richness(Bac_BOGR, measures = "Observed")$Observed)

Fun_BOGRa<-subset_samples(Fun_wholecommunity, Grass=="BOGR")
Fun_BOGR <- prune_taxa(taxa_sums(Fun_BOGRa) > 0, Fun_BOGRa)
Fun_BOGR
get_taxa_unique(Fun_BOGR, taxonomic.rank = "Genus")

summary(sample_data(Bac_BOGR)$pH)
summary(sample_data(Bac_BOGR)$SOM)
summary(sample_data(Bac_BOGR)$soil_moisture)
summary(sample_data(Bac_BOGR)$ammonium)
summary(sample_data(Bac_BOGR)$phos)
summary(sample_data(Bac_BOGR)$nitrate)
summary(sample_data(Bac_BOGR)$soil_moisture)

mean(estimate_richness(Fun_BOGR, measures = "Observed")$Observed)
sd(estimate_richness(Fun_BOGR, measures = "Observed")$Observed)
