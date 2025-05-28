


bwc_domainA <- tax_glom(Bac_wholecommunity, taxrank="Domain")
bwc_domainB <- prune_taxa(taxa_sums(bwc_domainA) > 0, bwc_domainA)
bwc_domain.r  = transform_sample_counts(bwc_domainB, function(x) x / sum(x) )

(get_taxa_unique(bwc_domain.r, taxonomic.rank="Domain"))

taxa_sums(bwc_domain.r)/484

#bacteria
round(mean(otu_table(bwc_domain.r)[1,])*100,2)
round(sd(otu_table(bwc_domain.r)[1,])*100,2)

#archaea
round(mean(otu_table(bwc_domain.r)[2,])*100,2)
round(sd(otu_table(bwc_domain.r)[2,])*100,2)

(get_taxa_unique(Fun_wholecommunity, taxonomic.rank="Domain"))


bwc_Domains<-(get_taxa_unique(bwc_domain.r, taxonomic.rank="Domain"))
uniq_doms<-data.frame(matrix(ncol=3,nrow=length(bwc_Domains)))
row.names(uniq_doms)<-Domains
colnames(uniq_doms)<-c("Domain","reads_assigned","percentage_all_reads")
uniq_doms[,1]<-Domains
uniq_doms[,2]<-taxa_sums(bwc_domainB)
uniq_doms[,3]<-taxa_sums(bwc_domainB)/sum(sample_sums(bwc_domainB))