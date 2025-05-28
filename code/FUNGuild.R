# FUNGuild 1.1

# source: https://readingradio.github.io/J.nigra.Rmds/barkfunguild_jnigra17__fa19_ajo.html


library("MiscMetabar"); packageVersion("MiscMetabar") # ‘0.14.2’
source("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/code/RAM_bulk_harvester.R")
Bac_wholecommunity<-readRDS(file = "../processed_data/clean_rds_saves/Bac_wholecommunity.rds")
Fun_wholecommunity <- readRDS(file="../processed_data/clean_rds_saves/Fun_wholecommunity.rds")
source("/Users/L347123/Desktop/black-sheep-club/code/sheepish_scripts.R")

Bac_pa <- phylo2_binary(Bac_wholecommunity)
Fun_pa <- phylo2_binary(Fun_wholecommunity)

# graph_test_pq ----
funnet_jac_knn1<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "jaccard",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 1,
  title = "Graph Test - knn; k = 1; dist = jacc",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 304 pure edges of 394 total edges in the graph\nPermutation p-value: 0.001")
funnet_sim_knn1<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "sim",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 1,
  title = "Graph Test - knn; k = 1; dist = sim",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 386 pure edges of 428 total edges in the graph\nPermutation p-value: 0.001")


funnet_jac_knn2<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "jaccard",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 2,
  title = "Graph Test - knn; k = 2; dist = jacc",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 584 pure edges of 775 total edges in the graph\nPermutation p-value: 0.001")

funnet_sim_knn2<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "sim",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 2,
  title = "Graph Test - knn; k = 2; dist = sim",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 704 pure edges of 800 total edges in the graph\nPermutation p-value: 0.001")


funnet_jac_knn3<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "jaccard",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 3,
  title = "Graph Test - knn; k = 3; dist = jacc",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 845 pure edges of 1153 total edges in the graph\nPermutation p-value: 0.001")

funnet_sim_knn3<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "sim",
  nperm = 999,
  return_plot = TRUE,
  type = c("knn"),
  knn = 3,
  title = "Graph Test - knn; k = 3; dist = sim",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 1009 pure edges of 1176 total edges in the graph\nPermutation p-value: 0.001")


funnetperm_sim_knn2<-graph_perm_test(Fun_wholecommunity,
                     sampletype = "Fun_sor_clusters",
                     distance = "sim",
                     type = "knn",
                     nperm = 999,
                     knn = 2)
plot_permutations(funnetperm_sim_knn2)
plot_test_network(funnetperm_sim_knn2) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                                                         "F5","F6","F7","F8",
                                                                                         "F9","F10"),
                                                            name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 704 pure edges of 800 total edges in the graph\nPermutation p-value: 0.001")


# Nearest neighbors
# The k-nearest neighbors graph is obtained by putting an edge between two samples whenever one of them is in the set
# of k-nearest neighbors of the other. We see from Figure 24 that if a pair of samples has an edge between them in the
# nearest neighbor graph, they are overwhelmingly likely to be in the same litter.

plot_grid(funnet_jac_knn1,funnet_jac_knn2,funnet_jac_knn3,
          funnet_sim_knn1,funnet_sim_knn2,funnet_sim_knn3,ncol=3)



#mst
graph_perm_test(Fun_wholecommunity,
                sampletype = "Fun_sor_clusters",
                distance = "sim",
                type = "mst",
                nperm = 999)
funnet_sim_mst<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "sim",
  nperm = 999,
  return_plot = TRUE,
  type = c("mst"),
  title = "Graph Test - mst; dist = sim",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 427 pure edges of 483 total edges in the graph\nPermutation p-value: 0.001")

Fun_jacc_dist <- distance(Fun_wholecommunity, method = "jaccard", binary = TRUE)

graph_perm_test(Fun_wholecommunity,
                sampletype = "Fun_sor_clusters",
                distance = "jaccard",
                type = "mst",
                grouping = "Grass",
                nperm = 999)
funnet_jacc_mst<-graph_test_pq(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  merge_sample_by = NULL,
  distance = "jaccard",
  nperm = 999,
  return_plot = TRUE,
  type = c("mst"),
  title = "Graph Test - mst; dist = jacc",
  na_remove = FALSE,
) + scale_color_manual(values = col_n10, breaks = c("F1","F2","F3","F4",
                                                    "F5","F6","F7","F8",
                                                    "F9","F10"),
                       name = "Fungal\nSubassemblage") + 
  labs(subtitle = "Observed test statistic: 369 pure edges of 483 total edges in the graph\nPermutation p-value: 0.001")


library(phyloseqGraphTest)
graph_perm_test(
  Fun_wholecommunity,
  "Fun_sor_clusters",
  grouping = 1:nsamples(physeq),
  distance = "jaccard",
  type = c("mst"),
  # type = c("mst", "knn", "threshold.value", "threshold.nedges"), # If "mst", forms the minimum spanning tree of the sample points. If "knn", forms a directed graph with links from each node to its k nearest neighbors. If "threshold", forms a graph with edges between every pair of samples within a certain distance.
  max.dist = 0.4,
  knn = 1,
  nedges = nsamples(physeq),
  keep.isolates = TRUE,
  nperm = 99
)


# Partition the Variation of a phyloseq object by 2, 3, or 4 Explanatory Matrices ----
## https://cran.r-universe.dev/MiscMetabar/doc/manual.html#var_par_pq
if (requireNamespace("vegan")) {
data_fungi_woNA <-
  subset_samples(Fun_wholecommunity, !is.na(Fun_sor_clusters) & !is.na(Site)
                 )
res_var <- var_par_pq(data_fungi_woNA,
                      list_component = list(
                        "Fun_sor_clusters" = c("Fun_sor_clusters",
                                               "nsamples_perFun_sor_clusters","ngrass_perFun_sor_clusters"),
                        "Site"=c("Site","ngrass_persite"),
                        "Edaphic" = c("perc_moisture_m.std", "pH_m.std","SOM_m.std",
                                      "nitrate_m.std","phos_m.std"),
                        # "Meta" = c("ngrass_perFun_sor_clusters"),
                        "Bacteria" = c("Bac_sor_clusters","Bac_gamma_Site")
                      ),dist_method = "jaccard",
                      dbrda_computation = TRUE
)
}

plot_var_part_pq(
  res_var,cutoff = 0, digits = 1, digits_quantile = 2,
  fill_bg = c("seagreen3", "mediumpurple", "blue", "orange"),show_quantiles = FALSE,
  filter_quantile_zero = TRUE,show_dbrda_signif = FALSE,show_dbrda_signif_pval = 0.05,
  alpha = 63,id.size = 1.2, min_prop_pval_signif_dbrda = 0.95
)

F1_phylo<-subset_samples(Fun_wholecommunity,Fun_sor_clus2=="F1")
F1_phylo <- prune_taxa(taxa_sums(F1_phylo) > 0, F1_phylo)
nonF1_phylo<-subset_samples(Fun_wholecommunity,Fun_sor_clus2=="non-F1")
nonF1_phylo <- prune_taxa(taxa_sums(nonF1_phylo) > 0, nonF1_phylo)

F1_phylo_pa<-subset_samples(Fun_pa,Fun_sor_clus2=="F1")
F1_phylo_pa <- prune_taxa(taxa_sums(F1_phylo_pa) > 0, F1_phylo_pa)
nonF1_phylo_pa<-subset_samples(Fun_pa,Fun_sor_clus2=="non-F1")
nonF1_phylo_pa <- prune_taxa(taxa_sums(nonF1_phylo_pa) > 0, nonF1_phylo_pa)

res_varF1 <- var_par_pq(F1_phylo_pa,
                      list_component = list(
                        # "Fun_sor_clusters" = c("Fun_sor_clusters",
                        #                        "nsamples_perFun_sor_clusters","ngrass_perFun_sor_clusters"),
                        # "Site"=c("Site","ngrass_persite","nsamples_per_Site"),
                        "Edaphic" = c("soil_moisture_m.std","perc_moisture_m.std", 
                                      "pH_m.std","SOM_m.std",
                                      "nitrate_m.std","ammonium_m.std","phos_m.std"),
                        "Plant Host" = c("herbivory_perc_m.std","avg_SLA_m.std","avg_SRL_m.std",
                                         "Grass","Grassland"),
                        "Climate" = c("coll_GDD_m.std","GDD30yr_m.std","GDD3yr_m.std","GDD2015_m.std",
                                      "ppt30yr_m.std","ppt3yr_m.std","ppt2015_m.std"),
                        # "Meta" = c("ngrass_perFun_sor_clusters"),
                        "Bacteria" = c("Bac_Observed","Bac_InvSimpson","Bac_sor_clusters","Bac_gamma_Site")
                      ),dist_method = "bray",
                      dbrda_computation = TRUE)
plot_var_part_pq(
  res_varF1,cutoff = 0, digits = 1, digits_quantile = 3,
  fill_bg = c("seagreen3", "mediumpurple", "blue", "orange"),show_quantiles = FALSE,
  filter_quantile_zero = TRUE,show_dbrda_signif = T,show_dbrda_signif_pval = 0.05,
  alpha = 63,id.size = 1.2, min_prop_pval_signif_dbrda = 0.5
) + title(main = "F1")



res_varnonF1 <- var_par_pq(nonF1_phylo_pa,
                        list_component = list(
                          # "Fun_sor_clusters" = c("Fun_sor_clusters",
                          #                        "nsamples_perFun_sor_clusters","ngrass_perFun_sor_clusters"),
                          # "Site"=c("Site","ngrass_persite","nsamples_per_Site"),
                          "Edaphic" = c("soil_moisture_m.std","perc_moisture_m.std", 
                                        "pH_m.std","SOM_m.std",
                                        "nitrate_m.std","ammonium_m.std","phos_m.std"),
                          "Plant Host" = c("herbivory_perc_m.std","avg_SLA_m.std","avg_SRL_m.std",
                                           "Grass","Grassland"),
                          "Climate" = c("coll_GDD_m.std",
                                        "GDD30yr_m.std","GDD3yr_m.std","GDD2015_m.std",
                                        "ppt30yr_m.std","ppt3yr_m.std","ppt2015_m.std"),
                          # "Meta" = c("ngrass_perFun_sor_clusters"),
                          "Bacteria" = c("Bac_Observed","Bac_InvSimpson","Bac_sor_clusters","Bac_gamma_Site")
                        ),dist_method = "jaccard",
                        dbrda_computation = TRUE)


plot_var_part_pq_F1<- plot_var_part_pq(
  res_varF1,cutoff = 0, digits = 1, digits_quantile = 3,
  fill_bg = c("seagreen3", "mediumpurple", "blue", "orange"),show_quantiles = FALSE,
  filter_quantile_zero = TRUE,show_dbrda_signif = T,show_dbrda_signif_pval = 0.05,
  alpha = 63,id.size = 1.2, min_prop_pval_signif_dbrda = 0.5
) 

  plot_var_part_pq_nonF1<-plot_var_part_pq(
  res_varnonF1,cutoff = 0, digits = 1, digits_quantile = 2,
  fill_bg = c("seagreen3", "mediumpurple", "blue", "orange"),show_quantiles = FALSE,
  filter_quantile_zero = TRUE,show_dbrda_signif = FALSE,show_dbrda_signif_pval = 0.05,
  alpha = 63,id.size = 1.2, min_prop_pval_signif_dbrda = 0.95
)+ title(main = "non-F1")

plot_var_part_pq_F1<-plot_var_part_pq_F1+ title(main = "F1")
plot_grid(plot_var_part_pq_F1,plot_var_part_pq_nonF1)

# library(ComplexUpset)
# upset_pq(
#   Fun_wholecommunity,
#   fact="Fun_sor_clusters",
#   taxa_fill = "Phylum",
#   min_nb_seq = 10,
#   na_remove = TRUE,
#   numeric_fonction = sum,
#   rarefy_after_merging = FALSE,
#   min_degree=3
# )

if (requireNamespace("DT")) {
  tax_datatable(subset_taxa(
    Fun_wholecommunity,
    rowSums(Fun_wholecommunity@otu_table) > 100
  ))
  
  # Using modality
  tax_datatable(Fun_wholecommunity,
                modality = Fun_wholecommunity@sam_data$Fun_sor_clusters
  )
}

comm <- Fun_wholecommunity
# colnames(tax_table(comm))

# write.csv(phylo2vegan_tax(comm), file = "Fun_ksu_tax.csv", row.names = F)

# fungi <- get_funguild_database()


t.funguild.ds<-read.delim(file = "/Users/L347123/Desktop/ksu-paired-amplicon-workflow/processed_data/FUNGuild1.1/Fun_ksu_otu_tax.guilds_reformat.txt")

# Funguild Table Reformatting ----

# Prior to creating relative abundance plots, 
# the functional guild output needs to be reformatted. 
# First, compound guild strings need to be broken 
# down into individual guilds and 
# OTUs need to be weighted based on the number 
# of guilds to which they were assigned. 
# Then, OTUs are summed by guild and state.

# When importing the funguild table, some columns containing citation 
# information may get incorrectly wrapped so that they have their own rows. 
# These are first removed with na.omit. 
t.funguild.ds<-na.omit(t.funguild.ds)

head(colnames(t.funguild.ds))
colnames(t.funguild.ds)[1] # OTU_ID
colnames(t.funguild.ds)[487] # Taxon
colnames(t.funguild.ds)[488] # Taxon.Level
colnames(t.funguild.ds)[489] # Trophic.Mode
colnames(t.funguild.ds)[490] # Guild
colnames(t.funguild.ds)[491] # Growth.Morphology
colnames(t.funguild.ds)[492] # Trait
colnames(t.funguild.ds)[493] # Confidence.Ranking
colnames(t.funguild.ds)[494] # Notes
colnames(t.funguild.ds)[495] # Citation.Source

#Here I am subsetting the data to pull out the the functional guild 
  # information from the funguild output. 
#I then create a data frame that includes just the functional guild information and the abundance by site data.
#This table is currently a transposed OTU table. 
t.ds.otu.id<-t.funguild.ds[,1]
t.guild.ds<-t.funguild.ds[,490] # Guild
t.otutab.ds<-(t.funguild.ds[,2:485]) # OTUs
t.otutab.guild.ds<-data.frame(otu=t.ds.otu.id,
                              Guilds=t.guild.ds,
                              t.otutab.ds)
# head(t.otutab.guild.ds)

# reformat guilds
clean_guild_labels <- function(guild_vec) {
  guild_vec_clean <- guild_vec %>%
    # Remove any leading/trailing pipes or dashes
    str_replace_all("^\\|+", "") %>%
    str_replace_all("\\|+$", "") %>%
    str_replace_all("\\|", "-") %>%
    str_replace_all("-+", "-") %>%
    str_replace_all("^-|-$", "") %>%
    # Split on '-' to get individual guild elements
    str_split("-") %>%
    # Remove empty strings, trim whitespace, get unique terms, sort, recombine
    lapply(function(x) {
      x <- str_trim(x)
      x <- x[x != "" & !is.na(x)]
      x <- unique(x)
      x <- sort(x)
      paste(x, collapse = " + ")
    }) %>%
    unlist()
  
  return(guild_vec_clean)
}

t.guild.ds.cleaned <- clean_guild_labels(t.guild.ds)

# See cleaned unique values
unique(t.guild.ds.cleaned)

#Next I use the stringr package to quantify the number of "-" in the guild names. To weight each value, I divide the total count by the number of dashes plus 1. I add 1 because a name with only 1 dash will have two functional guilds. 
library(stringr)
t.otutab.guild.div.ds<-data.frame(Guilds=t.guild.ds,
                                  (t.otutab.guild.ds[,3:485]/(str_count(t.otutab.guild.ds$Guilds,pattern="-")+1)))

#Then using separate_rows, I split the functional guild names by dash and create duplicate columns. 
library(tidyr)
t.otutab.guild.div.sep.ds<-separate_rows(t.otutab.guild.div.ds, Guilds, sep="-")

#Then using plyr I take the sum of the data by functional guild and then by site. 
library(plyr)
t.otutab.guild.div.sep.sum.ds<-as.data.frame(ddply(t.otutab.guild.div.sep.ds, .(Guilds),colwise(sum)))

#I then make the row name the functional guild and change the names so that the period between two parts of a name becomes a space. 
rownames(t.otutab.guild.div.sep.sum.ds)<-make.names(t.otutab.guild.div.sep.sum.ds$Guilds)


#I then remove the column that contains guild names since this is a duplicate of the row names. 
otutab.guild.div.sep.sum.ds<-t(t.otutab.guild.div.sep.sum.ds[,2:47])

site<-c("IN","IN","IN","IN","IN","IN","IN","IN","IN","IN","IN","IN","IN","IN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","TN","WA","WA","WA","WA","WA","WA","WA","WA","WA","WA","WA","WA","WA","WA")

#Then I create a data frame that contains the state information alongside the functional guild assignments and the sum functional guilds by state.  
otutab.guild.div.sep.sum.state.ds<-data.frame(state=site,otutab.guild.div.sep.sum.ds)
otutab.guild.div.sep.sum.statesum.ds<-(ddply(otutab.guild.div.sep.sum.state.ds, .(state),colwise(sum)))

#Then I rename the unassigned column, currently delimited with "X" to Unassigned and substitute . for spaces in the funguild names. 
colnames(otutab.guild.div.sep.sum.statesum.ds)[2]<-make.names("Unassigned")

colnames(otutab.guild.div.sep.sum.statesum.ds)<-sub("\\."," ",colnames(otutab.guild.div.sep.sum.statesum.ds))

# attempt 2 ----
library(data.table)
library(dplyr)
library(tidyr)
library(stringr)
library(phyloseq)

# ---- 0. Load Data ----
funguild_df <- data.table::fread("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/processed_data/FUNGuild1.1/Fun_ksu_otu_tax.guilds_reformat.txt", sep = "\t")

# --- Extract Columns ---
otu_ids <- funguild_df$OTU_ID
otu_abund <- funguild_df[, 2:485]  # SRR columns
guilds_raw <- funguild_df$Guild
abund_cols <- colnames(otu_abund)

# --- Build Long-format OTU Table w/ Guild ---
# Start cleanly to preserve structure (no recycling!)
guild_otu_df <- dplyr::tibble(
  OTU_ID = otu_ids,
  Guild = as.character(guilds_raw)
) %>%
  dplyr::bind_cols(otu_abund)

# --- Clean and Separate Guild Strings ---
guild_split_df <- guild_otu_df %>%
  dplyr::mutate(
    Guild = stringr::str_replace_all(Guild, "\\|", ""),
    Guild = stringr::str_replace_all(Guild, "-+", "-"),
    Guild = stringr::str_trim(Guild)
  ) %>%
  dplyr::filter(!is.na(Guild), Guild != "") %>%
  tidyr::separate_rows(Guild, sep = "-") %>%
  dplyr::add_count(OTU_ID, name = "n_guilds")  # count how many guilds per OTU

# --- Apply Weighting Before Melting ---
# Divide each abundance column by number of guilds
guild_split_df[abund_cols] <- guild_split_df[abund_cols] / guild_split_df$n_guilds

# --- Pivot to Long Format ---
guild_melted <- guild_split_df %>%
  tidyr::pivot_longer(
    cols = dplyr::all_of(abund_cols),
    names_to = "Sample",
    values_to = "Count"
  )

# --- Summarize by Guild and Sample ---
guild_long <- guild_melted %>%
  dplyr::group_by(Guild, Sample) %>%
  dplyr::summarise(Abundance = sum(Count, na.rm = TRUE), .groups = "drop")

# --- Optional Check: Total Abundance Should Match Original ---
original_total <- funguild_df[, 2:485] %>% unlist() %>% sum(na.rm = TRUE)
guild_total <- sum(guild_long$Abundance)

cat("Original abundance total: ", original_total, "\n")
cat("Guild-weighted total: ", guild_total, "\n")

# --- Create Guild_Clean Per OTU ---
guild_collapsed <- guild_split_df %>%
  dplyr::select(OTU_ID, Guild) %>%
  dplyr::distinct() %>%
  dplyr::group_by(OTU_ID) %>%
  dplyr::summarise(Guild_Clean = paste(sort(unique(Guild)), collapse = " | "), .groups = "drop")

# --- Extract Other Functional Info ---
functional_info <- funguild_df[, c("OTU_ID", "taxonomy", "Taxon", "Taxon Level", "Trophic Mode",
                                   "Growth Morphology", "Trait", "Confidence Ranking")]
functional_info <- as.data.frame(functional_info)

# --- Merge Guild_Clean into Metadata ---
otu_meta <- dplyr::left_join(functional_info, guild_collapsed, by = "OTU_ID")
rownames(otu_meta) <- otu_meta$OTU_ID
otu_meta$OTU_ID <- NULL

# --- Insert Into phyloseq ---
phyloseq::tax_table(comm) <- phyloseq::tax_table(as.matrix(otu_meta))


# Extract your sample_data as a dataframe
sample_meta <- phylo2vegan_sd(Fun_wholecommunity) %>%
  as.data.frame() %>%
  dplyr::mutate(Sample = rownames(.))

# Join metadata to guild_long
guild_long_with_meta <- dplyr::left_join(guild_long, sample_meta, by = "Sample")

# Fix any missing Guild values BEFORE collapsing
guild_long_fixed <- guild_long_with_meta %>%
  dplyr::mutate(
    Guild = dplyr::case_when(
      is.na(Guild) | Guild == "" ~ "Unassigned",
      TRUE ~ Guild
    )
  )

# Identify top guilds (excluding Unassigned)
top_guilds <- guild_long_fixed %>%
  dplyr::filter(Guild != "Unassigned") %>%
  dplyr::group_by(Guild) %>%
  dplyr::summarise(Total = sum(Abundance), .groups = "drop") %>%
  dplyr::arrange(desc(Total)) %>%
  dplyr::slice(1:10) %>%
  dplyr::pull(Guild)

# Collapse rare guilds into "Other", keep Unassigned
guild_long_collapsed <- guild_long_fixed %>%
  dplyr::mutate(
    Guild_Collapsed = dplyr::case_when(
      Guild == "Unassigned" ~ "Unassigned",
      Guild %in% top_guilds ~ Guild,
      TRUE ~ "Other"
    )
  ) %>%
  dplyr::group_by(Sample, Guild_Collapsed, Fun_sor_clusters) %>%
  dplyr::summarise(Abundance = sum(Abundance), .groups = "drop")

dplyr::count(guild_long_collapsed, Guild_Collapsed)
# Should return counts for: Unassigned, Other, and ~10 top guilds

# Desired legend/stacking order: Unassigned on top, Other on bottom
guild_levels_ordered <- c("Other", sort(setdiff(unique(guild_long_collapsed$Guild_Collapsed), c("Unassigned", "Other"))), "Unassigned")

guild_long_collapsed <- guild_long_collapsed %>%
  dplyr::mutate(Guild_Collapsed = factor(Guild_Collapsed, levels = guild_levels_ordered))

# Assign colors manually: Unassigned = grey70, Other = grey30
n_guilds <- length(guild_levels_ordered)
middle_guilds <- setdiff(guild_levels_ordered, c("Unassigned", "Other"))

d3_colors_all <- ggsci::pal_d3("category20")(20)
d3_colors_safe <- d3_colors_all[-c(8)]  # remove known greys
middle_colors <- setNames(d3_colors_safe[seq_along(middle_guilds)], middle_guilds)

guild_colors <- c(
  "Unassigned" = "grey70",
  middle_colors,
  "Other" = "grey30"
)

# Plot Guild Composition ----

## Plot Guilds — Facet by Fun_sor_clusters ----
guild_plot<-ggplot(guild_long_collapsed, aes(x = Sample, y = Abundance, fill = Guild_Collapsed)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_wrap(~ Fun_sor_clusters, scales = "free_x") +
  scale_fill_manual(values = guild_colors, drop = FALSE) +
  labs(
    title = "Fungal Subassemblage",
    x = "Sample",
    y = "Relative Abundance",
    fill = "Guild"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    strip.text = element_text(face = "bold"),
    legend.position = "right"
  ) +
  guides(fill = guide_legend(reverse = TRUE))


## Trophic_Mode ----
# Extract Trophic_Mode from phyloseq tax_table
trophic_df <- as.data.frame(tax_table(comm)) %>%
  dplyr::select(Trophic_Mode = "Trophic Mode") %>%
  tibble::rownames_to_column("OTU_ID")

# Join with melted abundance data
trophic_long <- dplyr::left_join(guild_melted, trophic_df, by = "OTU_ID")

# Join sample metadata (for Fun_sor_clusters)
trophic_long <- dplyr::left_join(trophic_long, sample_meta, by = "Sample")

# Handle missing modes
trophic_long <- trophic_long %>%
  dplyr::mutate(
    Trophic_Mode = dplyr::case_when(
      is.na(Trophic_Mode) | Trophic_Mode == "" ~ "Unassigned",
      TRUE ~ Trophic_Mode
    )
  )

# Summarize Relative Abundance by Trophic Mode
trophic_collapsed <- trophic_long %>%
  dplyr::group_by(Sample, Fun_sor_clusters, Trophic_Mode) %>%
  dplyr::summarise(Abundance = sum(Count, na.rm = TRUE), .groups = "drop")

# Assign Colors (Unassigned = grey)
# Set order with Unassigned on top
mode_levels <- c(#"Unassigned", 
                 setdiff(unique(trophic_collapsed$Trophic_Mode), 
                         "Unassigned"),
                 "Unassigned"
                 )
trophic_collapsed$Trophic_Mode <- factor(trophic_collapsed$Trophic_Mode, levels = mode_levels)

# Assign colors (grey for Unassigned, rest with D3 or Set2)
library(ggsci)

non_unassigned <- setdiff(mode_levels, "Unassigned")
mode_colors <- c(
  setNames(ggsci::pal_d3("category20b")(length(non_unassigned)), non_unassigned),
  "Unassigned" = "grey70"
)


# groups colors
# Just convert to character safely without rewriting everything
trophic_collapsed <- trophic_collapsed %>%
  dplyr::mutate(Trophic_Mode = as.character(Trophic_Mode))

trophic_modes <- sort(setdiff(unique(as.character(trophic_collapsed$Trophic_Mode)), "Unassigned"))
trophic_modes <- c(trophic_modes, "Unassigned")  # put it last

trophic_colors <- setNames(
  vapply(trophic_modes, function(mode) {
    if (mode == "Unassigned") {
      "grey70"
    } else if (grepl("Pathotroph", mode) & grepl("Saprotroph", mode) & grepl("Symbiotroph", mode)) {
      "#4B0000"  # dark brown
    } else if (grepl("Pathotroph", mode) & grepl("Saprotroph", mode)) {
      "#8B0000"  # dark red
    } else if (grepl("Pathotroph", mode) & grepl("Symbiotroph", mode)) {
      "#B22222"  # firebrick
    } else if (grepl("Saprotroph", mode) & grepl("Symbiotroph", mode)) {
      "#4682B4"  # steel blue
    } else if (grepl("Pathotroph", mode)) {
      "#DC143C"  # crimson
    } else if (grepl("Saprotroph", mode)) {
      "#1E90FF"  # dodger blue
    } else if (grepl("Symbiotroph", mode)) {
      "#228B22"  # forest green
    } else {
      "grey30"
    }
  }, character(1)),
  trophic_modes
)

trophic_colors2 <- c(
  "Pathotroph"                             = "#e41a1c",  # red
  "Pathotroph-Saprotroph"                 = "#ff7f00",  # orange
  "Pathotroph-Symbiotroph"               = "#fb6a4a",  # salmon
  "Pathotroph-Saprotroph-Symbiotroph"    = "#6a3d9a",  # purple
  "Saprotroph"                           = "#377eb8",  # blue
  "Saprotroph-Symbiotroph"               = "#4daf4a",  # green-blue
  "Saprotroph-Saprotroph-Symbiotroph"    = "#a6cee3",  # light blue
  "Symbiotroph"                          = "#33a02c",  # green
  "Unassigned"                           = "grey70"
)

library(colorspace)

# Clean levels, ordered for interpretation
trophic_order <- c(
  "Pathotroph",
  "Pathotroph-Pathotroph-Saprotroph",       
  "Pathotroph-Saprotroph",
  "Pathotroph-Symbiotroph",
  "Pathotroph-Saprotroph-Symbiotroph",
  "Saprotroph",
  "Saprotroph-Symbiotroph",
  "Saprotroph-Saprotroph-Symbiotroph",
  "Symbiotroph",
  "Unassigned"
)


trophic_colors3 <- c(
  "Pathotroph"                             = "#B2182B",
  "Pathotroph-Pathotroph-Saprotroph"       = "#D6604D",
  "Pathotroph-Saprotroph"                  = "#F4A582",
  "Pathotroph-Symbiotroph"                 = "#D95F02",
  "Pathotroph-Saprotroph-Symbiotroph"      = "#762A83",  # distinct purple for triple
  
  "Saprotroph"                             = "#2166AC",
  "Saprotroph-Symbiotroph"                 = "#4393C3",
  "Saprotroph-Saprotroph-Symbiotroph"      = "#92C5DE",
  
  "Symbiotroph"                            = "#4D9221",
  
  "Unassigned"                             = "#D9D9D9"
)
trophic_plot<-ggplot(trophic_collapsed, aes(x = Sample, y = Abundance, fill = Trophic_Mode)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_wrap(~ Fun_sor_clusters, scales = "free_x") +
  scale_fill_manual(values = trophic_colors3, drop = FALSE) +
  theme_minimal(base_size = 12) +
  labs(
    title = "Trophic Mode Composition by Fungal Subassemblage",
    x = "Sample",
    y = "Relative Abundance",
    fill = "Trophic Mode"
  ) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    strip.text = element_text(face = "bold"),
    legend.position = "right"
  )


## Growth Morphology ----
# Extract annotations from phyloseq tax_table
morph_trait_info <- as.data.frame(tax_table(comm)) %>%
  tibble::rownames_to_column("OTU_ID") %>%
  dplyr::select(OTU_ID, `Growth Morphology`, Trait)

# Join with abundance + sample metadata
guild_melted_meta <- guild_melted %>%
  dplyr::left_join(morph_trait_info, by = "OTU_ID") %>%
  dplyr::left_join(sample_meta, by = "Sample")

# Clean and Collapse “Growth Morphology”
growth_morphology_collapsed <- guild_melted_meta %>%
  dplyr::mutate(`Growth Morphology` = dplyr::case_when(
    is.na(`Growth Morphology`) | `Growth Morphology` == "" ~ "Unassigned",
    TRUE ~ `Growth Morphology`
  )) %>%
  dplyr::group_by(Sample, Fun_sor_clusters, `Growth Morphology`) %>%
  dplyr::summarise(Abundance = sum(Count), .groups = "drop")


# Growth Morphology Colors 
top_morphs <- growth_morphology_collapsed %>%
  dplyr::filter(`Growth Morphology` != "Unassigned") %>%
  dplyr::group_by(`Growth Morphology`) %>%
  dplyr::summarise(Total = sum(Abundance)) %>%
  dplyr::arrange(desc(Total)) %>%
  dplyr::slice_head(n = 20) %>%
  dplyr::pull(`Growth Morphology`)

growth_morphology_collapsed_clean <- growth_morphology_collapsed %>%
  dplyr::mutate(`Growth Morphology` = dplyr::case_when(
    `Growth Morphology` %in% top_morphs ~ `Growth Morphology`,
    `Growth Morphology` == "Unassigned" ~ "Unassigned",
    TRUE ~ "Other"
  ))

morph_group_map <- function(morph) {
  dplyr::case_when(
    grepl("Agaricoid|Clavarioid|Bolet", morph) ~ "Agaricoid Forms",
    grepl("Corticioid|Thallus|Coralloid", morph) ~ "Corticioid / Thallus",
    grepl("Microfungus|Yeast|Tremelloid|Dimorphic", morph) ~ "Microfungus / Yeast",
    grepl("Gasteroid|Secotioid|Pezizoid", morph) ~ "Gasteroid Forms",
    morph == "Unassigned" ~ "Unassigned",
    TRUE ~ "Other"
  )
}

growth_morphology_collapsed_grouped <- growth_morphology_collapsed %>%
  dplyr::mutate(
    Morph_Group = morph_group_map(`Growth Morphology`)
  ) %>%
  dplyr::group_by(Sample, Fun_sor_clusters, Morph_Group) %>%
  dplyr::summarise(Abundance = sum(Abundance), .groups = "drop")

morph_group_levels <- c(
  "Agaricoid Forms",
  "Corticioid / Thallus",
  "Microfungus / Yeast",
  "Gasteroid Forms",
  "Other",
  "Unassigned"
)

morph_group_palette <- c(
  "Agaricoid Forms"       = "#d55e00",  # rich orange-red
  "Corticioid / Thallus"  = "#0072b2",  # blue
  "Microfungus / Yeast"   = "#009e73",  # strong teal-green
  "Gasteroid Forms"       = "#cc79a7",  # magenta
  "Other"                 = "#666666",  # dark neutral grey
  "Unassigned"            = "#d9d9d9"   # light grey
)

growth_morphology_collapsed_grouped$Morph_Group <- factor(
  growth_morphology_collapsed_grouped$Morph_Group,
  levels = morph_group_levels
)

ggplot(growth_morphology_collapsed_grouped, aes(x = Sample, y = Abundance, fill = Morph_Group)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_wrap(~ Fun_sor_clusters, scales = "free_x") +
  scale_fill_manual(values = morph_group_palette, drop = FALSE) +
  labs(
    title = "Grouped Growth Morphologies by Fungal Subassemblage",
    x = "Sample",
    y = "Relative Abundance",
    fill = "Growth Morphology Group"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    strip.text = element_text(face = "bold")
  )

# more cats
morph_group_map_expanded <- function(morph) {
  dplyr::case_when(
    grepl("Agaricoid|Clavarioid|Bolet", morph) ~ "Agaricoid Forms",
    grepl("Corticioid|Thallus|Coralloid|Cyphelloid", morph) ~ "Corticioid Forms",
    grepl("Microfungus|Chytrid|Cordyceptoid|Smut|Rust|Plasmodium", morph) ~ "Microfungus Forms",
    grepl("Yeast|Dimorphic|Facultative", morph) ~ "Yeast / Dimorphic",
    grepl("Gasteroid|Pezizoid|Secotioid|Polyporoid", morph) ~ "Gasteroid Forms",
    grepl("Tremelloid", morph) ~ "Tremelloid",
    morph == "Unassigned" ~ "Unassigned",
    TRUE ~ "Other"
  )
}

# 2. Apply grouping to your pre-collapsed morphology data
growth_morphology_collapsed_expanded <- growth_morphology_collapsed %>%
  dplyr::mutate(Morph_Group = morph_group_map_expanded(`Growth Morphology`)) %>%
  dplyr::group_by(Sample, Fun_sor_clusters, Morph_Group) %>%
  dplyr::summarise(Abundance = sum(Abundance), .groups = "drop")

# 3. Set final palette (subdued, perceptually distinct)
morph_group_palette_expanded <- c(
  "Agaricoid Forms"     = "#00798C",  # cyan slate 
  "Corticioid Forms"    = "#D1495B",  # warm rose coral
  "Microfungus Forms"   = "#EDAE49",  # goldenrod
  "Yeast / Dimorphic"   = "#66A182",  # seafoam green
  "Gasteroid Forms"     = "#cc79a7",  # twilight navy
  "Tremelloid"          = "#8D5B4C",  # cool clay
  "Other"               = "grey30",  # neutral grey
  "Unassigned"          = "#E5E5E5"   # light grey
)


# 4. Apply factor levels for control
growth_morphology_collapsed_expanded$Morph_Group <- factor(
  growth_morphology_collapsed_expanded$Morph_Group,
  levels = names(morph_group_palette_expanded)
)

morph_plot<-ggplot(growth_morphology_collapsed_expanded, aes(x = Sample, y = Abundance, fill = Morph_Group)) +
  geom_bar(stat = "identity", position = "fill", width = 0.9) +
  facet_wrap(~ Fun_sor_clusters, scales = "free_x") +
  scale_fill_manual(values = morph_group_palette_expanded, drop = FALSE) +
  labs(
    title = "Growth Morphologies by Fungal Subassemblage",
    x = "Sample",
    y = "Relative Abundance",
    fill = "Morphology Group"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    strip.text = element_text(face = "bold", size = 13),
    legend.position = "right"
  )

## Trait ----

# Clean and Collapse “Trait”
trait_collapsed <- guild_melted_meta %>%
  dplyr::mutate(Trait = dplyr::case_when(
    is.na(Trait) | Trait == "" ~ "Unassigned",
    TRUE ~ Trait
  )) %>%
  dplyr::group_by(Sample, Fun_sor_clusters, Trait) %>%
  dplyr::summarise(Abundance = sum(Count), .groups = "drop")

trait_collapsed_clean <- trait_collapsed %>%
  dplyr::mutate(Trait_Group = dplyr::case_when(
    Trait %in% c("NULL", "Null", NA, "") ~ "Unassigned",
    TRUE ~ Trait
  )) %>%
  dplyr::group_by(Sample, Fun_sor_clusters, Trait_Group) %>%
  dplyr::summarise(Abundance = sum(Abundance), .groups = "drop")

trait_levels <- c(
  "Unassigned",
  "Soft Rot",
  "Brown Rot",
  "Brown Rot-White Rot",
  "White Rot",
  "Hypogeous"
)

# 2. Set the custom palette
trait_palette <- setNames(
  c(
    "grey70",   # Unassigned      → neutral grey
    "#80cdc1",  # Soft Rot        → muted teal (moisture, water-associated)
    "#a6611a",  # Brown Rot       → rusty brown (cellulose degradation)
    "#dfc27d",  # Brown-White     → wheat gold (intermediate function)
    "#018571",  # White Rot       → forest green (lignin breakdown)
    "#542788"  # Hypogeous       → deep violet (underground, obscure)
  ),
  trait_levels
)
# 3. Apply factor levels
trait_collapsed_clean$Trait_Group <- factor(trait_collapsed_clean$Trait_Group, levels = trait_levels)

# 5. Plot
trait_plot<-ggplot(trait_collapsed_clean, aes(x = Sample, y = Abundance/10000, fill = Trait_Group)) +
  scale_y_continuous(limits = c(0,0.8),
    breaks = c(0,0.25,0.5,0.8),
                     labels = percent_format(accuracy = 1)
                     ) +
  geom_bar(stat = "identity", 
           position = "stack", width = 0.95,
           na.rm = FALSE) +
  facet_wrap(~ Fun_sor_clusters, scales = "free_x") +
  scale_fill_manual(values = trait_palette, drop = FALSE) +
  labs(
    title = "Fungal Traits by Subassemblage",
    x = "Sample",
    y = "Relative Abundance",
    fill = "Trait"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    strip.text = element_text(face = "bold", size = 13),
    legend.key.size = unit(0.5, "cm"),
    legend.text = element_text(size = 11),
    legend.title = element_text(size = 12),
    panel.spacing = unit(0.8, "lines")
  )
trait_plot

## combine plots ----
plot_grid(guild_plot,trophic_plot,morph_plot,trait_plot)

library("patchwork")
library("scales")

patchwork_theme <- theme_minimal(base_size = 13) +
  theme(
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "white", color = "black", linewidth = 0.3),
    strip.text = element_text(face = "bold", size = 12),
    axis.text.x = element_blank(),
    axis.title = element_text(color = "black"),
    axis.ticks = element_line(color = "black"),
    legend.position = "right",
    legend.title = element_text(size = 11),
    legend.text = element_text(size = 10)
  )

plot_list <- list(guild_plot, trophic_plot, 
                  morph_plot, trait_plot)

plot_list_clean <- lapply(plot_list, function(p) {
  p +
    patchwork_theme +
    scale_y_continuous(labels = scales::label_percent(),
                         # percent_format(accuracy = 1),
                       transform = "reverse"
                       # limits = c(1,0),
              )+
  
                        
  guides(fill = guide_legend(reverse = TRUE))
})

# Unpack cleaned plots
guild_plot_clean   <- plot_list_clean[[1]]
guild_plot_clean
trophic_plot_clean <- plot_list_clean[[2]]
morph_plot_clean   <- plot_list_clean[[3]]
trait_plot_clean   <- plot_list_clean[[4]]

# Combine with patchwork
combo_plot_1 <- guild_plot_clean / trophic_plot_clean + morph_plot_clean / trait_plot_clean +
  plot_layout(guides = "keep")# &
  # theme(legend.position = "right")
combo_plot_1



combo_plot_cleaned <- (guild_plot + trophic_plot + morph_plot + trait_plot) +
  plot_layout(ncol = 2, guides = "keep") &
  patchwork_theme &
  scale_y_continuous(labels = percent_format(accuracy = 1), limits = c(0, 1)) &
  guides(fill = guide_legend(reverse = TRUE)) &
  theme(legend.position = "right")


combo_plot_cleaned
