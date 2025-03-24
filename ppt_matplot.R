col_n10 <- c("#8E0152","#C51B7D","#DE77AE","#F1B6DA","#FDE0EF","#E6F5D0","#B8E186","#7FBC41","#4D9221","#276419")

par(mfrow = c(1, 2)) #c(nr, nc)

f1<-plot_ordination(Fun_wholecommunity, Fun_wc_sor_k4.ord, color = "Fun_sor_clusters") +
  geom_point(size = 0.8, alpha = 0.1) +
  # geom_text(mapping = aes(label = Fun_sor_clusters), size = 4, vjust = 1.1, show.legend = F) +
  scale_color_manual(values = col_clusn10, name = "Sørensen clusters")+
  stat_ellipse(aes(fill=Fun_sor_clusters), alpha=0.7,
               type = "t",
               geom = "polygon", segments=6
               )+
  scale_fill_manual(values = col_clusn10, name = "Sørensen clusters")+
  ggtitle("Fungal clusters") +
  theme_bw() +
  theme(legend.position="none",
        plot.title = element_text(color="black", size=24),
        axis.text = element_text(color="black", size=10),
        axis.title = element_text(color="black", size=12),
        legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
        plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

b1<-plot_ordination(Bac_wholecommunity, Bac_wc_sor_k5.ord, color = "Bac_sor_clusters") +
  geom_point(size = 0.8, alpha = 0.1) +
  scale_color_manual(values = col_n14, name = "Sørensen clusters")+
  stat_ellipse(aes(fill=Bac_sor_clusters), alpha=0.7,
               type = "t",
               geom = "polygon", segments=6
  )+
  scale_fill_manual(values = col_n14, name = "Sørensen clusters")+
  ggtitle("Bacterial clusters") +
  theme_bw() +
  theme(legend.position="none",
        plot.title = element_text(color="black", size=24),
        axis.text = element_text(color="black", size=10),
        axis.title = element_text(color="black", size=12),
        legend.text = element_text(color="black", size=8),legend.title = element_text(color="black", size=10),
        plot.background = element_blank(),panel.border = element_rect(colour = "black", fill=NA, linewidth=.75),
        panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
plot_grid(b1,f1)





library(ggmatplot)


# F1 SOM sim
f1_Bac_SOM.sim.mrm<-MRM(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim ~ env_dist_matrices[["Fun_sor_clus2"]][["F1_SOM_m.std"]],nperm=1000) # r2 0.2468853

f1_Fun_SOM.sim.mrm<-MRM(betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim ~ env_dist_matrices[["Fun_sor_clus2"]][["F1_SOM_m.std"]],nperm=1000) # r2 0.2468853

f1_Bac_SOM.sim.mrm.title<-paste("Bac Turnover:",expression(R^2), " = ",(round(f1_Bac_SOM.sim.mrm$r.squared[1], digits = 3)),
                        ", slope = ",round(f1_Bac_SOM.sim.mrm$coef[2,1], digits = 3),
                        sep=""
)

f1_Fun_SOM.sim.mrm.title<-paste("Fun Turnover:",expression(R^2), " = ",(round(f1_Fun_SOM.sim.mrm$r.squared[1], digits = 3)),
                                ", slope = ",round(f1_Fun_SOM.sim.mrm$coef[2,1], digits = 3),
                                sep=""
)


b2<-ggmatplot(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim, env_dist_matrices[["Fun_sor_clus2"]]$F1_SOM_m.std, color="#006e90",
          size = 2,alpha=0.5,
          ylim=c(0,1),xlim=c(0,1),  
          main = "BFC2",
          xlab="Soil Moisture",
          ylab="Turnover")+
  geom_abline(slope = f1_Bac_SOM.sim.mrm$coef[2,1], intercept = f1_Bac_SOM.sim.mrm$coef[1,1], color="#006e90", linewidth=2)+
  labs(subtitle = f1_Bac_SOM.sim.mrm.title, parse=T)+
  theme_bw() +
  theme(
    plot.background = element_blank(),
    plot.title = element_text(color="black", size=16)
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.background = element_blank()
    ,axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    legend.title  = element_text(color="black", size=14),
    legend.text  = element_text(color="black", size=12),
    panel.border = element_rect(colour = "black", fill=NA, linewidth=.75)
  )

f2<-ggmatplot(betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim, env_dist_matrices[["Fun_sor_clus2"]]$F1_SOM_m.std, color="#E5A60C",
          size = 2,alpha=0.5,
          ylim=c(0,1),xlim=c(0,1),  
          main = "BFC2",
          xlab="Soil Moisture",
          ylab="Turnover")+
  geom_abline(slope = f1_Fun_SOM.sim.mrm$coef[2,1], intercept = f1_Fun_SOM.sim.mrm$coef[1,1], color="#E5A60C", linewidth=2)+
  labs(subtitle = f1_Fun_SOM.sim.mrm.title, parse=T)+
  theme_bw() +
  theme(
    plot.background = element_blank(),
    plot.title = element_text(color="black", size=16)
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.background = element_blank()
    ,axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    legend.title  = element_text(color="black", size=14),
    legend.text  = element_text(color="black", size=12),
    panel.border = element_rect(colour = "black", fill=NA, linewidth=.75)
  )

plot_grid(b2,f2)
# Bac: high sim, slightly higher is non-F1, higher sne is F1
# Fun: higher sim non-F1, higher sne is F1

# F1 BacVFun sim
f1.sim.mrm<-MRM(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim ~ betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim,nperm=1000) # r2 0.1091436

f1.sim.mrm.title<-paste("Turnover\n",expression(R^2), " = ",(round(f1.sim.mrm$r.squared[1], digits = 3)),
                           ", slope = ",round(f1.sim.mrm$coef[2,1], digits = 3),
                           sep=""
)

ggmatplot(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim, betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["F1"]]$beta.sim, color="black",
          size = 2,alpha=0.5,
          ylim=c(0,1), main = "BFC2",
          xlab="Bacterial Turnover",
          ylab="Fungal Turnover")+
  geom_abline(slope = f1.sim.mrm$coef[2,1], intercept = f1.sim.mrm$coef[1,1], color="black", linewidth=2)+
  labs(subtitle = f1.sim.mrm.title, parse=T)+
  theme_bw() +
  theme(
    plot.background = element_blank(),
    plot.title = element_text(color="black", size=16)
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.background = element_blank()
    ,axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    legend.title  = element_text(color="black", size=14),
    legend.text  = element_text(color="black", size=12),
    panel.border = element_rect(colour = "black", fill=NA, linewidth=.75)
  )


# non-F1 BacVFun sim
nonf1.sim.mrm<-MRM(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["non-F1"]]$beta.sim ~ betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["non-F1"]]$beta.sim,nperm=1000) # r2 0.4143604

nonf1.sim.mrm.title<-paste("Turnover\n",expression(R^2), " = ",(round(nonf1.sim.mrm$r.squared[1], digits = 3)),
                          ", slope = ",round(nonf1.sim.mrm$coef[2,1], digits = 3),
                          sep=""
)

ggmatplot(betapart_results[["Bac"]][["Fun_sor_clus2"]][["pairwise"]][["non-F1"]]$beta.sim, betapart_results[["Fun"]][["Fun_sor_clus2"]][["pairwise"]][["non-F1"]]$beta.sim, color="black",
          size = 2,alpha=0.5,
          ylim=c(0,1), main = "BFC1",
          xlab="Bacterial Turnover",
          ylab="Fungal Turnover")+
  geom_abline(slope = nonf1.sim.mrm$coef[2,1], intercept = nonf1.sim.mrm$coef[1,1], color="black", linewidth=2)+
  labs(subtitle = nonf1.sim.mrm.title, parse=T)+
  theme_bw() +
  theme(
    plot.background = element_blank(),
    plot.title = element_text(color="black", size=16)
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.background = element_blank()
    ,axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    legend.title  = element_text(color="black", size=14),
    legend.text  = element_text(color="black", size=12),
    panel.border = element_rect(colour = "black", fill=NA, linewidth=.75)
  )


# WC BacVFun sor
wc.s.mrm<-MRM(betapart_results[["Bac"]][["all"]][["pairwise"]]$beta.sor ~ betapart_results[["Fun"]][["all"]][["pairwise"]]$beta.sor,nperm=10000) # r2 

wc.s.mrm.sor.title<-paste("Total Dissimilarity BvF:",expression(R^2), " = ",(round(wc.s.mrm$r.squared[1], digits = 3)),
                          ", slope = ",round(wc.s.mrm$coef[2,1], digits = 3),
                          sep=""
)

ggmatplot(betapart_results[["Bac"]][["all"]][["pairwise"]]$beta.sor, betapart_results[["Fun"]][["all"]][["pairwise"]]$beta.sor, color="black",
                                           size = 2,alpha=0.5,
                                           ylim=c(0,1), main = "Whole Dataset",
                                           xlab="Bacteria",
                                           ylab="Fungi")+
  geom_abline(slope = wc.s.mrm$coef[2,1], intercept = wc.s.mrm$coef[1,1], color="black", linewidth=2)+
  labs(subtitle = wc.s.mrm.sor.title, parse=T)+
  theme_bw() +
  theme(
    plot.background = element_blank(),
    plot.title = element_text(color="black", size=16)
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.background = element_blank()
    ,axis.text.x = element_text(color="black", size=12),
    axis.text.y = element_text(color="black", size=12),
    axis.title.x = element_text(color="black", size=14),
    axis.title.y = element_text(color="black", size=14),
    legend.title  = element_text(color="black", size=14),
    legend.text  = element_text(color="black", size=12),
    panel.border = element_rect(colour = "black", fill=NA, linewidth=.75)
  )




par(mfrow = c(1, 2), #c(nr, nc)
    mar = c(9,9,6,2)) # bottom, left, top, right

plot.decay.pretty(decay.Bac_all.exp.sor, col="#006e90", main="Bacteria", lty=1,lwd=15,
                  xlim = c(0,1600),ylim = c(0,1),col.line="#004E66",xaxp = c(0,1500,3),
                  ylab="Pairwise Total Dissimilarity\n",xlab="", 
                  cex = 1.9,cex.axis=2.2,cex.lab=2.9,cex.main=3.5)
plot.decay.pretty(decay.Fun_all.exp.sor, col="#f18f01", add=F, main="Fungi", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=15,
                  col.line="#B76E01",xaxp = c(0,1500,3),
                  ylab="",xlab="",
                  cex = 1.9,cex.axis=2.2,cex.lab=2.9,cex.main=3.5)
mtext("Distance between Communities (in km)", side = 1, line = -3, outer = TRUE, cex=2.9)




par(mfrow = c(1, 1),mar = c(4,7,6,3),cex = 1.9,cex.axis=1.2,cex.lab=1.5,cex.main=2) #c(nr, nc)
plot.decay.pretty(decay.Fun_F1.exp.sor2, col=paste(col_n10[1],"cc",sep = ""), add=F, main="Fungi", ylab="Pairwise Total Dissimilarity\n",
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[1],xaxp = c(0,1500,3),
                  xlab="Distance between Communities (in km)")
plot.decay.pretty(decay.Fun_F3.exp.sor, col=paste(col_n10[3],"cc",sep = ""), add=T, main="F3", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[3],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F4.exp.sor, col=paste(col_n10[4],"cc",sep = ""), add=T, main="F4", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[4],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F5.exp.sor, col=paste(col_n10[5],"cc",sep = ""), add=T, main="F5", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[5],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F6.exp.sor, col=paste(col_n10[6],"cc",sep = ""), add=T, main="F6", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[6],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F7.exp.sor, col=paste(col_n10[7],"cc",sep = ""), add=T, main="F7", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[7],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F8.exp.sor, col=paste(col_n10[8],"cc",sep = ""), add=T, main="F8", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[8],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F9.exp.sor, col=paste(col_n10[9],"cc",sep = ""), add=T, main="F9", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[9],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Fun_F10.exp.sor, col=paste(col_n10[10],"cc",sep = ""), add=T, main="F10", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n10[10],xaxp = c(0,1500,3),
                  ylab="",xlab="")

par(mfrow = c(1, 1),mar = c(4,7,6,3),cex = 1.9,cex.axis=1.2,cex.lab=1.5,cex.main=2) #c(nr, nc)

plot.decay.pretty(decay.Bac_B1.exp.sor2, col=paste(col_n14[1],"cc",sep = ""), main="Bacteria", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,ylab="Pairwise Total Dissimilarity\n",
                  col.line=col_n14[1],xaxp = c(0,1500,3),
                  xlab="Distance between Communities (in km)")
plot.decay.pretty(decay.Bac_B2.exp.sor, col=paste(col_n14[2],"cc",sep = ""), add=T, main="B2", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[2],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B3.exp.sor, col=paste(col_n14[3],"cc",sep = ""), add=T, main="B3", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[3],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B4.exp.sor, col=paste(col_n14[4],"cc",sep = ""), add=T, main="B4", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[4],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B5.exp.sor, col=paste(col_n14[5],"cc",sep = ""), add=T, main="B5", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[5],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B7.exp.sor, col=paste(col_n14[7],"cc",sep = ""), add=T, main="B7", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[7],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B8.exp.sor, col=paste(col_n14[8],"cc",sep = ""), add=T, main="B8", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[8],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B9.exp.sor, col=paste(col_n14[9],"cc",sep = ""), add=T, main="B9", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[9],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B10.exp.sor, col=paste(col_n14[10],"cc",sep = ""), add=T, main="B10", 
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[10],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B11.exp.sor, col=paste(col_n14[11],"cc",sep = ""), add=T,
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[11],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B12.exp.sor, col=paste(col_n14[12],"cc",sep = ""), add=T,
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[12],xaxp = c(0,1500,3),
                  ylab="",xlab="")
plot.decay.pretty(decay.Bac_B13.exp.sor, col=paste(col_n14[13],"cc",sep = ""), add=T,
                  xlim = c(0,1600),ylim = c(0,1),las=1, lty=1,lwd=5,
                  col.line=col_n14[13],xaxp = c(0,1500,3),
                  ylab="",xlab="")