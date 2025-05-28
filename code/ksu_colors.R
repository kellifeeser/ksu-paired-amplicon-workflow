


library(swatches)
library("colorspace")
  

###### Domain ###### 
domain_cols = c("Bacteria-Archaea" = "#006e90", "Fungi" = "#f18f01")
####################


 
##### Metadata ##### 

# Site
  # 8 westerns sites (light to dark purple as latitude decreases -> southern is darker)
  western_sites_n8<-c("#F3E9F3","#E7D4E8","#BE9FC1",
                      "#946A9A","#6A3573","#4B0E55",
                      "#36073E","#17001A")
  show_palette(western_sites_n8)
  
  # 4 middle and 1 eastern site (green)
  easterb_sites_n5<-c("#D9F0D3","#9ACF9A","#5AAE61","#1B7837","#00441B")
  show_palette(easterb_sites_n5)
  
  #all sites, ordered by decreasing latitude, western 1st
  sites_n13<-c("#F3E9F3","#E7D4E8","#BE9FC1",
               "#946A9A","#6A3573","#4B0E55",
               "#36073E","#17001A",
               "#D9F0D3","#9ACF9A","#5AAE61",
               "#1B7837","#00441B")
  show_palette(sites_n13)


# Grasses
  Grassland_cols<-c("#FFE1A8", "#E26D5C", "#723D46", "#322022") 
  
  # Photos
    # ANGE: https://commons.wikimedia.org/wiki/File:Andropogon_gerardii_%283904160434%29.jpg
  
  # bac_grass_cols<-c("#96A13A", "#582d06", "#537D8D", "#21295C", "#90708C")
  bac_grass_cols<-c("#96A13A", "#994f0b", "#537D8D", "#21295C", "#90708C")
  fun_grass_cols<-c("#B9C45A", "#994f0b", "#729bac", "#364396", "#af97ac") 
  
  
# Latitudinal Bin  

  bac_bin_cols_n5<-c("North" = "#43CDE2",
                      "North Central" = "#68A1CD",
                      "South Central" = "#E2DD5C",
                      "South" = "#E5A60C")
  fun_bin_cols_n5<-c("North" = "#6BE9FF",
                    "North Central" = "#6ABEF9",
                    "South Central" = "#FFFA6C",
                    "South" = "#FFC25B")
  
  # bac_bin_cols_n5<-darken(blue2orange, 0.1)
  # fun_bin_cols_n5<-lighten(blue2orange, 0.1)

# Longitudinal Gradient
  
  bac_grad_cols_n3<-c("West" = "#2677A6",
                      "Middle" = "#4F0B9C",
                      "East" = "#C83C62")
  fun_grad_cols_n3<-c("West" = "#3D91C6",
                      "Middle" = "#6543A7",
                      "East" = "#FD3C76")
  
  # bac_grad_cols_n3<-darken(purple2red, 0.05)
  # fun_grad_cols_n3<-lighten(purple2red, 0.15)
  
  purple2red<-c("#147EB3","#4F1D96", "#E61962")
  
# working
  
  # bac_bin_cols_n5<-c("#00d4f5","#31a2ed", "#fff81f","#f5a700","#e07b00")
  # fun_bin_cols_n5<-c("#47e7ff","#60b6f1", "#fff95b","#FFBB2D","#ff930f")
  
  # bac_bin_cols_n5<-c("#222255","#225555","#225522","#666633","#663333")
  # fun_bin_cols_n5<-c("#BBCCEE","#CCEEFF","#CCDDAA","#EEEEBB","#FFCCCC")
  # 
  # bac_bin_cols_n5<-c("#222255","#225555","#225522","#666633","#663333")
  # fun_bin_cols_n5<-c("#343483","#348383","#348334","#95954B","#954B4B")
  # fun_bin_cols_n5<-c("#BBCCEE","#CCEEFF","#CCDDAA","#EEEEBB","#FFCCCC")
  # 
  # show_palette(c("#222255","#225555","#225522","#666633","#663333"))
  # show_palette(c("#343483","#348383","#348334","#95954B","#954B4B"))
  # show_palette(c("#BBCCEE","#CCEEFF","#CCDDAA","#EEEEBB","#FFCCCC"))
  # 
  # 
  # show_palette(colorRampPalette(c("#60b6f1", "#fff95b"))( 7 )) ## (n)
  # 
  # show_palette(colorRampPalette(c("#60b6f1", "#fff95b","#ff930f"))( 6 )) ## (n)
  # show_palette(colorRampPalette(c("#60b6f1", "#fff95b","#ff930f"))( 6 )) ## (n)
  
  show_palette(c("#47e7ff","#60b6f1", "#fff95b","#FFBB2D","#ff930f")) # 3 shades lighter
  show_palette(c("#00d4f5","#31a2ed", "#fff81f","#f5a700","#e07b00"))
  show_palette(c("#00b1cc","#1283ce", "#e0d900","#cc8b00","#a35a00"))
  
blue2orange<-c("#47e7ff","#60b6f1", "#fff95b","#FFBB2D","#ff930f")
swatchplot(
  "-20%" = lighten(blue2orange, 0.2),
  "-10%" = lighten(blue2orange, 0.1),
  "  0%" = blue2orange,
  " 10%" =  darken(blue2orange, 0.1),
  " 20%" =  darken(blue2orange, 0.2),
  off = c(0, 0)
)

show_palette(darken(blue2orange, 0.1))
show_palette(lighten(blue2orange, 0.1))


# Longitudinal Gradient

bac_grad_cols_n3<-darken(purple2red, 0.05)
fun_grad_cols_n3<-lighten(purple2red, 0.15)

purple2red<-c("#147EB3","#4F1D96", "#E61962")
swatchplot(
  "-20%" = lighten(purple2red, 0.2),
  "-10%" = lighten(purple2red, 0.1),
  "  0%" = purple2red,
  " 10%" =  darken(purple2red, 0.1),
  " 20%" =  darken(purple2red, 0.2),
  off = c(0, 0)
)

show_palette(darken(purple2red, 0.05))
show_palette(lighten(purple2red, 0.15))

show_palette(colorRampPalette(c("#FAC5B2", "#ec458d","#474ed7"))( 6 )) ## (n)

show_palette(colorRampPalette(c("#ED5190", "#7A3D84", "#3e3b92"))( 5 )) ## (n)

show_palette(colorRampPalette(c("#FAC5B2", "#ec458d","#474ed7"))( 9 )) ## (n)
show_palette(colorRampPalette(c( "#F6A5A8", "#F3859F", "#EF6596", "#EC458D"))( 9 )) ## (n)


show_palette(colorRampPalette(c("#fff1bf", "#ec458d","#474ed7"))( 9 ))


show_palette(colorRampPalette(c("#422A55","#6B2E44","#BD3522", "#EC842E"))( 5 )) ## (n)
show_palette(colorRampPalette(c("#372457", "#901D2C", "#D55D28"))( 3 )) ## (n)
show_palette(colorRampPalette(c("#1a2766", "#ae1b1e","#fc9f32"))( 11 )) ## (n)
show_palette(colorRampPalette(c("#350AAC", "#570D54","#BF15A0", "#F44369"))( 6 )) ## (n)

show_palette(colorRampPalette(c("darkblue", "#570D54","#ae1b1e" ))( 7 )) ## (n)
show_palette(colorRampPalette(c("#350AAC", "#490B77", "#6B0E63", "#8C1440"))( 4 )) ## (n)
show_palette(colorRampPalette(c("#8C1440", "#ae1b1e"))( 3 )) ## (n)
show_palette(colorRampPalette(c("#0077bb", "#ee3377", "#cc3311"))( 7 )) ## (n)
show_palette(colorRampPalette(c("#189EC6","#9E498D", "#EE3377"))( 9 )) ## (n)

#"#B84185"

show_palette(colorRampPalette(c("#3e3b92", "#B74076","#f44369"))( 3 )) ## (n)

show_palette(colorRampPalette(c("#3e3b92","#7A3D84","#f44369"))( 5 )) ## (n)

show_palette(colorRampPalette(c("#6710c2","#c81d77"))( 3 )) ## (n)

show_palette(colorRampPalette(c("#30c5d2","#471069"))( 5 )) ## (n)

  # show_palette(c("#868f2a", "#582d06", "#EB5E28", "#faedca", "#5f758e"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#65DEF1", "#faedca", "#5f758e"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#fe5d26", "#faedca", "#5f758e"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#537D8D", "#faedca", "#A790A5"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#537D8D", "#001D4A", "#90708C"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#537D8D", "#001D4A", "#A790A5"))
  # 
  # show_palette(c("#868f2a", "#582d06", "#537D8D", "#21295C", "#90708C"))
  
  show_palette(c("#96A13A", "#582d06", "#537D8D", "#21295C", "#90708C"))
  
  show_palette(c("#b3be4b", "#864509", "#6592a4", "#313c87", "#a68ca3")) # 2 shades lighter
  
  show_palette(c("#B9C45A", "#994f0b", "#729bac", "#364396", "#af97ac")) # 3
  
  bac_grass_cols<-c("#96A13A", "#582d06", "#537D8D", "#21295C", "#90708C")
  
c("#cba46c", "#868f2a", "#582d06", "#736627", "#915c1e")
  
c("#805d93", "#f49fbc", "#ffd3ba", "#9ebd6e", "#169873")
#c("805d93","f49fbc","ffd3ba","9ebd6e","169873")

c("#e6ab02","#1b9e77","#d95f02","#7570b3") #yellow teal, orange, purple

####################

phylum_colors <- c(
  "#CBD588", "#5F7FC7", "orange","#DA5724", "#508578", "#CD9BCD",
  "#AD6F3B", "#673770","#D14285", "#652926", "#C84248", 
  "#8569D5", "#5E738F","#D1A33D", "#8A7C64", "#599861"
)


##### Taxonomy ##### 
# library(tidyverse)

# paste_names <- function(x, n = NULL) {
#   if (is.null(n)) n <- 1:length(x)
#   
#   x %>% 
#     names() %>% 
#     `[`(n) %>% 
#     paste(collapse = "', '") %>% 
#     paste0("'", ., "'")
# }
# 
# paste_names(as.character(sort(unique(dat_Bac.Phylum.r$Phylum))[1]), 2)
# 
# paste0("'", as.character(sort(unique(dat_Bac.Phylum.r$Phylum))[1]), "'")

# ames_paste_quotesf <- function(my_data) {
#   paste0("'",
#          paste0(names(my_data), collapse = "', '"),
#          "'") %>% cat
# }
# names_paste_quotesf(mtcars2)
#'model', 'mpg', 'cyl', 'disp', 'hp', 'drat', 'wt', 'qsec', 'vs', 'am', 'gear', 'carb'
#'



# Phylum - Bac
# Bac.Phylum_lowlab<-as.character(sort(unique(dat_Bac.Phylum.r$Phylum))[1])

Bac_Phylum_cols <- c("≤ 0.4% relative abundance" = '#CBD588', 
                     "Acidobacteria" = '#5F7FC7', 
                     "Actinobacteria" = '#FFA401', 
                     "Armatimonadetes" = '#DA5724',
                     "Bacteroidetes" = '#508578',
                     "Candidatus_Saccharibacteria" = '#CD9BCD',
                     "Firmicutes" = '#673770', 
                     "Planctomycetes" = '#D14285',
                     "Proteobacteria" = '#652926', 
                     "Verrucomicrobia" = '#C84248')


# Bac_Phylum_cols<-(values = c("Low Abundance" = '#CBD588', "Acidobacteria" = '#5F7FC7', "Actinobacteria" = '#FFA401', "Armatimonadetes" = '#DA5724', "Bacteroidetes" = '#508578', "Candidatus_Saccharibacteria" = '#CD9BCD', "Firmicutes" = '#673770', "Planctomycetes" = '#D14285', "Proteobacteria" = '#652926', "Verrucomicrobia" = '#C84248')
# )
# show_palette(Bac_Phylum_cols)
# 

# sort(unique(dat_Bac.Class.r$Class))

Bac_Class_cols<-(values = c("≤ 2% relative abundance" = '#CBD588', 
                            "Actinobacteria" = '#FFA401', 
                            "Alphaproteobacteria" = '#673770', 
                            "Bacilli" = '#8AF3FF', 
                            "Betaproteobacteria" = '#1B065E', 
                            "Chitinophagia" = '#488286', 
                            "Cytophagia" = '#EAD94C', 
                            "Deltaproteobacteria" = '#A09BE7', 
                            "Gammaproteobacteria" = '#652926', 
                            "Thermoleophilia" = '#C2E812', 
                            "uncl_Candidatus_Saccharibacteria" = '#CD9BCD'))
# show_palette(Bac_Class_cols)

# sort(unique(dat_Bac.Order.r$Order))
Bac_Order_cols<-(values = c("≤ 2.7% relative abundance" = '#CBD588', 
                            "Bacillales" = '#FF1053', 
                            "Burkholderiales" = '#1B065E', 
                            "Chitinophagales" = '#488286', 
                            "Micromonosporales" = '#EDA2C0', 
                            "Myxococcales" = '#A09BE7', 
                            "Pseudonocardiales" = '#BB4430', 
                            "Rhizobiales" = '#F58549', 
                            "Rhodospirillales" = '#17C3B2', 
                            "Sphingomonadales" = '#3581B8', 
                            "Streptomycetales" = '#F3DFA2'))
# show_palette(Bac_Order_cols)


# sort(unique(dat_Bac.Family.r$Family))
Bac_Family_cols<-(values = c("≤ 2.6% relative abundance" = '#CBD588', 
                             "Bacillaceae_1" = '#673770', 
                             "Bradyrhizobiaceae" = '#636940', 
                             "Chitinophagaceae" = '#488286', 
                             "Comamonadaceae" = '#1B065E', 
                             "Micromonosporaceae" = '#EDA2C0', 
                             "Pseudonocardiaceae" = '#BB4430', 
                             "Rhizobiaceae" = '#36C9C6', 
                             "uncl_Rhizobiales" = '#F58549', 
                             "Sphingomonadaceae" = '#3581B8', 
                             "Streptomycetaceae" = '#F3DFA2'))
# show_palette(Bac_Family_cols)

Bac_Genus_cols<-(values = c("≤ 2.1% relative abundance" = '#CBD588', 
                            "Acidibacter" = '#652926', 
                            "Bradyrhizobium" = '#636940', 
                            "Saccharibacteria_genera_incertae_sedis" = '#CD9BCD', 
                            "Sphingomonas" = '#3581B8', 
                            "Streptomyces" = '#F3DFA2', 
                            "uncl_Comamonadaceae" = '#1B065E', 
                            "uncl_Micromonosporaceae" = '#EDA2C0', 
                            "uncl_Myxococcales" = '#A09BE7', 
                            "uncl_Pseudonocardiaceae" = '#BB4430', 
                            "uncl_Rhizobiales" = '#F58549'))
# show_palette(Bac_Genus_cols)



# Phylum - Fun
  # Fun.Phylum_lowlab<-as.character(sort(unique(dat_Fun.Phylum.r$Phylum))[1])
  # Fun.Phylum_lowlab

Fun_Phylum_cols<-(values = c("≤ 0.0002% relative abundance" = '#28A48D', 
            "Ascomycota"="#8569D5",
           "Basidiomycota"="#D1A33D",
           "Mucoromycota"="#5E738F"
))

# Class - Fun
  # sort(unique(dat_Fun.Class.r$Class))

                            

Fun_Class_cols<-(values = c("≤ 0.6% relative abundance" = '#28A48D', 
                             "Sordariomycetes" = "#8569D5",   # Ascomycota
                             "uncl_Ascomycota" = "#71A9F7",   # Ascomycota
                             "Dothideomycetes" = "#C46BAE",   # Ascomycota
                             "Eurotiomycetes" = "#BBE6E4",    # Ascomycota
                             "Lecanoromycetes" = "#4C1036",   # Ascomycota
                             "Glomeromycetes" = "#5E738F",    # Mucoromycota
                             "Agaricomycetes" = "#D1A33D",   # Basidiomycota
                            "uncl_Basidiomycota" = "#60463B",  # Basidiomycota
                            "Atractiellomycetes" = "#4B8153"  # Basidiomycota
))


# Order - Fun
  # sort(unique(dat_Fun.Order.r$Order))

Fun_Order_cols<-(values = c("≤ 2% relative abundance" = '#28A48D', 
                            "Agaricales" = "#D1A33D",   # Basidiomycota Agaricomycetes
                            "Chaetothyriales" = "#BBE6E4",    # Ascomycota Eurotiomycetes
                            "Helotiales" = "#4C1036",   # Ascomycota Lecanoromycetes
                            "Hypocreales" = "#FF9770",  # Ascomycota Sordariomycetes
                            "Pleosporales" = "#C46BAE",   # Ascomycota Dothideomycetes
                            "Sordariales" = "#8569D5",  # Ascomycota Sordariomycetes
                            "uncl_Ascomycota" = "#71A9F7",   # Ascomycota uncl_Ascomycota
                            "uncl_Dothideomycetes" = "#00FFCD",   # Ascomycota Dothideomycetes
                            "uncl_Sordariomycetes" = "#1B1B1E",   # Ascomycota Sordariomycetes
                            "Xylariales" = "#8A7C64"  # Ascomycota Sordariomycetes
))


# Family - Fun
  # sort(unique(dat_Fun.Family.r$Family))
  # Fun_Family_Mean_Abund %>% top_n(11)

Fun_Family_cols<-(values = c("≤ 2% relative abundance" = '#28A48D', 
                            "uncl_Agaricales" = "#D1A33D",   # Basidiomycota Agaricomycetes Agaricales
                            "Marasmiaceae" = "#60463B",   # Basidiomycota Agaricomycetes Agaricales
                            "uncl_Ascomycota" = "#71A9F7",   # Ascomycota uncl_Ascomycota uncl_Ascomycota
                            "Periconiaceae" = "#C46BAE",   # Ascomycota Dothideomycetes Pleosporales
                            "uncl_Pleosporales" = "#493657",   # Ascomycota Dothideomycetes Pleosporales
                            "Nectriaceae" = "#FF9770",  # Ascomycota Sordariomycetes Hypocreales
                            "uncl_Hypocreales" = "#0F7173",  # Ascomycota Sordariomycetes Hypocreales
                            "uncl_Dothideomycetes" = "#00FFCD",   # Ascomycota Dothideomycetes
                            "uncl_Sordariomycetes" = "#1B1B1E",   # Ascomycota Sordariomycetes
                            "Xylariaceae" = "#8A7C64",  # Ascomycota Sordariomycetes Xylariales
                            "uncl_Sordariales" = "#8569D5"    # Ascomycota Sordariomycetes Sordariales
))

Fun_Genus_cols<-(values = c("≤ 1.9% relative abundance" = '#28A48D', 
                             "uncl_Agaricales" = "#D1A33D",   # Basidiomycota Agaricomycetes Agaricales uncl_Agaricales
                             "uncl_Marasmiaceae" = "#60463B",   # Basidiomycota Agaricomycetes Agaricales Marasmiaceae
                             "uncl_Ascomycota" = "#71A9F7",   # Ascomycota uncl_Ascomycota 
                             "Periconia" = "#C46BAE",   # Ascomycota Dothideomycetes Pleosporales Periconiaceae
                             "uncl_Pleosporales" = "#493657",   # Ascomycota Dothideomycetes Pleosporales uncl_Pleosporales
                             "Fusarium" = "#FF9770",  # Ascomycota Sordariomycetes Hypocreales Nectriaceae
                             "uncl_Hypocreales" = "#0F7173",  # Ascomycota Sordariomycetes Hypocreales uncl_Hypocreales
                             "uncl_Dothideomycetes" = "#00FFCD",   # Ascomycota Dothideomycetes uncl_Dothideomycetes
                             "uncl_Sordariomycetes" = "#1B1B1E",   # Ascomycota Sordariomycetes uncl_Sordariomycetes
                             # "" = "#8A7C64",  # Ascomycota Sordariomycetes Xylariales Xylariaceae
                             "uncl_Sordariales" = "#8569D5"    # Ascomycota Sordariomycetes Sordariales uncl_Sordariales
))
                