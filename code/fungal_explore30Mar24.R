# fungal explore
## 30 mar '24


# clusters 2 and 9 are 1 grass specific

# Clusters
## 1: 
  # total n=183
## 2: Sites=BNP,DMT,FMT,SEV, Grass=mostly BOER (n=33) (BOGR n=4)
  # total n=37
## 3: 
  # total n=56
## 4: 
  # total n=17
## 5: 
  # total n=43
## 6: 
  # total n=32
## 7: 
  # total n=38
## 8: Site is mostly LAR (n=27)
  # total n=29
## 9: Site=SFA, 1 of 1 grasses (SCSC)
  # total n=9
## 10: Site=KAE, 3 of 3 grasses, high herbivory_perc, only tallgrass
  # total n=29
  # exclusively Site=KAE (of the 32 KAE sample, only 3 others)

Fun_wc_clus_meta1 <- as(sample_data(Fun_wholecommunity),"data.frame")
Fun_wc_clus_meta <- subset(Fun_wc_clus_meta1, select = c(58,3,5,8,15,16,32,29,33,34,36,
                                                         37:39,24,27,60:63))

# setup ----

write.csv(Fun_wc_clus_meta1,file = "processed_data/Fun_wc_clus_meta1.csv")

View(sample_data(Fun_wholecommunity)[sample_data(Fun_wholecommunity)$Fun_sor_clusters == "F1", 
                                     c("sample_name", "Fun_sor_clusters","Site", "Grass",
                                       "pH", "SOM","phos","soil_moisture","ammonium")])

View(sample_data(Fun_wholecommunity)[sample_data(Fun_wholecommunity)$Site == "SFA", 
                                     c("sample_name", "Fun_sor_clusters","Site", "Grass",
                                       "pH", "SOM","phos","soil_moisture","ammonium")])

Fun_nonF1a <- subset_samples(Fun_wholecommunity, Fun_sor_clus2 == "non-F1")
Fun_nonF1 <- prune_taxa(taxa_sums(Fun_nonF1a) > 0, Fun_nonF1a)

Fun_F1a <- subset_samples(Fun_wholecommunity, Fun_sor_clus2 == "F1")
Fun_F1 <- prune_taxa(taxa_sums(Fun_F1a) > 0, Fun_F1a)

Fun_alpha<-estimate_richness(Fun_wholecommunity, split = T,measures="Observed")
Fun_F1_alpha<-estimate_richness(Fun_F1, split = T,measures="Observed")
Fun_nonF1_alpha<-estimate_richness(Fun_nonF1, split = T,measures="Observed")

estimate_richness(Fun_F1, split = F,measures="Observed")
estimate_richness(Fun_nonF1, split = F,measures="Observed")

tapply(Fun_alpha$Observed, sd$Fun_sor_clus2, mean)
tapply(Fun_alpha$Observed, sd$Fun_sor_clus2, sd)


length(subset(sd$Fun_sor_clus2,sd$Fun_sor_clus2 == "non-F1"))
length(subset(sd$Fun_sor_clus2,sd$Fun_sor_clus2 == "F1"))

clus_comparisons <- list(
  c("F1", "FF2"), c("F1", "F3"), c("F1", "F4"), c("F1", "F5"), c("F1", "F6"), c("F1", "F7"), c("F1", "F8"), c("F1", "F9"), c("F1", "F10"),
  c("F2", "F3"), c("F2", "F4"), c("F2", "F5"), c("F2", "F6"), c("F2", "F7"), c("F2", "F8"), c("F2", "F9"), c("F2", "F10"),
  c("F3", "F4"), c("F3", "F5"), c("F3", "F6"), c("F3", "F7"), c("F3", "F8"), c("F3", "F9"), c("F3", "F10"),
  c("F4", "F5"), c("F4", "F6"), c("F4", "F7"), c("F4", "F8"), c("F4", "F9"), c("F4", "F10"),
  c("F5", "F6"), c("F5", "F7"), c("F5", "F8"), c("F5", "F9"), c("F5", "F10"),
  c("F6", "F7"), c("F6", "F8"), c("F6", "F9"), c("F6", "F10"),
  c("F7", "F8"), c("F7", "F9"), c("F7", "F10"),
  c("F8", "F9"), c("F8", "F10"),
  c("F9", "F10")
)

col_n10 <- c("F1"="#8E0152","F2"="#C51B7D","F3"="#DE77AE","F4"="#F1B6DA","F5"="#C5C2EA",
             "F6"="#8DC9BB","F7"="#86C37E","F8"="#7FBC41","F9"="#4D9221","F10"="#276419")
#  ----
### Subsection 1.1 ----

#### Subsection 1.1.1 ----

# Boxplots --------------------------------------------------------------
# Create an empty list to store the figures
boxplot_figs <- list()

# Edaphic plots
edaphic_plots <- list()
# edaphic_plots$plot1 <- ggplot(data = your_edaphic_data_1) + ...
# edaphic_plots$plot2 <- ggplot(data = your_edaphic_data_2) + ...
# boxplot_figs$edaphic <- edaphic_plots

# Genera plots
genera_plots <- list()
# genera_plots$plot1 <- ggplot(data = your_genera_data_1) + ...
# genera_plots$plot2 <- ggplot(data = your_genera_data_2) + ...
# boxplot_figs$genera <- genera_plots

# Climate plots
climate_plots <- list()
# climate_plots$plot1 <- ggplot(data = your_climate_data_1) + ...
# climate_plots$plot2 <- ggplot(data = your_climate_data_2) + ...
# boxplot_figs$climate <- climate_plots
## pH ----

# Calculate mean pH values for each group
Fun_wc_clus_meta <- Fun_wc_clus_meta1
sort(mean_pH) <- tapply(Fun_wc_clus_meta1$pH, Fun_wc_clus_meta1$Fun_sor_clusters, mean)

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "pH",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$pH) + 0.5,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$pH), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(pH ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)

## perc_moisture ----

# Calculate mean perc_moisture values for each group
mean_perc_moisture <- tapply(Fun_wc_clus_meta$perc_moisture, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_perc_moisture

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "perc_moisture",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$perc_moisture) + 0.05,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$perc_moisture), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(perc_moisture ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## SOM ----

# Calculate mean SOM values for each group
mean_SOM <- tapply(Fun_wc_clus_meta$SOM, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_SOM

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "SOM",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$SOM) + 0.6,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$SOM), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(SOM ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## phos ----

# Calculate mean phos values for each group
mean_phos <- tapply(Fun_wc_clus_meta$phos, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_phos

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "phos",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$phos) + 0.01,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$phos), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(phos ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## ammonium ----

# Calculate mean ammonium values for each group
mean_ammonium <- tapply(Fun_wc_clus_meta$ammonium, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_ammonium

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "ammonium",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$ammonium) + 0.05,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$ammonium), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(ammonium ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## ppt3yr ----

# Calculate mean ppt3yr values for each group
# Fun_wc_clus_meta<-sd
mean_ppt3yr <- tapply(Fun_wc_clus_meta$ppt3yr, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_ppt3yr

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "ppt3yr",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$ppt3yr) + 60,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$ppt3yr), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(ppt3yr ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
compare_means(ppt3yr ~ Fun_sor_clus2,  data = Fun_wc_clus_meta,
              # ref.group = ".all.", 
              method = "wilcox.test", paired = F)
tapply(Fun_wc_clus_meta$ppt3yr, Fun_wc_clus_meta$Fun_sor_clus2, mean)
tapply(Fun_wc_clus_meta$ppt3yr, Fun_wc_clus_meta$Fun_sor_clus2, sd)


tapply(sd$Observed, sd$Fun_sor_clus2, mean)
tapply(sd$Observed, sd$Fun_sor_clus2, sd)

## GDD3yr ----

# Calculate mean GDD3yr values for each group
mean_GDD3yr <- tapply(Fun_wc_clus_meta$GDD3yr, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_GDD3yr

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "GDD3yr",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$GDD3yr) + 200,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$GDD3yr), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(GDD3yr ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## herbivory_perc ----

# Calculate mean herbivory_perc values for each group
mean_herbivory_perc <- tapply(Fun_wc_clus_meta$herbivory_perc, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_herbivory_perc

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "herbivory_perc",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$herbivory_perc) + 1,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$herbivory_perc), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(herbivory_perc ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)
## pH ----

# Calculate mean pH values for each group
mean_pH <- tapply(Fun_wc_clus_meta$pH, Fun_wc_clus_meta$Fun_sor_clusters, mean) %>% sort(.)
mean_pH

ggboxplot(Fun_wc_clus_meta, x = "Fun_sor_clusters", y = "pH",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = ".all.", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F)+ 
  stat_compare_means(label.y = max(Fun_wc_clus_meta$pH) + 0.5,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fun_wc_clus_meta$pH), linetype = 2)+ # add mean hline
  # scale_x_discrete(limits=rev(c("4","6","10","7","9","1","2","5","3","8")))+
  theme(legend.position = "none")+
  ggtitle("wilcox.test: all v. all")

compare_means(pH ~ Fun_sor_clusters,  data = Fun_wc_clus_meta,
              ref.group = ".all.", method = "wilcox.test", paired = F)


## OTUs ----
Fun_wholecommunity.r  = transform_sample_counts(Fun_wholecommunity, function(x) x / sum(x) )
predictors.Fwc_relOTU <- t(otu_table(Fun_wholecommunity.r))
response.Fun_sor_clusters <- as.factor(sample_data(Fun_wholecommunity)$Fun_sor_clusters)


Fwc_relOTU.Fun_sor_clusters<-data.frame(response.Fun_sor_clusters, predictors.Fwc_relOTU)
Fwc_rel.Fun_sor_clusters<-data.frame(response.Fun_sor_clusters, predictors.Fwc_relOTU)

colnames(Fwc_relOTU.Fun_sor_clusters)[1] <- "Fun_sor_clusters"
colnames(Fwc_rel.Fun_sor_clusters)[1] <- "Fun_sor_clusters"


saveRDS(Fwc_rel.Fun_sor_clusters,file = "/Users/L347123/Desktop/ksu-paired-amplicon-workflow/processed_data/Clustering/Fwc_rel.Fun_sor_clusters.rds")

# saveRDS(Fun_wholecommunity.r, file = "processed_data/clean_rds_saves/Fun_wholecommunity.r.rds") 
# Fun_wholecommunity.r<-readRDS(file = "../processed_data/clean_rds_saves/Fun_wholecommunity.r.rds") 

# Bac_wholecommunity.r  = transform_sample_counts(Bac_wholecommunity, function(x) x / sum(x) )
# saveRDS(Bac_wholecommunity.r, file = "processed_data/clean_rds_saves/Bac_wholecommunity.r.rds") 

# view votes by sample
View(Fun_wholecommunity_classify.Fun_sor_clusters$votes[c("SRR13801402","SRR13801177","SRR13801366"),])

# view OTU abund w cluster info
# View(Fwc_rel.Fun_sor_clusters[,c(1,"")])

### OTU205 ----
ggboxplot(Fwc_rel.Fun_sor_clusters, x = "Fun_sor_clusters", y = "OTU205",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = "F1", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F
                     ,label.y = 0.0085)+ 
  stat_compare_means(label.y = 0.0098,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fwc_rel.Fun_sor_clusters$OTU205), linetype = 2)+ # add mean hline
  scale_y_continuous(limits = c(0,0.01),labels = scales::percent)+
  theme(legend.position = "none")+
  ggtitle("OTU205, Generalist\nwilcox.test: all (global RA = %) v. Cluster F1 (mean RA = 0.38%)")

compare_means(OTU205 ~ Fun_sor_clusters,  data = Fwc_rel.Fun_sor_clusters,
              ref.group = ".all.", method = "wilcox.test", paired = F)

round(mean(Fwc_rel.Fun_sor_clusters$OTU205[Fwc_rel.Fun_sor_clusters$Fun_sor_clusters=="F1"])*100,2)
round(mean(Fwc_rel.Fun_sor_clusters$OTU205)*100,2)

tax_table(Fun_wholecommunity)["OTU205",]
# "Basidiomycota" "Agaricomycetes" "Agaricales" "Strophariaceae" "uncl_Strophariaceae" "uncl_Strophariaceae"


### OTU6679 ----
ggboxplot(Fwc_rel.Fun_sor_clusters, x = "Fun_sor_clusters", y = "OTU6679",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = "F1", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F
                     ,label.y = 0.1)+ 
  stat_compare_means(label.y = 0.105,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fwc_rel.Fun_sor_clusters$OTU6679), linetype = 2)+ # add mean hline
  scale_y_continuous(limits = c(0,0.105),labels = scales::percent)+
  theme(legend.position = "none")+
  ggtitle("OTU6679, Generalist\nwilcox.test: all (global RA = 1.65%) v. Cluster F1 (mean RA = 3.75%)")

compare_means(OTU6679 ~ Fun_sor_clusters,  data = Fwc_rel.Fun_sor_clusters,
              ref.group = ".all.", method = "wilcox.test", paired = F)

round(mean(Fwc_rel.Fun_sor_clusters$OTU6679[Fwc_rel.Fun_sor_clusters$Fun_sor_clusters=="F1"])*100,2)
round(mean(Fwc_rel.Fun_sor_clusters$OTU6679)*100,2)

tax_table(Fun_wholecommunity)["OTU6679",]
# ""Ascomycota" "Sordariomycetes" "Hypocreales" "Nectriaceae" "Fusarium" "uncl_Fusarium"


### OTU1252 ----
OTU1252_taxstring<-paste(tax_table(Fun_wholecommunity)["OTU1252",2],
                         tax_table(Fun_wholecommunity)["OTU1252",3],
                         tax_table(Fun_wholecommunity)["OTU1252",4],
                         tax_table(Fun_wholecommunity)["OTU1252",5],
                         tax_table(Fun_wholecommunity)["OTU1252",6],
                         tax_table(Fun_wholecommunity)["OTU1252",7],
                         sep = ";")

ggboxplot(Fwc_rel.Fun_sor_clusters, x = "Fun_sor_clusters", y = "OTU1252",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = "F1", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F
                     ,label.y = 0.0047)+ 
  stat_compare_means(label.y = 0.005,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fwc_rel.Fun_sor_clusters$OTU1252), linetype = 2)+ # add mean hline
  scale_y_continuous(limits = c(0,0.005),labels = scales::percent)+
  theme(legend.position = "none")+
  ggtitle(paste("OTU1252 - ",OTU1252_taxstring,
                "\nwilcox.test: all (global RA = ", round(mean(Fwc_rel.Fun_sor_clusters$OTU1252)*100,2),
                "%) v. Cluster F1 (mean RA = ",
                round(mean(Fwc_rel.Fun_sor_clusters$OTU1252[Fwc_rel.Fun_sor_clusters$Fun_sor_clusters=="F1"])*100,2),
                "%)",sep = ""))

compare_means(OTU1252 ~ Fun_sor_clusters,  data = Fwc_rel.Fun_sor_clusters,
              ref.group = ".all.", method = "wilcox.test", paired = F)

round(mean(Fwc_rel.Fun_sor_clusters$OTU1252[Fwc_rel.Fun_sor_clusters$Fun_sor_clusters=="F1"])*100,2)
round(mean(Fwc_rel.Fun_sor_clusters$OTU1252)*100,2)

tax_table(Fun_wholecommunity)["OTU1252",]
# "Basidiomycota" "Agaricomycetes" "Polyporales" "Podoscyphaceae" "Podoscypha" "uncl_Podoscypha"


## Genera ----
Fwc_Genus.r <- Fun_wholecommunity %>% 
    tax_glom(taxrank = "Genus") %>%
    transform_sample_counts(function(x) {x / sum(x)} )

Fwc_Genus.r_otu_table <- (as.data.frame(phylo2vegan_OTU(Fwc_Genus.r))) # rows are samples

genuslist <- (tax_table(Fwc_Genus.r)[,6])

colnames(Fwc_Genus.r_otu_table) <- genuslist

# Fun_wc_clus_meta1 <- as(sample_data(Fun_wholecommunity),"data.frame")
# Fun_wc_clus_meta <- subset(Fun_wc_clus_meta1, select = c(58,3,5,8,15,16,32,29,33,34,36,
#                                                          37:39,24,27,60))
colnames(subset(Fun_wc_clus_meta1, 
                select = c(60,3,5,6,8,15,16,17:20,32,29,31,36,33,34,35,27,26,24,23,22,37:39,62)))

Fwc_Genus.r_otu_dat <- data.frame(Fun_wc_clus_meta1,Fwc_Genus.r_otu_table)



### Fusarium ----
genera_plots$Fusarium<-ggboxplot(Fwc_Genus.r_otu_dat, x = "Fun_sor_clusters", y = "Fusarium",
          fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = "F1", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F
                     ,label.y = 0.28)+ 
  stat_compare_means(label.y = 0.3,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fwc_Genus.r_otu_dat$Fusarium), linetype = 2)+ # add mean hline
  scale_y_continuous(limits = c(0,0.305),labels = scales::percent)+
  theme(legend.position = "none",
        axis.text = element_text(size=12, color = "black"),
        axis.title = element_text(size=14, color = "black"))+
  labs(title = "Genus: Fusarium",caption = "pairwise wilcox.test, ref.group = Cluster F1",
       subtitle = paste("Cluster F1 (mean RA = ",
                        round(mean(Fwc_Genus.r_otu_dat$Fusarium[Fwc_Genus.r_otu_dat$Fun_sor_clusters=="1"])*100,1),
                        "%) vs. all (global RA = ", 
                        round(mean(Fwc_Genus.r_otu_dat$Fusarium)*100,1),
                        "%)",sep = ""))


saveRDS(Fwc_Genus.r_otu_dat, file = "/Users/L347123/Desktop/ksu-paired-amplicon-workflow/processed_data/clean_rds_saves/Fwc_Genus.r_otu_dat.rds") 

Fwc_Genus.r_otu_dat<-readRDS(file = "../processed_data/clean_rds_saves/Fwc_Genus.r_otu_dat.rds") 

compare_means(Fusarium ~ Fun_sor_clusters,  data = Fwc_Genus.r_otu_dat,
              ref.group = ".all.", method = "wilcox.test", paired = F)

round(mean(Fwc_Genus.r_otu_dat$Fusarium[Fwc_Genus.r_otu_dat$Fun_sor_clusters=="1"])*100,2)
round(mean(Fwc_Genus.r_otu_dat$Fusarium)*100,2)

### Fusarium ----
genera_plots$Fusarium<-ggboxplot(Fwc_Genus.r_otu_dat, x = "Fun_sor_clusters", y = "Fusarium",
                                 fill = "Fun_sor_clusters", palette = col_n10)+ 
  stat_compare_means(aes(label = after_stat(p.signif)),
                     method = "wilcox.test", ref.group = "F1", # Add pairwise comparisons p-value
                     label = "p.signif",hide.ns=T, paired = F
                     ,label.y = 0.28)+ 
  stat_compare_means(label.y = 0.3,label.x = 1.5)+     # Add global p-value
  geom_hline(yintercept = mean(Fwc_Genus.r_otu_dat$Fusarium), linetype = 2)+ # add mean hline
  scale_y_continuous(limits = c(0,0.305),labels = scales::percent)+
  theme(legend.position = "none",
        axis.text = element_text(size=12, color = "black"),
        axis.title = element_text(size=14, color = "black"))+
  labs(title = "Genus: Fusarium",caption = "pairwise wilcox.test, ref.group = Cluster F1",
       subtitle = paste("Cluster F1 (mean RA = ",
                        round(mean(Fwc_Genus.r_otu_dat$Fusarium[Fwc_Genus.r_otu_dat$Fun_sor_clusters=="1"])*100,1),
                        "%) vs. all (global RA = ", 
                        round(mean(Fwc_Genus.r_otu_dat$Fusarium)*100,1),
                        "%)",sep = ""))


# SIMPER ----
simper(phylo2vegan_OTU(Fun_wholecommunity), phylo2vegan_sd(Fun_wholecommunity)$Fun_sor_clusters, permutations=999)

SIMPER_out_n99 <- list()
SIMPER_Fun_wholecommunity_out <- list()
# SIMPER_out_n99$Fun_wholecommunity <- SIMPER_Fun_wholecommunity_out

(SIMPER_Fun_wholecommunity_out$Fun_sor_clusters <- with(phylo2vegan_sd(Fun_wholecommunity), 
             simper(phylo2vegan_OTU(Fun_wholecommunity), Fun_sor_clusters, permutations = 99)))
summary(SIMPER_Fun_wholecommunity_out$Fun_sor_clusters$`1_2`, ordered=T, digits=2)
str(SIMPER_Fun_wholecommunity_out$Fun_sor_clusters)

sum(SIMPER_Fun_wholecommunity_out$Fun_sor_clusters$`1_2`$average)
reorder(as.data.frame(SIMPER_Fun_wholecommunity_out$Fun_sor_clusters$`1_2`))

head(tax_table(Fun_wholecommunity.r))

cbind()

saveRDS(SIMPER_Fun_wholecommunity_out,file = "processed_data/Clustering/SIMPER_Fun_wholecommunity_out.rds")
getwd()
# bymedian <- with(InsectSprays, reorder(spray, count, median))

# boxplot(abund$Otu00001 ~ meta$AgeGroup.ord, ylab="% Relative abundance", main="OTU1")


# between/within-group dissimilarities ----

#Multi Response Permutation Procedure and Mean Dissimilarity Matrix
  # Multiple Response Permutation Procedure (MRPP) provides a test of 
    #whether there is a significant difference between two or more groups of sampling units. 
  # Function meandist finds the mean within and between block dissimilarities.


mrpp_Fwc_Fun_sor_clusters_n999<-mrpp(Fun_wc_sorensen_distmat, phylo2vegan_sd(Fun_wholecommunity)$Fun_sor_clusters, 
     permutations = 999, #distance = "euclidean",
     weight.type = 1, #(1) group size 
     strata = NULL)

# Fun
Fun_wc_sorensen_distmat[1:3,1:3]
Fun_wc_sorensen_dist<-as.dist(Fun_wc_sorensen_distmat)

md_Fwc_Fun_sor_clusters<-meandist(Fun_wc_sorensen_dist, phylo2vegan_sd(Fun_wholecommunity)$Fun_sor_clusters)
## S3 method for class 'meandist'
summary(md_Fwc_Fun_sor_clusters)
## S3 method for class 'meandist'
par(mfrow = c(2, 3)) #c(nr, nc)
plot(md_Fwc_Fun_sor_clusters, kind = "dendrogram", cluster = "average", axes = TRUE, main="Cluster method=average",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7,
     col=c("F9"="#4D9221","F10"="#276419","F5"="#FDE0EF",
           "F6"="#E6F5D0","F7"="#B8E186","F8"="#7FBC41","F4"="#F1B6DA","F3"="#DE77AE","F2"="#C51B7D","F1"="#8E0152"))
plot(md_Fwc_Fun_sor_clusters, kind = "dendrogram", cluster = "single", axes = TRUE, main="Cluster method=single",
     frame.plot = T, cex=1.9,cex.main=1.5, cex.axis=1.4,
     col=c("F8"="#7FBC41","F4"="#F1B6DA","F3"="#DE77AE",
          "F1"="#8E0152","F2"="#C51B7D","F5"="#FDE0EF","F6"="#E6F5D0","F7"="#B8E186","F9"="#4D9221","F10"="#276419"))
plot(md_Fwc_Fun_sor_clusters, kind = "dendrogram", cluster = "complete", axes = TRUE, main="Cluster method=complete",
     frame.plot = T, cex=1.9,cex.main=1.5, cex.axis=1.4,
     col=c("F9"="#4D9221","F10"="#276419","F1"="#8E0152","F2"="#C51B7D",
           "F3"="#DE77AE","F4"="#F1B6DA", "F5"="#FDE0EF","F8"="#7FBC41", "F6"="#E6F5D0","F7"="#B8E186"))
plot(md_Fwc_Fun_sor_clusters, kind = "dendrogram", cluster = "median", axes = TRUE, main="Cluster method=median",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7,
     col=c("F10"="#276419","F9"="#4D9221","F5"="#FDE0EF",
           "F7"="#B8E186","F8"="#7FBC41","F6"="#E6F5D0",
           "F4"="#F1B6DA","F3"="#DE77AE","F1"="#8E0152","F2"="#C51B7D"))
plot(md_Fwc_Fun_sor_clusters, kind = "dendrogram", cluster = "centroid", axes = TRUE, main="Cluster method=centroid",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, 
     col=c("F10"="#276419","F9"="#4D9221","F5"="#FDE0EF",
           "F7"="#B8E186","F6"="#E6F5D0","F8"="#7FBC41","F4"="#F1B6DA","F3"="#DE77AE","F1"="#8E0152","F2"="#C51B7D"))

col_n10 <- c("1"="#8E0152","2"="#C51B7D","3"="#DE77AE","4"="#F1B6DA",
                 "5"="#FDE0EF","6"="#E6F5D0","7"="#B8E186","8"="#7FBC41","9"="#4D9221","10"="#276419")




# Bac
Bac_wc_sorensen_distmat[1:3,1:3]
Bac_wc_sorensen_dist<-as.dist(Bac_wc_sorensen_distmat)

md_Bwc_Fun_sor_clusters<-meandist(Bac_wc_sorensen_dist, phylo2vegan_sd(Bac_wholecommunity)$Bac_sor_clusters)
## S3 method for class 'meandist'
summary(md_Bwc_Fun_sor_clusters)
## S3 method for class 'meandist'
par(mfrow = c(2, 3)) #c(nr, nc)
plot(md_Bwc_Fun_sor_clusters, kind = "dendrogram", cluster = "average", axes = TRUE, main="Cluster method=average",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7)
plot(md_Bwc_Fun_sor_clusters, kind = "dendrogram", cluster = "single", axes = TRUE, main="Cluster method=single",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7)
plot(md_Bwc_Fun_sor_clusters, kind = "dendrogram", cluster = "complete", axes = TRUE, main="Cluster method=complete",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7)
plot(md_Bwc_Fun_sor_clusters, kind = "dendrogram", cluster = "median", axes = TRUE, main="Cluster method=median",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7)
plot(md_Bwc_Fun_sor_clusters, kind = "dendrogram", cluster = "centroid", axes = TRUE, main="Cluster method=centroid",frame.plot = T, 
     cex=1.9,cex.main=1.5, cex.axis=1.4, ylab="\n\nMean within cluster Sørensen pairwise distance", cex.lab=1.7)




#################################################


with(mrpp_Fwc_Fun_sor_clusters_n999, {
  fig.dist <- hist(boot.deltas, xlim=range(c(0.061,boot.deltas+0.01)), 
                   main="Test of Differences Among Groups")
  abline(v=delta); 
  text(delta, 2*mean(fig.dist$counts), adj = -0.25,
       expression(bold(delta)), cex=1.5 )  }
)


#### JUST FIND NON-OVERLAPPING/SHARED OTUS.....
head((phylo2vegan_OTU(Fun_wholecommunity.r)))

Fun_wholecommunity.r  = transform_sample_counts(Fun_wholecommunity, function(x) x / sum(x) )
Fun_wholecommunity.r_otu_table <- as.data.frame(t(as.data.frame(phylo2vegan_OTU(Fun_wholecommunity.r))))
head(Fun_wholecommunity.r_otu_table[,1])

unique_otus_and_abundance <- function(physeq, factor_var) {
  
  # Extract OTU table - taxa are rows
  otu_table <- as.data.frame(t(as.data.frame(phylo2vegan_OTU(physeq))))
  
  # Extract sample data
  sample_data <- as(sample_data(physeq), "data.frame")
  
  # Get unique factor levels
  factor_levels <- unique(sample_data[, factor_var])
  
  # Initialize empty vectors to store results
  num_unique_otus <- numeric(length(factor_levels))
  prop_unique_otus <- numeric(length(factor_levels))
  summed_rel_abundance <- numeric(length(factor_levels))
  avg_abundance <- numeric(length(factor_levels))
  sd_abundance <- numeric(length(factor_levels))
  
  # Iterate over factor levels
  for (i in seq_along(factor_levels)) {
    # Subset sample data for the current level
    subset_samples <- sample_data[, factor_var] == factor_levels[i]
    
    # Subset OTU table for the current level
    subset_otus <- otu_table[, subset_samples]
    
    # Identify unique OTUs for the current level and count them
    num_unique_otus[i] <- sum(rowSums(subset_otus) > 0)
    
    # Calculate average and standard deviation of relative abundance for unique OTUs
    avg_abundance[i] <- mean(rowMeans(subset_otus))
    sd_abundance[i] <-sd(rowMeans(subset_otus))
    
    # Calculate proportion of unique OTUs vs total OTU count
    prop_unique_otus[i] <- num_unique_otus[i] / ncol(subset_otus)
  }
  
  # Combine results into a data frame
  result_df <- data.frame(
    Factor_Level = factor_levels,
    Num_Unique_OTUs = num_unique_otus,
    Prop_Unique_OTUs = prop_unique_otus,
    summed_rel_abundance[i] <- sum(rowMeans(subset_otus))*100,
    Avg_Relative_Abundance = avg_abundance*100,
    SD_Relative_Abundance = sd_abundance*100
  )
  
  return(result_df)
}

# Example usage:
# unique_otus_and_abundance(my_phyloseq_object, "Treatment")

UOA_Fwc_Fun_sor_clusters <- unique_otus_and_abundance(Fun_wholecommunity.r, "Fun_sor_clusters")

unique_otus_and_abundance <- function(physeq, factor_var) {
  # Extract OTU table
  otu_table <- as.data.frame(otu_table(physeq))
  
  # Extract sample data
  sample_data <- as(sample_data(physeq), "data.frame")
  
  # Subset sample data to include only the factor of interest
  factor_data <- sample_data[, factor_var, drop = FALSE]
  
  # Identify unique OTUs for each factor level
  unique_otus <- lapply(unique(factor_data), function(level) {
    subset_otus <- otu_table[, which(factor_data == level)]
    rownames(subset_otus)[rowSums(subset_otus) > 0]
  })
  
  # Calculate average and standard deviation of relative abundance for each unique OTU
  avg_abundance <- sapply(unique_otus, function(otus) {
    subset_otus <- otu_table[rownames(otu_table) %in% otus, ]
    rowMeans(subset_otus)
  })
  
  sd_abundance <- sapply(unique_otus, function(otus) {
    subset_otus <- otu_table[rownames(otu_table) %in% otus, ]
    rowSds(subset_otus)
  })
  
  # Create a data frame to store results
  result_df <- data.frame(
    Factor_Level = names(unique_otus),
    Num_Unique_OTUs = sapply(unique_otus, length),
    Avg_Relative_Abundance = sapply(avg_abundance, mean),
    SD_Relative_Abundance = sapply(sd_abundance, mean)
  )
  
  return(result_df)
}

# Example usage:
# unique_otus_and_abundance(my_phyloseq_object, "Treatment")


### basic boxplots ----
boxplot(pH~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(soil_moisture~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(SOM~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(ammonium~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(Site~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(Grass~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(ppt3yr~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(GDD3yr~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
# boxplot(avg_SRL~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
# boxplot(avg_SLA~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(herbivory_perc~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(Grassland~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10) #tallgrass mixed grass shortgrass desert
boxplot(Latitude~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(Longitude~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(as.matrix(Fun_wholecommunity.beta.pair$beta.sor)~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
boxplot(as.matrix(Fun_wholecommunity.beta.pair$beta.sim)~Fun_sor_clusters, data = Fun_wc_clus_meta, col = col_n10)
### end ----


# randomForest
#######################################################################################
# randomForest(formula, data)
# formula is a formula describing the predictor and response variables.
# data is the name of the data set used.

library(randomForest); packageVersion("randomForest") #‘4.7.1.1’


predictors.all<-t(otu_table(Fun_wholecommunity))
dim(predictors.all)
# 484  6626

response.Fun_sor_clusters<-as.factor(sample_data(Fun_wholecommunity)$Fun_sor_clusters)

rf.data.Fun_sor_clusters<-data.frame(response.Fun_sor_clusters, predictors.all)

Fwc_classify.Fun_sor_clusters<-randomForest(response.Fun_sor_clusters~., data = rf.data.Fun_sor_clusters, ntree=999,
                                    importance=T,
                                    localImp=F #Should casewise importance measure be computed? (if TRUE will override importance.)
                                    )
print(Fwc_classify.Fun_sor_clusters)
Fun_wholecommunity_classify.Fun_sor_clusters <- Fwc_classify.Fun_sor_clusters
saveRDS(Fun_wholecommunity_classify.Fun_sor_clusters, file = "processed_data/randomForest/Fun_wholecommunity_classify.Fun_sor_clusters.rds")


getTree(Fun_wholecommunity_classify.Fun_sor_clusters, k=1, labelVar=T)
importance(Fun_wholecommunity_classify.Fun_sor_clusters, type=1, class=NULL, scale=TRUE) #2=mean decrease in node impurity/GINI

head(importance(Fun_wholecommunity_classify.Fun_sor_clusters, type=2, class=NULL, scale=TRUE))
plot(margin(Fun_wholecommunity_classify.Fun_sor_clusters))


Fwc_Fun_sor_clusters.wp.rf <- randomForest(response.Fun_sor_clusters ~ ., rf.data.Fun_sor_clusters, proximity=TRUE,
                        keep.forest=FALSE)
MDSplot(Fwc_Fun_sor_clusters.wp.rf, rf.data.Fun_sor_clusters$response.Fun_sor_clusters)
## Using different symbols for the classes:
MDSplot(Fwc_Fun_sor_clusters.wp.rf, rf.data.Fun_sor_clusters$response.Fun_sor_clusters, palette=rep(1, 3), pch=as.numeric(rf.data.Fun_sor_clusters$response.Fun_sor_clusters))

plot(randomForest(response.Fun_sor_clusters ~ ., rf.data.Fun_sor_clusters, keep.forest=FALSE, ntree=100), log="y")

## Do MDS on 1 - proximity:
Fwc_Fun_sor_clusters.wp.mds <- cmdscale(1 - Fwc_Fun_sor_clusters.wp.rf$proximity, eig=TRUE)
op <- par(pty="s")
pairs(cbind(rf.data.Fun_sor_clusters[,2:10], Fwc_Fun_sor_clusters.wp.mds$points), cex=0.6, gap=0,
      col=c("red", "green", "blue")[as.numeric(rf.data.Fun_sor_clusters$response.Fun_sor_clusters)],
      main="Predictors and MDS of Proximity Based on RandomForest")
par(op)
print(Fwc_Fun_sor_clusters.wp.mds$GOF)


## Regression:
## data(airquality)
set.seed(131)
ozone.rf <- randomForest(Ozone ~ ., data=airquality, mtry=3,
                         importance=TRUE, na.action=na.omit)
print(ozone.rf)
## Show "importance" of variables: higher value mean more important:
round(importance(ozone.rf), 2)
## "x" can be a matrix instead of a data frame:
set.seed(17)
x <- matrix(runif(5e2), 100)
y <- gl(2, 50)
(myrf <- randomForest(x, y))
(predict(myrf, x))
## "complicated" formula:
(swiss.rf <- randomForest(sqrt(Fertility) ~ . - Catholic + I(Catholic < 50),
                          data=swiss))
(predict(swiss.rf, swiss))

### varImpPlot Variable Importance Plot
# p 27 https://cran.r-project.org/web/packages/randomForest/randomForest.pdf

varImpPlot(Fun_wholecommunity_classify.Fun_sor_clusters, sort=TRUE, 
           n.var=min(40, nrow(Fun_wholecommunity_classify.Fun_sor_clusters$importance)),
           type=NULL, class="2", scale=TRUE,
           main=deparse(substitute(Fun_wholecommunity_classify.Fun_sor_clusters)))

# head(importance(Fun_wholecommunity_classify.Fun_sor_clusters, type=2, class=NULL, scale=TRUE))

Fwc_gini<-as.data.frame(importance(Fun_wholecommunity_classify.Fun_sor_clusters, type=NULL, class="1", scale=TRUE))
Fwc_gini<-as.data.frame(cbind("OTU"=row.names(Fwc_gini),"MeanDecreaseGini"=Fwc_gini[,1]))
Fwc_gini$MeanDecreaseGini <- as.numeric(Fwc_gini$MeanDecreaseGini)
Fwc_gini.sort<-Fwc_gini[order(Fwc_gini$MeanDecreaseGini, decreasing = TRUE), ]

### rfcv Random Forest Cross-Valdidation for feature selection
  # p 22 https://cran.r-project.org/web/packages/randomForest/randomForest.pdf

subset_comm<-Fun_wholecommunity_wk1
subset_comm<-Fun_wholecommunity_wk2
subset_comm<-Fun_wholecommunity_wk3
subset_comm<-Fun_wholecommunity_wk4
subset_comm<-Fun_wholecommunity_wk5
subset_comm<-Fun_wholecommunity_wk6
subset_comm<-Fun_wholecommunity_wk7
subset_comm<-Fun_wholecommunity_wk8
subset_comm<-Fun_wholecommunity_wk9
subset_comm<-Fun_wholecommunity_wk10
subset_comm<-Fun_wholecommunity_wk11
subset_comm<-Fun_wholecommunity_wk12


predictors.subset<-t(otu_table(subset_comm))
response.subset<-as.factor(sample_data(subset_comm)$Fun_sor_clusters)
rf.data.subset<-data.frame(response.subset, predictors.subset)
classify.Fun_sor_clusters.subset<-randomForest(response.subset~., data = rf.data.subset, ntree=999)
print(classify.Fun_sor_clusters.subset)

predictors.all<-t(otu_table(Fun_wholecommunity))
response.week<-as.factor(sample_data(Fun_wholecommunity)$Week)
rf.data.week<-data.frame(response.week, predictors.all)
classify.week<-randomForest(response.week~., data = rf.data.week, ntree=999)
print(classify.week)


subset_comm<-Fun_wholecommunity_control.Fun_sor_clusters
subset_comm<-Fun_wholecommunity_Fun_wholecommunity.Fun_sor_clusters
subset_comm<-Fun_wholecommunity_Fun_wholecommunityLA.Fun_sor_clusters
subset_comm<-Fun_wholecommunity_VC_Fun_wholecommunity.Fun_sor_clusters
subset_comm<-Fun_wholecommunity_VC_Fun_wholecommunity.Fun_sor_clusters

predictors.subset<-t(otu_table(subset_comm))
response.subset<-as.factor(sample_data(subset_comm)$Week)
rf.data.subset<-data.frame(response.subset, predictors.subset)
classify.week.subset<-randomForest(response.subset~., data = rf.data.subset, ntree=999)
print(classify.week.subset)
#######################################################################################


# Ordinations -----------------------------------------------------------

# col Site facet Fun_sor_clusters

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.SOR.k2.ord, color = "Site") +
  geom_text(mapping = aes(label = Site), size = 3, vjust = 1.25) +
  scale_color_manual(values = latlong_cols, name = "Site",guide = guide_legend(ncol = 1))+
  geom_point(size = 1.5, alpha = 0.8) +
  facet_wrap(.~Fun_sor_clusters, scales = "free") +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3, Sørensen diss clusters based on pam (k = 10)") +
  theme_bw() +
  theme(legend.position="right",
        axis.text.x = element_text(color="black", size=12),
        axis.text.y = element_text(color="black", size=12),
        axis.title.x = element_text(color="black", size=14),
        axis.title.y = element_text(color="black", size=14),
        plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())



# col Fun_sor_clusters facet Site 

col_n10 <- c("#8E0152","#C51B7D","#DE77AE","#F1B6DA","#FDE0EF","#E6F5D0","#B8E186","#7FBC41","#4D9221","#276419")

plot_ordination(Fun_wholecommunity, Fun_wholecommunity.SOR.k2.ord, color = "Fun_sor_clusters") +
  geom_text(mapping = aes(label = Site), size = 3, vjust = 1.25) +
  scale_color_manual(values = col_n10, name = "Sørensen clusters",guide = guide_legend(ncol = 2))+
  geom_point(size = 1.5, alpha = 0.8) +
  labs(y="") +
  ggtitle("", subtitle = "ITS - k=3, Sørensen diss clusters based on pam (k = 10)") +
  theme_bw() +
  theme(legend.position="right",
        axis.text.x = element_text(color="black", size=12),
        axis.text.y = element_text(color="black", size=12),
        axis.title.x = element_text(color="black", size=14),
        axis.title.y = element_text(color="black", size=14),
        plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
#  -----------------------------------------------------------
