
setwd("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/code")
# Package ID: knb-lter-sev.332.1 Cataloging System:https://pasta.edirepository.org.
# Data set title: Biogeography of root fungi in grasslands.
# Data set creator:  Jennifer Rudgers - Sevilleta Long-Term Ecological Research Program  and Department of Biology, University of New Mexico 
# Data set creator:  Sam Fox - Division of Biology, Kansas State University 
# Data set creator:  Andrea Porras-Alfaro - Division of Environmental Biology, National Science Foundation and Institute for Environmental Studies, Western Illinois University 
# Data set creator:  Jose Herrera - Office of the Provost, Mercy College 
# Data set creator:  Dylan Kent - Department of Biology, University of New Mexico 
# Data set creator:  Lara Souza - Oklahoma Biological Survey & Department of Microbiology and Plant Biology, University of   Oklahoma 
# Data set creator:  Y. Chung - Departments of Plant Biology and Plant Pathology 
# Data set creator:  Ari Jumpponen - Konza Long-Term Ecological Research Program  and Division of Biology, Kansas State University 
# Contact:  Jennifer Rudgers -  Sevilleta Long-Term Ecological Research Program and Department of Biology, University of New Mexico  - jrudgers@unm.edu
# Contact:    - Information Manager Sevilleta Long-Term Ecological Research Program and Department of Biology, University of New Mexico  - sevim@unm.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu 

# inUrl1  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/999f3c712f60be2f7dd72da67da0275c" 
infile1 <- "../raw_data/knb-lter-sev.332.2/2DNAR10NMDS.csv"
# try(download.file(inUrl1,infile1,method="curl"))
# if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "site",     
                 "species",     
                 "library",     
                 "lat.f",     
                 "gradient",     
                 "specieslat",     
                 "NMS1",     
                 "NMS2"    ), check.names=TRUE)

# unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$sample)!="factor") dt1$sample<- as.factor(dt1$sample)
if (class(dt1$site)!="factor") dt1$site<- as.factor(dt1$site)
if (class(dt1$species)!="factor") dt1$species<- as.factor(dt1$species)
if (class(dt1$library)!="factor") dt1$library<- as.factor(dt1$library)
if (class(dt1$lat.f)!="factor") dt1$lat.f<- as.factor(dt1$lat.f)
if (class(dt1$gradient)!="factor") dt1$gradient<- as.factor(dt1$gradient)
if (class(dt1$specieslat)!="factor") dt1$specieslat<- as.factor(dt1$specieslat)
if (class(dt1$NMS1)=="factor") dt1$NMS1 <-as.numeric(levels(dt1$NMS1))[as.integer(dt1$NMS1) ]               
if (class(dt1$NMS1)=="character") dt1$NMS1 <-as.numeric(dt1$NMS1)
if (class(dt1$NMS2)=="factor") dt1$NMS2 <-as.numeric(levels(dt1$NMS2))[as.integer(dt1$NMS2) ]               
if (class(dt1$NMS2)=="character") dt1$NMS2 <-as.numeric(dt1$NMS2)

# Convert Missing Values to NA for non-dates

dt1$sample <- as.factor(ifelse((trimws(as.character(dt1$sample))==trimws("NA")),NA,as.character(dt1$sample)))
dt1$site <- as.factor(ifelse((trimws(as.character(dt1$site))==trimws("NA")),NA,as.character(dt1$site)))
dt1$species <- as.factor(ifelse((trimws(as.character(dt1$species))==trimws("NA")),NA,as.character(dt1$species)))
dt1$library <- as.factor(ifelse((trimws(as.character(dt1$library))==trimws("NA")),NA,as.character(dt1$library)))
dt1$lat.f <- as.factor(ifelse((trimws(as.character(dt1$lat.f))==trimws("NA")),NA,as.character(dt1$lat.f)))
dt1$gradient <- as.factor(ifelse((trimws(as.character(dt1$gradient))==trimws("NA")),NA,as.character(dt1$gradient)))
dt1$specieslat <- as.factor(ifelse((trimws(as.character(dt1$specieslat))==trimws("NA")),NA,as.character(dt1$specieslat)))
dt1$NMS1 <- ifelse((trimws(as.character(dt1$NMS1))==trimws("NA")),NA,dt1$NMS1)               
suppressWarnings(dt1$NMS1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$NMS1))==as.character(as.numeric("NA"))),NA,dt1$NMS1))
dt1$NMS2 <- ifelse((trimws(as.character(dt1$NMS2))==trimws("NA")),NA,dt1$NMS2)               
suppressWarnings(dt1$NMS2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$NMS2))==as.character(as.numeric("NA"))),NA,dt1$NMS2))


# Here is the structure of the input data frame:
str(dt1)                            
attach(dt1)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(site)
summary(species)
summary(library)
summary(lat.f)
summary(gradient)
summary(specieslat)
summary(NMS1)
summary(NMS2) 
# Get more details on character variables

summary(as.factor(dt1$sample)) 
summary(as.factor(dt1$site)) 
summary(as.factor(dt1$species)) 
summary(as.factor(dt1$library)) 
summary(as.factor(dt1$lat.f)) 
summary(as.factor(dt1$gradient)) 
summary(as.factor(dt1$specieslat))
detach(dt1)               


#inUrl2  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/eaba89a66cd150f11bf2ac9b64721619" 
infile2 <- "../raw_data/knb-lter-sev.332.2/2DNAR10NMDS_centroid.csv"
# try(download.file(inUrl2,infile2,method="curl"))
# if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "species",     
                 "NMS1",     
                 "NMS2",     
                 "se1",     
                 "se2"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$species)!="factor") dt2$species<- as.factor(dt2$species)
if (class(dt2$NMS1)=="factor") dt2$NMS1 <-as.numeric(levels(dt2$NMS1))[as.integer(dt2$NMS1) ]               
if (class(dt2$NMS1)=="character") dt2$NMS1 <-as.numeric(dt2$NMS1)
if (class(dt2$NMS2)=="factor") dt2$NMS2 <-as.numeric(levels(dt2$NMS2))[as.integer(dt2$NMS2) ]               
if (class(dt2$NMS2)=="character") dt2$NMS2 <-as.numeric(dt2$NMS2)
if (class(dt2$se1)=="factor") dt2$se1 <-as.numeric(levels(dt2$se1))[as.integer(dt2$se1) ]               
if (class(dt2$se1)=="character") dt2$se1 <-as.numeric(dt2$se1)
if (class(dt2$se2)=="factor") dt2$se2 <-as.numeric(levels(dt2$se2))[as.integer(dt2$se2) ]               
if (class(dt2$se2)=="character") dt2$se2 <-as.numeric(dt2$se2)

# Convert Missing Values to NA for non-dates

dt2$species <- as.factor(ifelse((trimws(as.character(dt2$species))==trimws("NA")),NA,as.character(dt2$species)))
dt2$NMS1 <- ifelse((trimws(as.character(dt2$NMS1))==trimws("NA")),NA,dt2$NMS1)               
suppressWarnings(dt2$NMS1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$NMS1))==as.character(as.numeric("NA"))),NA,dt2$NMS1))
dt2$NMS2 <- ifelse((trimws(as.character(dt2$NMS2))==trimws("NA")),NA,dt2$NMS2)               
suppressWarnings(dt2$NMS2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$NMS2))==as.character(as.numeric("NA"))),NA,dt2$NMS2))
dt2$se1 <- ifelse((trimws(as.character(dt2$se1))==trimws("NA")),NA,dt2$se1)               
suppressWarnings(dt2$se1 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$se1))==as.character(as.numeric("NA"))),NA,dt2$se1))
dt2$se2 <- ifelse((trimws(as.character(dt2$se2))==trimws("NA")),NA,dt2$se2)               
suppressWarnings(dt2$se2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$se2))==as.character(as.numeric("NA"))),NA,dt2$se2))


# Here is the structure of the input data frame:
str(dt2)                            
attach(dt2)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(species)
summary(NMS1)
summary(NMS2)
summary(se1)
summary(se2) 
# Get more details on character variables

summary(as.factor(dt2$species))
detach(dt2)               


# inUrl3  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/0c902191654bb46e39fa38eaf0d15f8a" 
infile3 <- "../raw_data/knb-lter-sev.332.2/ANGEEnvsum.csv"
# try(download.file(inUrl3,infile3,method="curl"))
# if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "latitude",     
                 "longitude",     
                 "elevation_m",     
                 "GDD2015",     
                 "ppt2015",     
                 "GWC",     
                 "pH",     
                 "ammonium",     
                 "phos",     
                 "SRL",     
                 "SLA",     
                 "herbivory_perc"    ), check.names=TRUE)

# unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$sample)!="factor") dt3$sample<- as.factor(dt3$sample)
if (class(dt3$latitude)=="factor") dt3$latitude <-as.numeric(levels(dt3$latitude))[as.integer(dt3$latitude) ]               
if (class(dt3$latitude)=="character") dt3$latitude <-as.numeric(dt3$latitude)
if (class(dt3$longitude)=="factor") dt3$longitude <-as.numeric(levels(dt3$longitude))[as.integer(dt3$longitude) ]               
if (class(dt3$longitude)=="character") dt3$longitude <-as.numeric(dt3$longitude)
if (class(dt3$elevation_m)=="factor") dt3$elevation_m <-as.numeric(levels(dt3$elevation_m))[as.integer(dt3$elevation_m) ]               
if (class(dt3$elevation_m)=="character") dt3$elevation_m <-as.numeric(dt3$elevation_m)
if (class(dt3$GDD2015)=="factor") dt3$GDD2015 <-as.numeric(levels(dt3$GDD2015))[as.integer(dt3$GDD2015) ]               
if (class(dt3$GDD2015)=="character") dt3$GDD2015 <-as.numeric(dt3$GDD2015)
if (class(dt3$ppt2015)=="factor") dt3$ppt2015 <-as.numeric(levels(dt3$ppt2015))[as.integer(dt3$ppt2015) ]               
if (class(dt3$ppt2015)=="character") dt3$ppt2015 <-as.numeric(dt3$ppt2015)
if (class(dt3$GWC)=="factor") dt3$GWC <-as.numeric(levels(dt3$GWC))[as.integer(dt3$GWC) ]               
if (class(dt3$GWC)=="character") dt3$GWC <-as.numeric(dt3$GWC)
if (class(dt3$pH)=="factor") dt3$pH <-as.numeric(levels(dt3$pH))[as.integer(dt3$pH) ]               
if (class(dt3$pH)=="character") dt3$pH <-as.numeric(dt3$pH)
if (class(dt3$ammonium)=="factor") dt3$ammonium <-as.numeric(levels(dt3$ammonium))[as.integer(dt3$ammonium) ]               
if (class(dt3$ammonium)=="character") dt3$ammonium <-as.numeric(dt3$ammonium)
if (class(dt3$phos)=="factor") dt3$phos <-as.numeric(levels(dt3$phos))[as.integer(dt3$phos) ]               
if (class(dt3$phos)=="character") dt3$phos <-as.numeric(dt3$phos)
if (class(dt3$SRL)=="factor") dt3$SRL <-as.numeric(levels(dt3$SRL))[as.integer(dt3$SRL) ]               
if (class(dt3$SRL)=="character") dt3$SRL <-as.numeric(dt3$SRL)
if (class(dt3$SLA)=="factor") dt3$SLA <-as.numeric(levels(dt3$SLA))[as.integer(dt3$SLA) ]               
if (class(dt3$SLA)=="character") dt3$SLA <-as.numeric(dt3$SLA)
if (class(dt3$herbivory_perc)=="factor") dt3$herbivory_perc <-as.numeric(levels(dt3$herbivory_perc))[as.integer(dt3$herbivory_perc) ]               
if (class(dt3$herbivory_perc)=="character") dt3$herbivory_perc <-as.numeric(dt3$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt3$sample <- as.factor(ifelse((trimws(as.character(dt3$sample))==trimws("NA")),NA,as.character(dt3$sample)))
dt3$latitude <- ifelse((trimws(as.character(dt3$latitude))==trimws("NA")),NA,dt3$latitude)               
suppressWarnings(dt3$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$latitude))==as.character(as.numeric("NA"))),NA,dt3$latitude))
dt3$longitude <- ifelse((trimws(as.character(dt3$longitude))==trimws("NA")),NA,dt3$longitude)               
suppressWarnings(dt3$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$longitude))==as.character(as.numeric("NA"))),NA,dt3$longitude))
dt3$elevation_m <- ifelse((trimws(as.character(dt3$elevation_m))==trimws("NA")),NA,dt3$elevation_m)               
suppressWarnings(dt3$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$elevation_m))==as.character(as.numeric("NA"))),NA,dt3$elevation_m))
dt3$GDD2015 <- ifelse((trimws(as.character(dt3$GDD2015))==trimws("NA")),NA,dt3$GDD2015)               
suppressWarnings(dt3$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$GDD2015))==as.character(as.numeric("NA"))),NA,dt3$GDD2015))
dt3$ppt2015 <- ifelse((trimws(as.character(dt3$ppt2015))==trimws("NA")),NA,dt3$ppt2015)               
suppressWarnings(dt3$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ppt2015))==as.character(as.numeric("NA"))),NA,dt3$ppt2015))
dt3$GWC <- ifelse((trimws(as.character(dt3$GWC))==trimws("NA")),NA,dt3$GWC)               
suppressWarnings(dt3$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$GWC))==as.character(as.numeric("NA"))),NA,dt3$GWC))
dt3$pH <- ifelse((trimws(as.character(dt3$pH))==trimws("NA")),NA,dt3$pH)               
suppressWarnings(dt3$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$pH))==as.character(as.numeric("NA"))),NA,dt3$pH))
dt3$ammonium <- ifelse((trimws(as.character(dt3$ammonium))==trimws("NA")),NA,dt3$ammonium)               
suppressWarnings(dt3$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$ammonium))==as.character(as.numeric("NA"))),NA,dt3$ammonium))
dt3$phos <- ifelse((trimws(as.character(dt3$phos))==trimws("NA")),NA,dt3$phos)               
suppressWarnings(dt3$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$phos))==as.character(as.numeric("NA"))),NA,dt3$phos))
dt3$SRL <- ifelse((trimws(as.character(dt3$SRL))==trimws("NA")),NA,dt3$SRL)               
suppressWarnings(dt3$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SRL))==as.character(as.numeric("NA"))),NA,dt3$SRL))
dt3$SLA <- ifelse((trimws(as.character(dt3$SLA))==trimws("NA")),NA,dt3$SLA)               
suppressWarnings(dt3$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$SLA))==as.character(as.numeric("NA"))),NA,dt3$SLA))
dt3$herbivory_perc <- ifelse((trimws(as.character(dt3$herbivory_perc))==trimws("NA")),NA,dt3$herbivory_perc)               
suppressWarnings(dt3$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt3$herbivory_perc))


# Here is the structure of the input data frame:
str(dt3)                            
attach(dt3)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt3$sample))
detach(dt3)               


# inUrl4  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/15907d786c62b2de625862b108e67a2f" 
infile4 <- "../raw_data/knb-lter-sev.332.2/ANGEsumOTU.perc_long.csv"
# try(download.file(inUrl4,infile4,method="curl"))
# if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "OTU",     
                 "Percent"    ), check.names=TRUE)

# unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt4$sample)!="factor") dt4$sample<- as.factor(dt4$sample)
if (class(dt4$OTU)!="factor") dt4$OTU<- as.factor(dt4$OTU)
if (class(dt4$Percent)=="factor") dt4$Percent <-as.numeric(levels(dt4$Percent))[as.integer(dt4$Percent) ]               
if (class(dt4$Percent)=="character") dt4$Percent <-as.numeric(dt4$Percent)

# Convert Missing Values to NA for non-dates

dt4$sample <- as.factor(ifelse((trimws(as.character(dt4$sample))==trimws("NA")),NA,as.character(dt4$sample)))
dt4$OTU <- as.factor(ifelse((trimws(as.character(dt4$OTU))==trimws("NA")),NA,as.character(dt4$OTU)))
dt4$Percent <- ifelse((trimws(as.character(dt4$Percent))==trimws("NA")),NA,dt4$Percent)               
suppressWarnings(dt4$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$Percent))==as.character(as.numeric("NA"))),NA,dt4$Percent))


# Here is the structure of the input data frame:
str(dt4)                            
attach(dt4)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt4$sample)) 
summary(as.factor(dt4$OTU))
detach(dt4)               


# inUrl5  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/3ab16670bb5ad808c6269986f96a581c" 
infile5 <- "../raw_data/knb-lter-sev.332.2/BOEREnvsum.csv"
# try(download.file(inUrl5,infile5,method="curl"))
# if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "latitude",     
                 "longitude",     
                 "elevation_m",     
                 "GDD2015",     
                 "ppt2015",     
                 "GWC",     
                 "pH",     
                 "ammonium",     
                 "phos",     
                 "SRL",     
                 "SLA",     
                 "herbivory_perc"    ), check.names=TRUE)

# unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt5$sample)!="factor") dt5$sample<- as.factor(dt5$sample)
if (class(dt5$latitude)=="factor") dt5$latitude <-as.numeric(levels(dt5$latitude))[as.integer(dt5$latitude) ]               
if (class(dt5$latitude)=="character") dt5$latitude <-as.numeric(dt5$latitude)
if (class(dt5$longitude)=="factor") dt5$longitude <-as.numeric(levels(dt5$longitude))[as.integer(dt5$longitude) ]               
if (class(dt5$longitude)=="character") dt5$longitude <-as.numeric(dt5$longitude)
if (class(dt5$elevation_m)=="factor") dt5$elevation_m <-as.numeric(levels(dt5$elevation_m))[as.integer(dt5$elevation_m) ]               
if (class(dt5$elevation_m)=="character") dt5$elevation_m <-as.numeric(dt5$elevation_m)
if (class(dt5$GDD2015)=="factor") dt5$GDD2015 <-as.numeric(levels(dt5$GDD2015))[as.integer(dt5$GDD2015) ]               
if (class(dt5$GDD2015)=="character") dt5$GDD2015 <-as.numeric(dt5$GDD2015)
if (class(dt5$ppt2015)=="factor") dt5$ppt2015 <-as.numeric(levels(dt5$ppt2015))[as.integer(dt5$ppt2015) ]               
if (class(dt5$ppt2015)=="character") dt5$ppt2015 <-as.numeric(dt5$ppt2015)
if (class(dt5$GWC)=="factor") dt5$GWC <-as.numeric(levels(dt5$GWC))[as.integer(dt5$GWC) ]               
if (class(dt5$GWC)=="character") dt5$GWC <-as.numeric(dt5$GWC)
if (class(dt5$pH)=="factor") dt5$pH <-as.numeric(levels(dt5$pH))[as.integer(dt5$pH) ]               
if (class(dt5$pH)=="character") dt5$pH <-as.numeric(dt5$pH)
if (class(dt5$ammonium)=="factor") dt5$ammonium <-as.numeric(levels(dt5$ammonium))[as.integer(dt5$ammonium) ]               
if (class(dt5$ammonium)=="character") dt5$ammonium <-as.numeric(dt5$ammonium)
if (class(dt5$phos)=="factor") dt5$phos <-as.numeric(levels(dt5$phos))[as.integer(dt5$phos) ]               
if (class(dt5$phos)=="character") dt5$phos <-as.numeric(dt5$phos)
if (class(dt5$SRL)=="factor") dt5$SRL <-as.numeric(levels(dt5$SRL))[as.integer(dt5$SRL) ]               
if (class(dt5$SRL)=="character") dt5$SRL <-as.numeric(dt5$SRL)
if (class(dt5$SLA)=="factor") dt5$SLA <-as.numeric(levels(dt5$SLA))[as.integer(dt5$SLA) ]               
if (class(dt5$SLA)=="character") dt5$SLA <-as.numeric(dt5$SLA)
if (class(dt5$herbivory_perc)=="factor") dt5$herbivory_perc <-as.numeric(levels(dt5$herbivory_perc))[as.integer(dt5$herbivory_perc) ]               
if (class(dt5$herbivory_perc)=="character") dt5$herbivory_perc <-as.numeric(dt5$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt5$sample <- as.factor(ifelse((trimws(as.character(dt5$sample))==trimws("NA")),NA,as.character(dt5$sample)))
dt5$latitude <- ifelse((trimws(as.character(dt5$latitude))==trimws("NA")),NA,dt5$latitude)               
suppressWarnings(dt5$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$latitude))==as.character(as.numeric("NA"))),NA,dt5$latitude))
dt5$longitude <- ifelse((trimws(as.character(dt5$longitude))==trimws("NA")),NA,dt5$longitude)               
suppressWarnings(dt5$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$longitude))==as.character(as.numeric("NA"))),NA,dt5$longitude))
dt5$elevation_m <- ifelse((trimws(as.character(dt5$elevation_m))==trimws("NA")),NA,dt5$elevation_m)               
suppressWarnings(dt5$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$elevation_m))==as.character(as.numeric("NA"))),NA,dt5$elevation_m))
dt5$GDD2015 <- ifelse((trimws(as.character(dt5$GDD2015))==trimws("NA")),NA,dt5$GDD2015)               
suppressWarnings(dt5$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$GDD2015))==as.character(as.numeric("NA"))),NA,dt5$GDD2015))
dt5$ppt2015 <- ifelse((trimws(as.character(dt5$ppt2015))==trimws("NA")),NA,dt5$ppt2015)               
suppressWarnings(dt5$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$ppt2015))==as.character(as.numeric("NA"))),NA,dt5$ppt2015))
dt5$GWC <- ifelse((trimws(as.character(dt5$GWC))==trimws("NA")),NA,dt5$GWC)               
suppressWarnings(dt5$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$GWC))==as.character(as.numeric("NA"))),NA,dt5$GWC))
dt5$pH <- ifelse((trimws(as.character(dt5$pH))==trimws("NA")),NA,dt5$pH)               
suppressWarnings(dt5$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$pH))==as.character(as.numeric("NA"))),NA,dt5$pH))
dt5$ammonium <- ifelse((trimws(as.character(dt5$ammonium))==trimws("NA")),NA,dt5$ammonium)               
suppressWarnings(dt5$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$ammonium))==as.character(as.numeric("NA"))),NA,dt5$ammonium))
dt5$phos <- ifelse((trimws(as.character(dt5$phos))==trimws("NA")),NA,dt5$phos)               
suppressWarnings(dt5$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$phos))==as.character(as.numeric("NA"))),NA,dt5$phos))
dt5$SRL <- ifelse((trimws(as.character(dt5$SRL))==trimws("NA")),NA,dt5$SRL)               
suppressWarnings(dt5$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SRL))==as.character(as.numeric("NA"))),NA,dt5$SRL))
dt5$SLA <- ifelse((trimws(as.character(dt5$SLA))==trimws("NA")),NA,dt5$SLA)               
suppressWarnings(dt5$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$SLA))==as.character(as.numeric("NA"))),NA,dt5$SLA))
dt5$herbivory_perc <- ifelse((trimws(as.character(dt5$herbivory_perc))==trimws("NA")),NA,dt5$herbivory_perc)               
suppressWarnings(dt5$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt5$herbivory_perc))


# Here is the structure of the input data frame:
str(dt5)                            
attach(dt5)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt5$sample))
detach(dt5)               


# inUrl6  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/80b04cbb1dd105ef3bbbc94d8f2b77fb" 
infile6 <- "../raw_data/knb-lter-sev.332.2/BOERsumOTU.perc_long.csv"
# try(download.file(inUrl6,infile6,method="curl"))
# if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "OTU",     
                 "Percent"    ), check.names=TRUE)

# unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$sample)!="factor") dt6$sample<- as.factor(dt6$sample)
if (class(dt6$OTU)!="factor") dt6$OTU<- as.factor(dt6$OTU)
if (class(dt6$Percent)=="factor") dt6$Percent <-as.numeric(levels(dt6$Percent))[as.integer(dt6$Percent) ]               
if (class(dt6$Percent)=="character") dt6$Percent <-as.numeric(dt6$Percent)

# Convert Missing Values to NA for non-dates

dt6$sample <- as.factor(ifelse((trimws(as.character(dt6$sample))==trimws("NA")),NA,as.character(dt6$sample)))
dt6$OTU <- as.factor(ifelse((trimws(as.character(dt6$OTU))==trimws("NA")),NA,as.character(dt6$OTU)))
dt6$Percent <- ifelse((trimws(as.character(dt6$Percent))==trimws("NA")),NA,dt6$Percent)               
suppressWarnings(dt6$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt6$Percent))==as.character(as.numeric("NA"))),NA,dt6$Percent))


# Here is the structure of the input data frame:
str(dt6)                            
attach(dt6)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt6$sample)) 
summary(as.factor(dt6$OTU))
detach(dt6)               


# inUrl7  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/deebcc63046f93d380ec291edaa44a50" 
infile7 <- "../raw_data/knb-lter-sev.332.2/BOGREnvsum.csv"
# try(download.file(inUrl7,infile7,method="curl"))
# if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")


dt7 <-read.csv(infile7,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "latitude",     
                 "longitude",     
                 "elevation_m",     
                 "GDD2015",     
                 "ppt2015",     
                 "GWC",     
                 "pH",     
                 "ammonium",     
                 "phos",     
                 "SRL",     
                 "SLA",     
                 "herbivory_perc"    ), check.names=TRUE)

# unlink(infile7)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt7$sample)!="factor") dt7$sample<- as.factor(dt7$sample)
if (class(dt7$latitude)=="factor") dt7$latitude <-as.numeric(levels(dt7$latitude))[as.integer(dt7$latitude) ]               
if (class(dt7$latitude)=="character") dt7$latitude <-as.numeric(dt7$latitude)
if (class(dt7$longitude)=="factor") dt7$longitude <-as.numeric(levels(dt7$longitude))[as.integer(dt7$longitude) ]               
if (class(dt7$longitude)=="character") dt7$longitude <-as.numeric(dt7$longitude)
if (class(dt7$elevation_m)=="factor") dt7$elevation_m <-as.numeric(levels(dt7$elevation_m))[as.integer(dt7$elevation_m) ]               
if (class(dt7$elevation_m)=="character") dt7$elevation_m <-as.numeric(dt7$elevation_m)
if (class(dt7$GDD2015)=="factor") dt7$GDD2015 <-as.numeric(levels(dt7$GDD2015))[as.integer(dt7$GDD2015) ]               
if (class(dt7$GDD2015)=="character") dt7$GDD2015 <-as.numeric(dt7$GDD2015)
if (class(dt7$ppt2015)=="factor") dt7$ppt2015 <-as.numeric(levels(dt7$ppt2015))[as.integer(dt7$ppt2015) ]               
if (class(dt7$ppt2015)=="character") dt7$ppt2015 <-as.numeric(dt7$ppt2015)
if (class(dt7$GWC)=="factor") dt7$GWC <-as.numeric(levels(dt7$GWC))[as.integer(dt7$GWC) ]               
if (class(dt7$GWC)=="character") dt7$GWC <-as.numeric(dt7$GWC)
if (class(dt7$pH)=="factor") dt7$pH <-as.numeric(levels(dt7$pH))[as.integer(dt7$pH) ]               
if (class(dt7$pH)=="character") dt7$pH <-as.numeric(dt7$pH)
if (class(dt7$ammonium)=="factor") dt7$ammonium <-as.numeric(levels(dt7$ammonium))[as.integer(dt7$ammonium) ]               
if (class(dt7$ammonium)=="character") dt7$ammonium <-as.numeric(dt7$ammonium)
if (class(dt7$phos)=="factor") dt7$phos <-as.numeric(levels(dt7$phos))[as.integer(dt7$phos) ]               
if (class(dt7$phos)=="character") dt7$phos <-as.numeric(dt7$phos)
if (class(dt7$SRL)=="factor") dt7$SRL <-as.numeric(levels(dt7$SRL))[as.integer(dt7$SRL) ]               
if (class(dt7$SRL)=="character") dt7$SRL <-as.numeric(dt7$SRL)
if (class(dt7$SLA)=="factor") dt7$SLA <-as.numeric(levels(dt7$SLA))[as.integer(dt7$SLA) ]               
if (class(dt7$SLA)=="character") dt7$SLA <-as.numeric(dt7$SLA)
if (class(dt7$herbivory_perc)=="factor") dt7$herbivory_perc <-as.numeric(levels(dt7$herbivory_perc))[as.integer(dt7$herbivory_perc) ]               
if (class(dt7$herbivory_perc)=="character") dt7$herbivory_perc <-as.numeric(dt7$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt7$sample <- as.factor(ifelse((trimws(as.character(dt7$sample))==trimws("NA")),NA,as.character(dt7$sample)))
dt7$latitude <- ifelse((trimws(as.character(dt7$latitude))==trimws("NA")),NA,dt7$latitude)               
suppressWarnings(dt7$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$latitude))==as.character(as.numeric("NA"))),NA,dt7$latitude))
dt7$longitude <- ifelse((trimws(as.character(dt7$longitude))==trimws("NA")),NA,dt7$longitude)               
suppressWarnings(dt7$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$longitude))==as.character(as.numeric("NA"))),NA,dt7$longitude))
dt7$elevation_m <- ifelse((trimws(as.character(dt7$elevation_m))==trimws("NA")),NA,dt7$elevation_m)               
suppressWarnings(dt7$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$elevation_m))==as.character(as.numeric("NA"))),NA,dt7$elevation_m))
dt7$GDD2015 <- ifelse((trimws(as.character(dt7$GDD2015))==trimws("NA")),NA,dt7$GDD2015)               
suppressWarnings(dt7$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$GDD2015))==as.character(as.numeric("NA"))),NA,dt7$GDD2015))
dt7$ppt2015 <- ifelse((trimws(as.character(dt7$ppt2015))==trimws("NA")),NA,dt7$ppt2015)               
suppressWarnings(dt7$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$ppt2015))==as.character(as.numeric("NA"))),NA,dt7$ppt2015))
dt7$GWC <- ifelse((trimws(as.character(dt7$GWC))==trimws("NA")),NA,dt7$GWC)               
suppressWarnings(dt7$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$GWC))==as.character(as.numeric("NA"))),NA,dt7$GWC))
dt7$pH <- ifelse((trimws(as.character(dt7$pH))==trimws("NA")),NA,dt7$pH)               
suppressWarnings(dt7$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$pH))==as.character(as.numeric("NA"))),NA,dt7$pH))
dt7$ammonium <- ifelse((trimws(as.character(dt7$ammonium))==trimws("NA")),NA,dt7$ammonium)               
suppressWarnings(dt7$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$ammonium))==as.character(as.numeric("NA"))),NA,dt7$ammonium))
dt7$phos <- ifelse((trimws(as.character(dt7$phos))==trimws("NA")),NA,dt7$phos)               
suppressWarnings(dt7$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$phos))==as.character(as.numeric("NA"))),NA,dt7$phos))
dt7$SRL <- ifelse((trimws(as.character(dt7$SRL))==trimws("NA")),NA,dt7$SRL)               
suppressWarnings(dt7$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SRL))==as.character(as.numeric("NA"))),NA,dt7$SRL))
dt7$SLA <- ifelse((trimws(as.character(dt7$SLA))==trimws("NA")),NA,dt7$SLA)               
suppressWarnings(dt7$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$SLA))==as.character(as.numeric("NA"))),NA,dt7$SLA))
dt7$herbivory_perc <- ifelse((trimws(as.character(dt7$herbivory_perc))==trimws("NA")),NA,dt7$herbivory_perc)               
suppressWarnings(dt7$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt7$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt7$herbivory_perc))


# Here is the structure of the input data frame:
str(dt7)                            
attach(dt7)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt7$sample))
detach(dt7)               


# inUrl8  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/0aac2888f66ad7a3fb86673242d1fe0b" 
infile8 <- "../raw_data/knb-lter-sev.332.2/BOGRsumOTU.perc_long.csv"
# try(download.file(inUrl8,infile8,method="curl"))
# if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")


dt8 <-read.csv(infile8,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "OTU",     
                 "Percent"    ), check.names=TRUE)

# unlink(infile8)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt8$sample)!="factor") dt8$sample<- as.factor(dt8$sample)
if (class(dt8$OTU)!="factor") dt8$OTU<- as.factor(dt8$OTU)
if (class(dt8$Percent)=="factor") dt8$Percent <-as.numeric(levels(dt8$Percent))[as.integer(dt8$Percent) ]               
if (class(dt8$Percent)=="character") dt8$Percent <-as.numeric(dt8$Percent)

# Convert Missing Values to NA for non-dates

dt8$sample <- as.factor(ifelse((trimws(as.character(dt8$sample))==trimws("NA")),NA,as.character(dt8$sample)))
dt8$OTU <- as.factor(ifelse((trimws(as.character(dt8$OTU))==trimws("NA")),NA,as.character(dt8$OTU)))
dt8$Percent <- ifelse((trimws(as.character(dt8$Percent))==trimws("NA")),NA,dt8$Percent)               
suppressWarnings(dt8$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$Percent))==as.character(as.numeric("NA"))),NA,dt8$Percent))


# Here is the structure of the input data frame:
str(dt8)                            
attach(dt8)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt8$sample)) 
summary(as.factor(dt8$OTU))
detach(dt8)               


# inUrl9  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/c0ada07f4ea6586a8a79fa9a86b86302" 
infile9 <- "../raw_data/knb-lter-sev.332.2/BUDAEnvsum.csv"
# try(download.file(inUrl9,infile9,method="curl"))
# if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")


dt9 <-read.csv(infile9,header=F 
               ,skip=1
               ,sep=","  
               ,quot='"' 
               , col.names=c(
                 "sample",     
                 "latitude",     
                 "longitude",     
                 "elevation_m",     
                 "GDD2015",     
                 "ppt2015",     
                 "GWC",     
                 "pH",     
                 "ammonium",     
                 "phos",     
                 "SRL",     
                 "SLA",     
                 "herbivory_perc"    ), check.names=TRUE)

# unlink(infile9)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt9$sample)!="factor") dt9$sample<- as.factor(dt9$sample)
if (class(dt9$latitude)=="factor") dt9$latitude <-as.numeric(levels(dt9$latitude))[as.integer(dt9$latitude) ]               
if (class(dt9$latitude)=="character") dt9$latitude <-as.numeric(dt9$latitude)
if (class(dt9$longitude)=="factor") dt9$longitude <-as.numeric(levels(dt9$longitude))[as.integer(dt9$longitude) ]               
if (class(dt9$longitude)=="character") dt9$longitude <-as.numeric(dt9$longitude)
if (class(dt9$elevation_m)=="factor") dt9$elevation_m <-as.numeric(levels(dt9$elevation_m))[as.integer(dt9$elevation_m) ]               
if (class(dt9$elevation_m)=="character") dt9$elevation_m <-as.numeric(dt9$elevation_m)
if (class(dt9$GDD2015)=="factor") dt9$GDD2015 <-as.numeric(levels(dt9$GDD2015))[as.integer(dt9$GDD2015) ]               
if (class(dt9$GDD2015)=="character") dt9$GDD2015 <-as.numeric(dt9$GDD2015)
if (class(dt9$ppt2015)=="factor") dt9$ppt2015 <-as.numeric(levels(dt9$ppt2015))[as.integer(dt9$ppt2015) ]               
if (class(dt9$ppt2015)=="character") dt9$ppt2015 <-as.numeric(dt9$ppt2015)
if (class(dt9$GWC)=="factor") dt9$GWC <-as.numeric(levels(dt9$GWC))[as.integer(dt9$GWC) ]               
if (class(dt9$GWC)=="character") dt9$GWC <-as.numeric(dt9$GWC)
if (class(dt9$pH)=="factor") dt9$pH <-as.numeric(levels(dt9$pH))[as.integer(dt9$pH) ]               
if (class(dt9$pH)=="character") dt9$pH <-as.numeric(dt9$pH)
if (class(dt9$ammonium)=="factor") dt9$ammonium <-as.numeric(levels(dt9$ammonium))[as.integer(dt9$ammonium) ]               
if (class(dt9$ammonium)=="character") dt9$ammonium <-as.numeric(dt9$ammonium)
if (class(dt9$phos)=="factor") dt9$phos <-as.numeric(levels(dt9$phos))[as.integer(dt9$phos) ]               
if (class(dt9$phos)=="character") dt9$phos <-as.numeric(dt9$phos)
if (class(dt9$SRL)=="factor") dt9$SRL <-as.numeric(levels(dt9$SRL))[as.integer(dt9$SRL) ]               
if (class(dt9$SRL)=="character") dt9$SRL <-as.numeric(dt9$SRL)
if (class(dt9$SLA)=="factor") dt9$SLA <-as.numeric(levels(dt9$SLA))[as.integer(dt9$SLA) ]               
if (class(dt9$SLA)=="character") dt9$SLA <-as.numeric(dt9$SLA)
if (class(dt9$herbivory_perc)=="factor") dt9$herbivory_perc <-as.numeric(levels(dt9$herbivory_perc))[as.integer(dt9$herbivory_perc) ]               
if (class(dt9$herbivory_perc)=="character") dt9$herbivory_perc <-as.numeric(dt9$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt9$sample <- as.factor(ifelse((trimws(as.character(dt9$sample))==trimws("NA")),NA,as.character(dt9$sample)))
dt9$latitude <- ifelse((trimws(as.character(dt9$latitude))==trimws("NA")),NA,dt9$latitude)               
suppressWarnings(dt9$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$latitude))==as.character(as.numeric("NA"))),NA,dt9$latitude))
dt9$longitude <- ifelse((trimws(as.character(dt9$longitude))==trimws("NA")),NA,dt9$longitude)               
suppressWarnings(dt9$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$longitude))==as.character(as.numeric("NA"))),NA,dt9$longitude))
dt9$elevation_m <- ifelse((trimws(as.character(dt9$elevation_m))==trimws("NA")),NA,dt9$elevation_m)               
suppressWarnings(dt9$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$elevation_m))==as.character(as.numeric("NA"))),NA,dt9$elevation_m))
dt9$GDD2015 <- ifelse((trimws(as.character(dt9$GDD2015))==trimws("NA")),NA,dt9$GDD2015)               
suppressWarnings(dt9$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$GDD2015))==as.character(as.numeric("NA"))),NA,dt9$GDD2015))
dt9$ppt2015 <- ifelse((trimws(as.character(dt9$ppt2015))==trimws("NA")),NA,dt9$ppt2015)               
suppressWarnings(dt9$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$ppt2015))==as.character(as.numeric("NA"))),NA,dt9$ppt2015))
dt9$GWC <- ifelse((trimws(as.character(dt9$GWC))==trimws("NA")),NA,dt9$GWC)               
suppressWarnings(dt9$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$GWC))==as.character(as.numeric("NA"))),NA,dt9$GWC))
dt9$pH <- ifelse((trimws(as.character(dt9$pH))==trimws("NA")),NA,dt9$pH)               
suppressWarnings(dt9$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$pH))==as.character(as.numeric("NA"))),NA,dt9$pH))
dt9$ammonium <- ifelse((trimws(as.character(dt9$ammonium))==trimws("NA")),NA,dt9$ammonium)               
suppressWarnings(dt9$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$ammonium))==as.character(as.numeric("NA"))),NA,dt9$ammonium))
dt9$phos <- ifelse((trimws(as.character(dt9$phos))==trimws("NA")),NA,dt9$phos)               
suppressWarnings(dt9$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$phos))==as.character(as.numeric("NA"))),NA,dt9$phos))
dt9$SRL <- ifelse((trimws(as.character(dt9$SRL))==trimws("NA")),NA,dt9$SRL)               
suppressWarnings(dt9$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$SRL))==as.character(as.numeric("NA"))),NA,dt9$SRL))
dt9$SLA <- ifelse((trimws(as.character(dt9$SLA))==trimws("NA")),NA,dt9$SLA)               
suppressWarnings(dt9$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$SLA))==as.character(as.numeric("NA"))),NA,dt9$SLA))
dt9$herbivory_perc <- ifelse((trimws(as.character(dt9$herbivory_perc))==trimws("NA")),NA,dt9$herbivory_perc)               
suppressWarnings(dt9$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt9$herbivory_perc))


# Here is the structure of the input data frame:
str(dt9)                            
attach(dt9)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt9$sample))
detach(dt9)               


# inUrl10  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/ecf69f3a9f3839324d77a06cb9bc35ed" 
infile10 <- "../raw_data/knb-lter-sev.332.2/BUDAsumOTU.perc_long.csv"
# try(download.file(inUrl10,infile10,method="curl"))
# if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


dt10 <-read.csv(infile10,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "OTU",     
                  "Percent"    ), check.names=TRUE)

# unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt10$sample)!="factor") dt10$sample<- as.factor(dt10$sample)
if (class(dt10$OTU)!="factor") dt10$OTU<- as.factor(dt10$OTU)
if (class(dt10$Percent)=="factor") dt10$Percent <-as.numeric(levels(dt10$Percent))[as.integer(dt10$Percent) ]               
if (class(dt10$Percent)=="character") dt10$Percent <-as.numeric(dt10$Percent)

# Convert Missing Values to NA for non-dates

dt10$sample <- as.factor(ifelse((trimws(as.character(dt10$sample))==trimws("NA")),NA,as.character(dt10$sample)))
dt10$OTU <- as.factor(ifelse((trimws(as.character(dt10$OTU))==trimws("NA")),NA,as.character(dt10$OTU)))
dt10$Percent <- ifelse((trimws(as.character(dt10$Percent))==trimws("NA")),NA,dt10$Percent)               
suppressWarnings(dt10$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$Percent))==as.character(as.numeric("NA"))),NA,dt10$Percent))


# Here is the structure of the input data frame:
str(dt10)                            
attach(dt10)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt10$sample)) 
summary(as.factor(dt10$OTU))
detach(dt10)               


# inUrl11  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/a52264a3789db07130919830f1f6680e" 
infile11 <- "../raw_data/knb-lter-sev.332.2/NAR_Latitude_Points.csv"
# try(download.file(inUrl11,infile11,method="curl"))
# if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")


dt11 <-read.csv(infile11,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "recno",     
                  "species",     
                  "code",     
                  "site",     
                  "date_collected",     
                  "latitude",     
                  "longitude",     
                  "elevation_m"    ), check.names=TRUE)

# unlink(infile11)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt11$recno)!="factor") dt11$recno<- as.factor(dt11$recno)
if (class(dt11$species)!="factor") dt11$species<- as.factor(dt11$species)
if (class(dt11$code)!="factor") dt11$code<- as.factor(dt11$code)
if (class(dt11$site)!="factor") dt11$site<- as.factor(dt11$site)                                   
# attempting to convert dt11$date_collected dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp11date_collected<-as.Date(dt11$date_collected,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp11date_collected) == length(tmp11date_collected[!is.na(tmp11date_collected)])){dt11$date_collected <- tmp11date_collected } else {print("Date conversion failed for dt11$date_collected. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp11date_collected) 
if (class(dt11$latitude)=="factor") dt11$latitude <-as.numeric(levels(dt11$latitude))[as.integer(dt11$latitude) ]               
if (class(dt11$latitude)=="character") dt11$latitude <-as.numeric(dt11$latitude)
if (class(dt11$longitude)=="factor") dt11$longitude <-as.numeric(levels(dt11$longitude))[as.integer(dt11$longitude) ]               
if (class(dt11$longitude)=="character") dt11$longitude <-as.numeric(dt11$longitude)
if (class(dt11$elevation_m)=="factor") dt11$elevation_m <-as.numeric(levels(dt11$elevation_m))[as.integer(dt11$elevation_m) ]               
if (class(dt11$elevation_m)=="character") dt11$elevation_m <-as.numeric(dt11$elevation_m)

# Convert Missing Values to NA for non-dates

dt11$recno <- as.factor(ifelse((trimws(as.character(dt11$recno))==trimws("NA")),NA,as.character(dt11$recno)))
dt11$species <- as.factor(ifelse((trimws(as.character(dt11$species))==trimws("NA")),NA,as.character(dt11$species)))
dt11$code <- as.factor(ifelse((trimws(as.character(dt11$code))==trimws("NA")),NA,as.character(dt11$code)))
dt11$site <- as.factor(ifelse((trimws(as.character(dt11$site))==trimws("NA")),NA,as.character(dt11$site)))
dt11$latitude <- ifelse((trimws(as.character(dt11$latitude))==trimws("NA")),NA,dt11$latitude)               
suppressWarnings(dt11$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$latitude))==as.character(as.numeric("NA"))),NA,dt11$latitude))
dt11$longitude <- ifelse((trimws(as.character(dt11$longitude))==trimws("NA")),NA,dt11$longitude)               
suppressWarnings(dt11$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$longitude))==as.character(as.numeric("NA"))),NA,dt11$longitude))
dt11$elevation_m <- ifelse((trimws(as.character(dt11$elevation_m))==trimws("NA")),NA,dt11$elevation_m)               
suppressWarnings(dt11$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$elevation_m))==as.character(as.numeric("NA"))),NA,dt11$elevation_m))


# Here is the structure of the input data frame:
str(dt11)                            
attach(dt11)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(recno)
summary(species)
summary(code)
summary(site)
summary(date_collected)
summary(latitude)
summary(longitude)
summary(elevation_m) 
# Get more details on character variables

summary(as.factor(dt11$recno)) 
summary(as.factor(dt11$species)) 
summary(as.factor(dt11$code)) 
summary(as.factor(dt11$site))
detach(dt11)               


# inUrl12  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/70f7ad222c75243454dae92513431966" 
infile12 <- "../raw_data/knb-lter-sev.332.2/NAR_Latitude_SiteXSpecies.csv"
# try(download.file(inUrl12,infile12,method="curl"))
# if (is.na(file.size(infile12))) download.file(inUrl12,infile12,method="auto")


dt12 <-read.csv(infile12,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "recno",     
                  "code",     
                  "species",     
                  "site_species",     
                  "site_loc",     
                  "site",     
                  "lat.f",     
                  "gradient",     
                  "survey_type",     
                  "location",     
                  "date_collected",     
                  "julianday",     
                  "coll_GDD",     
                  "latitude",     
                  "longitude",     
                  "elevation_m",     
                  "GDD30yr",     
                  "GDD3yr",     
                  "GDD2015",     
                  "ppt30yr",     
                  "ppt3yr",     
                  "ppt2015",     
                  "soil_moisture",     
                  "GWC",     
                  "perc_moisture",     
                  "pH",     
                  "phos",     
                  "ammonium",     
                  "nitrate",     
                  "SOM",     
                  "herbivory_perc",     
                  "avg_SLA",     
                  "avg_SRL"    ), check.names=TRUE)

# unlink(infile12)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt12$recno)!="factor") dt12$recno<- as.factor(dt12$recno)
if (class(dt12$code)!="factor") dt12$code<- as.factor(dt12$code)
if (class(dt12$species)!="factor") dt12$species<- as.factor(dt12$species)
if (class(dt12$site_species)!="factor") dt12$site_species<- as.factor(dt12$site_species)
if (class(dt12$site_loc)!="factor") dt12$site_loc<- as.factor(dt12$site_loc)
if (class(dt12$site)!="factor") dt12$site<- as.factor(dt12$site)
if (class(dt12$lat.f)!="factor") dt12$lat.f<- as.factor(dt12$lat.f)
if (class(dt12$gradient)!="factor") dt12$gradient<- as.factor(dt12$gradient)
if (class(dt12$survey_type)!="factor") dt12$survey_type<- as.factor(dt12$survey_type)
if (class(dt12$location)!="factor") dt12$location<- as.factor(dt12$location)                                   
# attempting to convert dt12$date_collected dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp12date_collected<-as.Date(dt12$date_collected,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp12date_collected) == length(tmp12date_collected[!is.na(tmp12date_collected)])){dt12$date_collected <- tmp12date_collected } else {print("Date conversion failed for dt12$date_collected. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp12date_collected) 
if (class(dt12$julianday)=="factor") dt12$julianday <-as.numeric(levels(dt12$julianday))[as.integer(dt12$julianday) ]               
if (class(dt12$julianday)=="character") dt12$julianday <-as.numeric(dt12$julianday)
if (class(dt12$coll_GDD)=="factor") dt12$coll_GDD <-as.numeric(levels(dt12$coll_GDD))[as.integer(dt12$coll_GDD) ]               
if (class(dt12$coll_GDD)=="character") dt12$coll_GDD <-as.numeric(dt12$coll_GDD)
if (class(dt12$latitude)=="factor") dt12$latitude <-as.numeric(levels(dt12$latitude))[as.integer(dt12$latitude) ]               
if (class(dt12$latitude)=="character") dt12$latitude <-as.numeric(dt12$latitude)
if (class(dt12$longitude)=="factor") dt12$longitude <-as.numeric(levels(dt12$longitude))[as.integer(dt12$longitude) ]               
if (class(dt12$longitude)=="character") dt12$longitude <-as.numeric(dt12$longitude)
if (class(dt12$elevation_m)=="factor") dt12$elevation_m <-as.numeric(levels(dt12$elevation_m))[as.integer(dt12$elevation_m) ]               
if (class(dt12$elevation_m)=="character") dt12$elevation_m <-as.numeric(dt12$elevation_m)
if (class(dt12$GDD30yr)=="factor") dt12$GDD30yr <-as.numeric(levels(dt12$GDD30yr))[as.integer(dt12$GDD30yr) ]               
if (class(dt12$GDD30yr)=="character") dt12$GDD30yr <-as.numeric(dt12$GDD30yr)
if (class(dt12$GDD3yr)=="factor") dt12$GDD3yr <-as.numeric(levels(dt12$GDD3yr))[as.integer(dt12$GDD3yr) ]               
if (class(dt12$GDD3yr)=="character") dt12$GDD3yr <-as.numeric(dt12$GDD3yr)
if (class(dt12$GDD2015)=="factor") dt12$GDD2015 <-as.numeric(levels(dt12$GDD2015))[as.integer(dt12$GDD2015) ]               
if (class(dt12$GDD2015)=="character") dt12$GDD2015 <-as.numeric(dt12$GDD2015)
if (class(dt12$ppt30yr)=="factor") dt12$ppt30yr <-as.numeric(levels(dt12$ppt30yr))[as.integer(dt12$ppt30yr) ]               
if (class(dt12$ppt30yr)=="character") dt12$ppt30yr <-as.numeric(dt12$ppt30yr)
if (class(dt12$ppt3yr)=="factor") dt12$ppt3yr <-as.numeric(levels(dt12$ppt3yr))[as.integer(dt12$ppt3yr) ]               
if (class(dt12$ppt3yr)=="character") dt12$ppt3yr <-as.numeric(dt12$ppt3yr)
if (class(dt12$ppt2015)=="factor") dt12$ppt2015 <-as.numeric(levels(dt12$ppt2015))[as.integer(dt12$ppt2015) ]               
if (class(dt12$ppt2015)=="character") dt12$ppt2015 <-as.numeric(dt12$ppt2015)
if (class(dt12$soil_moisture)=="factor") dt12$soil_moisture <-as.numeric(levels(dt12$soil_moisture))[as.integer(dt12$soil_moisture) ]               
if (class(dt12$soil_moisture)=="character") dt12$soil_moisture <-as.numeric(dt12$soil_moisture)
if (class(dt12$GWC)=="factor") dt12$GWC <-as.numeric(levels(dt12$GWC))[as.integer(dt12$GWC) ]               
if (class(dt12$GWC)=="character") dt12$GWC <-as.numeric(dt12$GWC)
if (class(dt12$perc_moisture)=="factor") dt12$perc_moisture <-as.numeric(levels(dt12$perc_moisture))[as.integer(dt12$perc_moisture) ]               
if (class(dt12$perc_moisture)=="character") dt12$perc_moisture <-as.numeric(dt12$perc_moisture)
if (class(dt12$pH)=="factor") dt12$pH <-as.numeric(levels(dt12$pH))[as.integer(dt12$pH) ]               
if (class(dt12$pH)=="character") dt12$pH <-as.numeric(dt12$pH)
if (class(dt12$phos)=="factor") dt12$phos <-as.numeric(levels(dt12$phos))[as.integer(dt12$phos) ]               
if (class(dt12$phos)=="character") dt12$phos <-as.numeric(dt12$phos)
if (class(dt12$ammonium)=="factor") dt12$ammonium <-as.numeric(levels(dt12$ammonium))[as.integer(dt12$ammonium) ]               
if (class(dt12$ammonium)=="character") dt12$ammonium <-as.numeric(dt12$ammonium)
if (class(dt12$nitrate)=="factor") dt12$nitrate <-as.numeric(levels(dt12$nitrate))[as.integer(dt12$nitrate) ]               
if (class(dt12$nitrate)=="character") dt12$nitrate <-as.numeric(dt12$nitrate)
if (class(dt12$SOM)=="factor") dt12$SOM <-as.numeric(levels(dt12$SOM))[as.integer(dt12$SOM) ]               
if (class(dt12$SOM)=="character") dt12$SOM <-as.numeric(dt12$SOM)
if (class(dt12$herbivory_perc)=="factor") dt12$herbivory_perc <-as.numeric(levels(dt12$herbivory_perc))[as.integer(dt12$herbivory_perc) ]               
if (class(dt12$herbivory_perc)=="character") dt12$herbivory_perc <-as.numeric(dt12$herbivory_perc)
if (class(dt12$avg_SLA)=="factor") dt12$avg_SLA <-as.numeric(levels(dt12$avg_SLA))[as.integer(dt12$avg_SLA) ]               
if (class(dt12$avg_SLA)=="character") dt12$avg_SLA <-as.numeric(dt12$avg_SLA)
if (class(dt12$avg_SRL)=="factor") dt12$avg_SRL <-as.numeric(levels(dt12$avg_SRL))[as.integer(dt12$avg_SRL) ]               
if (class(dt12$avg_SRL)=="character") dt12$avg_SRL <-as.numeric(dt12$avg_SRL)

# Convert Missing Values to NA for non-dates

dt12$recno <- as.factor(ifelse((trimws(as.character(dt12$recno))==trimws("NA")),NA,as.character(dt12$recno)))
dt12$code <- as.factor(ifelse((trimws(as.character(dt12$code))==trimws("NA")),NA,as.character(dt12$code)))
dt12$species <- as.factor(ifelse((trimws(as.character(dt12$species))==trimws("NA")),NA,as.character(dt12$species)))
dt12$site_species <- as.factor(ifelse((trimws(as.character(dt12$site_species))==trimws("NA")),NA,as.character(dt12$site_species)))
dt12$site_loc <- as.factor(ifelse((trimws(as.character(dt12$site_loc))==trimws("NA")),NA,as.character(dt12$site_loc)))
dt12$site <- as.factor(ifelse((trimws(as.character(dt12$site))==trimws("NA")),NA,as.character(dt12$site)))
dt12$lat.f <- as.factor(ifelse((trimws(as.character(dt12$lat.f))==trimws("NA")),NA,as.character(dt12$lat.f)))
dt12$gradient <- as.factor(ifelse((trimws(as.character(dt12$gradient))==trimws("NA")),NA,as.character(dt12$gradient)))
dt12$survey_type <- as.factor(ifelse((trimws(as.character(dt12$survey_type))==trimws("NA")),NA,as.character(dt12$survey_type)))
dt12$location <- as.factor(ifelse((trimws(as.character(dt12$location))==trimws("NA")),NA,as.character(dt12$location)))
dt12$julianday <- ifelse((trimws(as.character(dt12$julianday))==trimws("NA")),NA,dt12$julianday)               
suppressWarnings(dt12$julianday <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$julianday))==as.character(as.numeric("NA"))),NA,dt12$julianday))
dt12$coll_GDD <- ifelse((trimws(as.character(dt12$coll_GDD))==trimws("NA")),NA,dt12$coll_GDD)               
suppressWarnings(dt12$coll_GDD <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$coll_GDD))==as.character(as.numeric("NA"))),NA,dt12$coll_GDD))
dt12$latitude <- ifelse((trimws(as.character(dt12$latitude))==trimws("NA")),NA,dt12$latitude)               
suppressWarnings(dt12$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$latitude))==as.character(as.numeric("NA"))),NA,dt12$latitude))
dt12$longitude <- ifelse((trimws(as.character(dt12$longitude))==trimws("NA")),NA,dt12$longitude)               
suppressWarnings(dt12$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$longitude))==as.character(as.numeric("NA"))),NA,dt12$longitude))
dt12$elevation_m <- ifelse((trimws(as.character(dt12$elevation_m))==trimws("NA")),NA,dt12$elevation_m)               
suppressWarnings(dt12$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$elevation_m))==as.character(as.numeric("NA"))),NA,dt12$elevation_m))
dt12$GDD30yr <- ifelse((trimws(as.character(dt12$GDD30yr))==trimws("NA")),NA,dt12$GDD30yr)               
suppressWarnings(dt12$GDD30yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$GDD30yr))==as.character(as.numeric("NA"))),NA,dt12$GDD30yr))
dt12$GDD3yr <- ifelse((trimws(as.character(dt12$GDD3yr))==trimws("NA")),NA,dt12$GDD3yr)               
suppressWarnings(dt12$GDD3yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$GDD3yr))==as.character(as.numeric("NA"))),NA,dt12$GDD3yr))
dt12$GDD2015 <- ifelse((trimws(as.character(dt12$GDD2015))==trimws("NA")),NA,dt12$GDD2015)               
suppressWarnings(dt12$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$GDD2015))==as.character(as.numeric("NA"))),NA,dt12$GDD2015))
dt12$ppt30yr <- ifelse((trimws(as.character(dt12$ppt30yr))==trimws("NA")),NA,dt12$ppt30yr)               
suppressWarnings(dt12$ppt30yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$ppt30yr))==as.character(as.numeric("NA"))),NA,dt12$ppt30yr))
dt12$ppt3yr <- ifelse((trimws(as.character(dt12$ppt3yr))==trimws("NA")),NA,dt12$ppt3yr)               
suppressWarnings(dt12$ppt3yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$ppt3yr))==as.character(as.numeric("NA"))),NA,dt12$ppt3yr))
dt12$ppt2015 <- ifelse((trimws(as.character(dt12$ppt2015))==trimws("NA")),NA,dt12$ppt2015)               
suppressWarnings(dt12$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$ppt2015))==as.character(as.numeric("NA"))),NA,dt12$ppt2015))
dt12$soil_moisture <- ifelse((trimws(as.character(dt12$soil_moisture))==trimws("NA")),NA,dt12$soil_moisture)               
suppressWarnings(dt12$soil_moisture <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$soil_moisture))==as.character(as.numeric("NA"))),NA,dt12$soil_moisture))
dt12$GWC <- ifelse((trimws(as.character(dt12$GWC))==trimws("NA")),NA,dt12$GWC)               
suppressWarnings(dt12$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$GWC))==as.character(as.numeric("NA"))),NA,dt12$GWC))
dt12$perc_moisture <- ifelse((trimws(as.character(dt12$perc_moisture))==trimws("NA")),NA,dt12$perc_moisture)               
suppressWarnings(dt12$perc_moisture <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$perc_moisture))==as.character(as.numeric("NA"))),NA,dt12$perc_moisture))
dt12$pH <- ifelse((trimws(as.character(dt12$pH))==trimws("NA")),NA,dt12$pH)               
suppressWarnings(dt12$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$pH))==as.character(as.numeric("NA"))),NA,dt12$pH))
dt12$phos <- ifelse((trimws(as.character(dt12$phos))==trimws("NA")),NA,dt12$phos)               
suppressWarnings(dt12$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$phos))==as.character(as.numeric("NA"))),NA,dt12$phos))
dt12$ammonium <- ifelse((trimws(as.character(dt12$ammonium))==trimws("NA")),NA,dt12$ammonium)               
suppressWarnings(dt12$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$ammonium))==as.character(as.numeric("NA"))),NA,dt12$ammonium))
dt12$nitrate <- ifelse((trimws(as.character(dt12$nitrate))==trimws("NA")),NA,dt12$nitrate)               
suppressWarnings(dt12$nitrate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$nitrate))==as.character(as.numeric("NA"))),NA,dt12$nitrate))
dt12$SOM <- ifelse((trimws(as.character(dt12$SOM))==trimws("NA")),NA,dt12$SOM)               
suppressWarnings(dt12$SOM <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$SOM))==as.character(as.numeric("NA"))),NA,dt12$SOM))
dt12$herbivory_perc <- ifelse((trimws(as.character(dt12$herbivory_perc))==trimws("NA")),NA,dt12$herbivory_perc)               
suppressWarnings(dt12$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt12$herbivory_perc))
dt12$avg_SLA <- ifelse((trimws(as.character(dt12$avg_SLA))==trimws("NA")),NA,dt12$avg_SLA)               
suppressWarnings(dt12$avg_SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$avg_SLA))==as.character(as.numeric("NA"))),NA,dt12$avg_SLA))
dt12$avg_SRL <- ifelse((trimws(as.character(dt12$avg_SRL))==trimws("NA")),NA,dt12$avg_SRL)               
suppressWarnings(dt12$avg_SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt12$avg_SRL))==as.character(as.numeric("NA"))),NA,dt12$avg_SRL))


# Here is the structure of the input data frame:
str(dt12)                            
attach(dt12)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(recno)
summary(code)
summary(species)
summary(site_species)
summary(site_loc)
summary(site)
summary(lat.f)
summary(gradient)
summary(survey_type)
summary(location)
summary(date_collected)
summary(julianday)
summary(coll_GDD)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD30yr)
summary(GDD3yr)
summary(GDD2015)
summary(ppt30yr)
summary(ppt3yr)
summary(ppt2015)
summary(soil_moisture)
summary(GWC)
summary(perc_moisture)
summary(pH)
summary(phos)
summary(ammonium)
summary(nitrate)
summary(SOM)
summary(herbivory_perc)
summary(avg_SLA)
summary(avg_SRL) 
# Get more details on character variables

summary(as.factor(dt12$recno)) 
summary(as.factor(dt12$code)) 
summary(as.factor(dt12$species)) 
summary(as.factor(dt12$site_species)) 
summary(as.factor(dt12$site_loc)) 
summary(as.factor(dt12$site)) 
summary(as.factor(dt12$lat.f)) 
summary(as.factor(dt12$gradient)) 
summary(as.factor(dt12$survey_type)) 
summary(as.factor(dt12$location))
detach(dt12)               


# inUrl13  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/f36dfff24bdec03b3e5ad0e2b02b5ec4" 
infile13 <- "../raw_data/knb-lter-sev.332.2/NAR_microscopy.csv"
# try(download.file(inUrl13,infile13,method="curl"))
# if (is.na(file.size(infile13))) download.file(inUrl13,infile13,method="auto")


dt13 <-read.csv(infile13,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "V1",     
                  "site_species",     
                  "site_loc",     
                  "site.x",     
                  "plant_species",     
                  "replicate",     
                  "plantID",     
                  "dse_hyphae",     
                  "dse_vesicle",     
                  "dse_ms",     
                  "hyaline_hyphae",     
                  "hyaline_vesicle",     
                  "hyaline_spore",     
                  "total_coloniz",     
                  "lat.f",     
                  "gradient",     
                  "survey_type",     
                  "location",     
                  "date_collected",     
                  "julianday",     
                  "coll_GDD",     
                  "latitude",     
                  "longitude",     
                  "elevation_m",     
                  "GDD30yr",     
                  "GDD3yr",     
                  "GDD2015",     
                  "ppt30yr",     
                  "ppt3yr",     
                  "ppt2015",     
                  "soil_moisture",     
                  "GWC",     
                  "perc_moisture",     
                  "pH",     
                  "phos",     
                  "ammonium",     
                  "nitrate",     
                  "SOM",     
                  "herbivory_perc",     
                  "avg_SLA",     
                  "avg_SRL"    ), check.names=TRUE)

# unlink(infile13)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt13$V1)!="factor") dt13$V1<- as.factor(dt13$V1)
if (class(dt13$site_species)!="factor") dt13$site_species<- as.factor(dt13$site_species)
if (class(dt13$site_loc)!="factor") dt13$site_loc<- as.factor(dt13$site_loc)
if (class(dt13$site.x)!="factor") dt13$site.x<- as.factor(dt13$site.x)
if (class(dt13$plant_species)!="factor") dt13$plant_species<- as.factor(dt13$plant_species)
if (class(dt13$replicate)!="factor") dt13$replicate<- as.factor(dt13$replicate)
if (class(dt13$plantID)!="factor") dt13$plantID<- as.factor(dt13$plantID)
if (class(dt13$dse_hyphae)=="factor") dt13$dse_hyphae <-as.numeric(levels(dt13$dse_hyphae))[as.integer(dt13$dse_hyphae) ]               
if (class(dt13$dse_hyphae)=="character") dt13$dse_hyphae <-as.numeric(dt13$dse_hyphae)
if (class(dt13$dse_vesicle)=="factor") dt13$dse_vesicle <-as.numeric(levels(dt13$dse_vesicle))[as.integer(dt13$dse_vesicle) ]               
if (class(dt13$dse_vesicle)=="character") dt13$dse_vesicle <-as.numeric(dt13$dse_vesicle)
if (class(dt13$dse_ms)=="factor") dt13$dse_ms <-as.numeric(levels(dt13$dse_ms))[as.integer(dt13$dse_ms) ]               
if (class(dt13$dse_ms)=="character") dt13$dse_ms <-as.numeric(dt13$dse_ms)
if (class(dt13$hyaline_hyphae)=="factor") dt13$hyaline_hyphae <-as.numeric(levels(dt13$hyaline_hyphae))[as.integer(dt13$hyaline_hyphae) ]               
if (class(dt13$hyaline_hyphae)=="character") dt13$hyaline_hyphae <-as.numeric(dt13$hyaline_hyphae)
if (class(dt13$hyaline_vesicle)=="factor") dt13$hyaline_vesicle <-as.numeric(levels(dt13$hyaline_vesicle))[as.integer(dt13$hyaline_vesicle) ]               
if (class(dt13$hyaline_vesicle)=="character") dt13$hyaline_vesicle <-as.numeric(dt13$hyaline_vesicle)
if (class(dt13$hyaline_spore)=="factor") dt13$hyaline_spore <-as.numeric(levels(dt13$hyaline_spore))[as.integer(dt13$hyaline_spore) ]               
if (class(dt13$hyaline_spore)=="character") dt13$hyaline_spore <-as.numeric(dt13$hyaline_spore)
if (class(dt13$total_coloniz)=="factor") dt13$total_coloniz <-as.numeric(levels(dt13$total_coloniz))[as.integer(dt13$total_coloniz) ]               
if (class(dt13$total_coloniz)=="character") dt13$total_coloniz <-as.numeric(dt13$total_coloniz)
if (class(dt13$lat.f)!="factor") dt13$lat.f<- as.factor(dt13$lat.f)
if (class(dt13$gradient)!="factor") dt13$gradient<- as.factor(dt13$gradient)
if (class(dt13$survey_type)!="factor") dt13$survey_type<- as.factor(dt13$survey_type)
if (class(dt13$location)!="factor") dt13$location<- as.factor(dt13$location)                                   
# attempting to convert dt13$date_collected dateTime string to R date structure (date or POSIXct)                                
tmpDateFormat<-"%Y-%m-%d"
tmp13date_collected<-as.Date(dt13$date_collected,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp13date_collected) == length(tmp13date_collected[!is.na(tmp13date_collected)])){dt13$date_collected <- tmp13date_collected } else {print("Date conversion failed for dt13$date_collected. Please inspect the data and do the date conversion yourself.")}                                                                    
rm(tmpDateFormat,tmp13date_collected) 
if (class(dt13$julianday)=="factor") dt13$julianday <-as.numeric(levels(dt13$julianday))[as.integer(dt13$julianday) ]               
if (class(dt13$julianday)=="character") dt13$julianday <-as.numeric(dt13$julianday)
if (class(dt13$coll_GDD)=="factor") dt13$coll_GDD <-as.numeric(levels(dt13$coll_GDD))[as.integer(dt13$coll_GDD) ]               
if (class(dt13$coll_GDD)=="character") dt13$coll_GDD <-as.numeric(dt13$coll_GDD)
if (class(dt13$latitude)=="factor") dt13$latitude <-as.numeric(levels(dt13$latitude))[as.integer(dt13$latitude) ]               
if (class(dt13$latitude)=="character") dt13$latitude <-as.numeric(dt13$latitude)
if (class(dt13$longitude)=="factor") dt13$longitude <-as.numeric(levels(dt13$longitude))[as.integer(dt13$longitude) ]               
if (class(dt13$longitude)=="character") dt13$longitude <-as.numeric(dt13$longitude)
if (class(dt13$elevation_m)=="factor") dt13$elevation_m <-as.numeric(levels(dt13$elevation_m))[as.integer(dt13$elevation_m) ]               
if (class(dt13$elevation_m)=="character") dt13$elevation_m <-as.numeric(dt13$elevation_m)
if (class(dt13$GDD30yr)=="factor") dt13$GDD30yr <-as.numeric(levels(dt13$GDD30yr))[as.integer(dt13$GDD30yr) ]               
if (class(dt13$GDD30yr)=="character") dt13$GDD30yr <-as.numeric(dt13$GDD30yr)
if (class(dt13$GDD3yr)=="factor") dt13$GDD3yr <-as.numeric(levels(dt13$GDD3yr))[as.integer(dt13$GDD3yr) ]               
if (class(dt13$GDD3yr)=="character") dt13$GDD3yr <-as.numeric(dt13$GDD3yr)
if (class(dt13$GDD2015)=="factor") dt13$GDD2015 <-as.numeric(levels(dt13$GDD2015))[as.integer(dt13$GDD2015) ]               
if (class(dt13$GDD2015)=="character") dt13$GDD2015 <-as.numeric(dt13$GDD2015)
if (class(dt13$ppt30yr)=="factor") dt13$ppt30yr <-as.numeric(levels(dt13$ppt30yr))[as.integer(dt13$ppt30yr) ]               
if (class(dt13$ppt30yr)=="character") dt13$ppt30yr <-as.numeric(dt13$ppt30yr)
if (class(dt13$ppt3yr)=="factor") dt13$ppt3yr <-as.numeric(levels(dt13$ppt3yr))[as.integer(dt13$ppt3yr) ]               
if (class(dt13$ppt3yr)=="character") dt13$ppt3yr <-as.numeric(dt13$ppt3yr)
if (class(dt13$ppt2015)=="factor") dt13$ppt2015 <-as.numeric(levels(dt13$ppt2015))[as.integer(dt13$ppt2015) ]               
if (class(dt13$ppt2015)=="character") dt13$ppt2015 <-as.numeric(dt13$ppt2015)
if (class(dt13$soil_moisture)=="factor") dt13$soil_moisture <-as.numeric(levels(dt13$soil_moisture))[as.integer(dt13$soil_moisture) ]               
if (class(dt13$soil_moisture)=="character") dt13$soil_moisture <-as.numeric(dt13$soil_moisture)
if (class(dt13$GWC)=="factor") dt13$GWC <-as.numeric(levels(dt13$GWC))[as.integer(dt13$GWC) ]               
if (class(dt13$GWC)=="character") dt13$GWC <-as.numeric(dt13$GWC)
if (class(dt13$perc_moisture)=="factor") dt13$perc_moisture <-as.numeric(levels(dt13$perc_moisture))[as.integer(dt13$perc_moisture) ]               
if (class(dt13$perc_moisture)=="character") dt13$perc_moisture <-as.numeric(dt13$perc_moisture)
if (class(dt13$pH)=="factor") dt13$pH <-as.numeric(levels(dt13$pH))[as.integer(dt13$pH) ]               
if (class(dt13$pH)=="character") dt13$pH <-as.numeric(dt13$pH)
if (class(dt13$phos)=="factor") dt13$phos <-as.numeric(levels(dt13$phos))[as.integer(dt13$phos) ]               
if (class(dt13$phos)=="character") dt13$phos <-as.numeric(dt13$phos)
if (class(dt13$ammonium)=="factor") dt13$ammonium <-as.numeric(levels(dt13$ammonium))[as.integer(dt13$ammonium) ]               
if (class(dt13$ammonium)=="character") dt13$ammonium <-as.numeric(dt13$ammonium)
if (class(dt13$nitrate)=="factor") dt13$nitrate <-as.numeric(levels(dt13$nitrate))[as.integer(dt13$nitrate) ]               
if (class(dt13$nitrate)=="character") dt13$nitrate <-as.numeric(dt13$nitrate)
if (class(dt13$SOM)=="factor") dt13$SOM <-as.numeric(levels(dt13$SOM))[as.integer(dt13$SOM) ]               
if (class(dt13$SOM)=="character") dt13$SOM <-as.numeric(dt13$SOM)
if (class(dt13$herbivory_perc)=="factor") dt13$herbivory_perc <-as.numeric(levels(dt13$herbivory_perc))[as.integer(dt13$herbivory_perc) ]               
if (class(dt13$herbivory_perc)=="character") dt13$herbivory_perc <-as.numeric(dt13$herbivory_perc)
if (class(dt13$avg_SLA)=="factor") dt13$avg_SLA <-as.numeric(levels(dt13$avg_SLA))[as.integer(dt13$avg_SLA) ]               
if (class(dt13$avg_SLA)=="character") dt13$avg_SLA <-as.numeric(dt13$avg_SLA)
if (class(dt13$avg_SRL)=="factor") dt13$avg_SRL <-as.numeric(levels(dt13$avg_SRL))[as.integer(dt13$avg_SRL) ]               
if (class(dt13$avg_SRL)=="character") dt13$avg_SRL <-as.numeric(dt13$avg_SRL)

# Convert Missing Values to NA for non-dates

dt13$V1 <- as.factor(ifelse((trimws(as.character(dt13$V1))==trimws("NA")),NA,as.character(dt13$V1)))
dt13$site_species <- as.factor(ifelse((trimws(as.character(dt13$site_species))==trimws("NA")),NA,as.character(dt13$site_species)))
dt13$site_loc <- as.factor(ifelse((trimws(as.character(dt13$site_loc))==trimws("NA")),NA,as.character(dt13$site_loc)))
dt13$site.x <- as.factor(ifelse((trimws(as.character(dt13$site.x))==trimws("NA")),NA,as.character(dt13$site.x)))
dt13$plant_species <- as.factor(ifelse((trimws(as.character(dt13$plant_species))==trimws("NA")),NA,as.character(dt13$plant_species)))
dt13$replicate <- as.factor(ifelse((trimws(as.character(dt13$replicate))==trimws("NA")),NA,as.character(dt13$replicate)))
dt13$plantID <- as.factor(ifelse((trimws(as.character(dt13$plantID))==trimws("NA")),NA,as.character(dt13$plantID)))
dt13$dse_hyphae <- ifelse((trimws(as.character(dt13$dse_hyphae))==trimws("NA")),NA,dt13$dse_hyphae)               
suppressWarnings(dt13$dse_hyphae <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$dse_hyphae))==as.character(as.numeric("NA"))),NA,dt13$dse_hyphae))
dt13$dse_vesicle <- ifelse((trimws(as.character(dt13$dse_vesicle))==trimws("NA")),NA,dt13$dse_vesicle)               
suppressWarnings(dt13$dse_vesicle <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$dse_vesicle))==as.character(as.numeric("NA"))),NA,dt13$dse_vesicle))
dt13$dse_ms <- ifelse((trimws(as.character(dt13$dse_ms))==trimws("NA")),NA,dt13$dse_ms)               
suppressWarnings(dt13$dse_ms <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$dse_ms))==as.character(as.numeric("NA"))),NA,dt13$dse_ms))
dt13$hyaline_hyphae <- ifelse((trimws(as.character(dt13$hyaline_hyphae))==trimws("NA")),NA,dt13$hyaline_hyphae)               
suppressWarnings(dt13$hyaline_hyphae <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$hyaline_hyphae))==as.character(as.numeric("NA"))),NA,dt13$hyaline_hyphae))
dt13$hyaline_vesicle <- ifelse((trimws(as.character(dt13$hyaline_vesicle))==trimws("NA")),NA,dt13$hyaline_vesicle)               
suppressWarnings(dt13$hyaline_vesicle <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$hyaline_vesicle))==as.character(as.numeric("NA"))),NA,dt13$hyaline_vesicle))
dt13$hyaline_spore <- ifelse((trimws(as.character(dt13$hyaline_spore))==trimws("NA")),NA,dt13$hyaline_spore)               
suppressWarnings(dt13$hyaline_spore <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$hyaline_spore))==as.character(as.numeric("NA"))),NA,dt13$hyaline_spore))
dt13$total_coloniz <- ifelse((trimws(as.character(dt13$total_coloniz))==trimws("NA")),NA,dt13$total_coloniz)               
suppressWarnings(dt13$total_coloniz <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$total_coloniz))==as.character(as.numeric("NA"))),NA,dt13$total_coloniz))
dt13$lat.f <- as.factor(ifelse((trimws(as.character(dt13$lat.f))==trimws("NA")),NA,as.character(dt13$lat.f)))
dt13$gradient <- as.factor(ifelse((trimws(as.character(dt13$gradient))==trimws("NA")),NA,as.character(dt13$gradient)))
dt13$survey_type <- as.factor(ifelse((trimws(as.character(dt13$survey_type))==trimws("NA")),NA,as.character(dt13$survey_type)))
dt13$location <- as.factor(ifelse((trimws(as.character(dt13$location))==trimws("NA")),NA,as.character(dt13$location)))
dt13$julianday <- ifelse((trimws(as.character(dt13$julianday))==trimws("NA")),NA,dt13$julianday)               
suppressWarnings(dt13$julianday <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$julianday))==as.character(as.numeric("NA"))),NA,dt13$julianday))
dt13$coll_GDD <- ifelse((trimws(as.character(dt13$coll_GDD))==trimws("NA")),NA,dt13$coll_GDD)               
suppressWarnings(dt13$coll_GDD <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$coll_GDD))==as.character(as.numeric("NA"))),NA,dt13$coll_GDD))
dt13$latitude <- ifelse((trimws(as.character(dt13$latitude))==trimws("NA")),NA,dt13$latitude)               
suppressWarnings(dt13$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$latitude))==as.character(as.numeric("NA"))),NA,dt13$latitude))
dt13$longitude <- ifelse((trimws(as.character(dt13$longitude))==trimws("NA")),NA,dt13$longitude)               
suppressWarnings(dt13$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$longitude))==as.character(as.numeric("NA"))),NA,dt13$longitude))
dt13$elevation_m <- ifelse((trimws(as.character(dt13$elevation_m))==trimws("NA")),NA,dt13$elevation_m)               
suppressWarnings(dt13$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$elevation_m))==as.character(as.numeric("NA"))),NA,dt13$elevation_m))
dt13$GDD30yr <- ifelse((trimws(as.character(dt13$GDD30yr))==trimws("NA")),NA,dt13$GDD30yr)               
suppressWarnings(dt13$GDD30yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$GDD30yr))==as.character(as.numeric("NA"))),NA,dt13$GDD30yr))
dt13$GDD3yr <- ifelse((trimws(as.character(dt13$GDD3yr))==trimws("NA")),NA,dt13$GDD3yr)               
suppressWarnings(dt13$GDD3yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$GDD3yr))==as.character(as.numeric("NA"))),NA,dt13$GDD3yr))
dt13$GDD2015 <- ifelse((trimws(as.character(dt13$GDD2015))==trimws("NA")),NA,dt13$GDD2015)               
suppressWarnings(dt13$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$GDD2015))==as.character(as.numeric("NA"))),NA,dt13$GDD2015))
dt13$ppt30yr <- ifelse((trimws(as.character(dt13$ppt30yr))==trimws("NA")),NA,dt13$ppt30yr)               
suppressWarnings(dt13$ppt30yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$ppt30yr))==as.character(as.numeric("NA"))),NA,dt13$ppt30yr))
dt13$ppt3yr <- ifelse((trimws(as.character(dt13$ppt3yr))==trimws("NA")),NA,dt13$ppt3yr)               
suppressWarnings(dt13$ppt3yr <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$ppt3yr))==as.character(as.numeric("NA"))),NA,dt13$ppt3yr))
dt13$ppt2015 <- ifelse((trimws(as.character(dt13$ppt2015))==trimws("NA")),NA,dt13$ppt2015)               
suppressWarnings(dt13$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$ppt2015))==as.character(as.numeric("NA"))),NA,dt13$ppt2015))
dt13$soil_moisture <- ifelse((trimws(as.character(dt13$soil_moisture))==trimws("NA")),NA,dt13$soil_moisture)               
suppressWarnings(dt13$soil_moisture <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$soil_moisture))==as.character(as.numeric("NA"))),NA,dt13$soil_moisture))
dt13$GWC <- ifelse((trimws(as.character(dt13$GWC))==trimws("NA")),NA,dt13$GWC)               
suppressWarnings(dt13$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$GWC))==as.character(as.numeric("NA"))),NA,dt13$GWC))
dt13$perc_moisture <- ifelse((trimws(as.character(dt13$perc_moisture))==trimws("NA")),NA,dt13$perc_moisture)               
suppressWarnings(dt13$perc_moisture <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$perc_moisture))==as.character(as.numeric("NA"))),NA,dt13$perc_moisture))
dt13$pH <- ifelse((trimws(as.character(dt13$pH))==trimws("NA")),NA,dt13$pH)               
suppressWarnings(dt13$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$pH))==as.character(as.numeric("NA"))),NA,dt13$pH))
dt13$phos <- ifelse((trimws(as.character(dt13$phos))==trimws("NA")),NA,dt13$phos)               
suppressWarnings(dt13$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$phos))==as.character(as.numeric("NA"))),NA,dt13$phos))
dt13$ammonium <- ifelse((trimws(as.character(dt13$ammonium))==trimws("NA")),NA,dt13$ammonium)               
suppressWarnings(dt13$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$ammonium))==as.character(as.numeric("NA"))),NA,dt13$ammonium))
dt13$nitrate <- ifelse((trimws(as.character(dt13$nitrate))==trimws("NA")),NA,dt13$nitrate)               
suppressWarnings(dt13$nitrate <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$nitrate))==as.character(as.numeric("NA"))),NA,dt13$nitrate))
dt13$SOM <- ifelse((trimws(as.character(dt13$SOM))==trimws("NA")),NA,dt13$SOM)               
suppressWarnings(dt13$SOM <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$SOM))==as.character(as.numeric("NA"))),NA,dt13$SOM))
dt13$herbivory_perc <- ifelse((trimws(as.character(dt13$herbivory_perc))==trimws("NA")),NA,dt13$herbivory_perc)               
suppressWarnings(dt13$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt13$herbivory_perc))
dt13$avg_SLA <- ifelse((trimws(as.character(dt13$avg_SLA))==trimws("NA")),NA,dt13$avg_SLA)               
suppressWarnings(dt13$avg_SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$avg_SLA))==as.character(as.numeric("NA"))),NA,dt13$avg_SLA))
dt13$avg_SRL <- ifelse((trimws(as.character(dt13$avg_SRL))==trimws("NA")),NA,dt13$avg_SRL)               
suppressWarnings(dt13$avg_SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt13$avg_SRL))==as.character(as.numeric("NA"))),NA,dt13$avg_SRL))


# Here is the structure of the input data frame:
str(dt13)                            
attach(dt13)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(V1)
summary(site_species)
summary(site_loc)
summary(site.x)
summary(plant_species)
summary(replicate)
summary(plantID)
summary(dse_hyphae)
summary(dse_vesicle)
summary(dse_ms)
summary(hyaline_hyphae)
summary(hyaline_vesicle)
summary(hyaline_spore)
summary(total_coloniz)
summary(lat.f)
summary(gradient)
summary(survey_type)
summary(location)
summary(date_collected)
summary(julianday)
summary(coll_GDD)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD30yr)
summary(GDD3yr)
summary(GDD2015)
summary(ppt30yr)
summary(ppt3yr)
summary(ppt2015)
summary(soil_moisture)
summary(GWC)
summary(perc_moisture)
summary(pH)
summary(phos)
summary(ammonium)
summary(nitrate)
summary(SOM)
summary(herbivory_perc)
summary(avg_SLA)
summary(avg_SRL) 
# Get more details on character variables

summary(as.factor(dt13$V1)) 
summary(as.factor(dt13$site_species)) 
summary(as.factor(dt13$site_loc)) 
summary(as.factor(dt13$site.x)) 
summary(as.factor(dt13$plant_species)) 
summary(as.factor(dt13$replicate)) 
summary(as.factor(dt13$plantID)) 
summary(as.factor(dt13$lat.f)) 
summary(as.factor(dt13$gradient)) 
summary(as.factor(dt13$survey_type)) 
summary(as.factor(dt13$location))
detach(dt13)               


# inUrl14  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/cc25141d5f767ef69b836191fe7cd13d" 
infile14 <- "../raw_data/knb-lter-sev.332.2/NAR_richness.csv"
# try(download.file(inUrl14,infile14,method="curl"))
# if (is.na(file.size(infile14))) download.file(inUrl14,infile14,method="auto")


dt14 <-read.csv(infile14,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "group",     
                  "replicate",     
                  "site",     
                  "species",     
                  "library",     
                  "nseqs",     
                  "coverage",     
                  "sobs",     
                  "chao",     
                  "simpsonD",     
                  "simpson_inv",     
                  "shannonH",     
                  "simpsoneven",     
                  "shannoneven",     
                  "boneh"    ), check.names=TRUE)

# unlink(infile14)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt14$sample)!="factor") dt14$sample<- as.factor(dt14$sample)
if (class(dt14$group)!="factor") dt14$group<- as.factor(dt14$group)
if (class(dt14$replicate)!="factor") dt14$replicate<- as.factor(dt14$replicate)
if (class(dt14$site)!="factor") dt14$site<- as.factor(dt14$site)
if (class(dt14$species)!="factor") dt14$species<- as.factor(dt14$species)
if (class(dt14$library)!="factor") dt14$library<- as.factor(dt14$library)
if (class(dt14$nseqs)=="factor") dt14$nseqs <-as.numeric(levels(dt14$nseqs))[as.integer(dt14$nseqs) ]               
if (class(dt14$nseqs)=="character") dt14$nseqs <-as.numeric(dt14$nseqs)
if (class(dt14$coverage)=="factor") dt14$coverage <-as.numeric(levels(dt14$coverage))[as.integer(dt14$coverage) ]               
if (class(dt14$coverage)=="character") dt14$coverage <-as.numeric(dt14$coverage)
if (class(dt14$sobs)=="factor") dt14$sobs <-as.numeric(levels(dt14$sobs))[as.integer(dt14$sobs) ]               
if (class(dt14$sobs)=="character") dt14$sobs <-as.numeric(dt14$sobs)
if (class(dt14$chao)=="factor") dt14$chao <-as.numeric(levels(dt14$chao))[as.integer(dt14$chao) ]               
if (class(dt14$chao)=="character") dt14$chao <-as.numeric(dt14$chao)
if (class(dt14$simpsonD)=="factor") dt14$simpsonD <-as.numeric(levels(dt14$simpsonD))[as.integer(dt14$simpsonD) ]               
if (class(dt14$simpsonD)=="character") dt14$simpsonD <-as.numeric(dt14$simpsonD)
if (class(dt14$simpson_inv)=="factor") dt14$simpson_inv <-as.numeric(levels(dt14$simpson_inv))[as.integer(dt14$simpson_inv) ]               
if (class(dt14$simpson_inv)=="character") dt14$simpson_inv <-as.numeric(dt14$simpson_inv)
if (class(dt14$shannonH)=="factor") dt14$shannonH <-as.numeric(levels(dt14$shannonH))[as.integer(dt14$shannonH) ]               
if (class(dt14$shannonH)=="character") dt14$shannonH <-as.numeric(dt14$shannonH)
if (class(dt14$simpsoneven)=="factor") dt14$simpsoneven <-as.numeric(levels(dt14$simpsoneven))[as.integer(dt14$simpsoneven) ]               
if (class(dt14$simpsoneven)=="character") dt14$simpsoneven <-as.numeric(dt14$simpsoneven)
if (class(dt14$shannoneven)=="factor") dt14$shannoneven <-as.numeric(levels(dt14$shannoneven))[as.integer(dt14$shannoneven) ]               
if (class(dt14$shannoneven)=="character") dt14$shannoneven <-as.numeric(dt14$shannoneven)
if (class(dt14$boneh)=="factor") dt14$boneh <-as.numeric(levels(dt14$boneh))[as.integer(dt14$boneh) ]               
if (class(dt14$boneh)=="character") dt14$boneh <-as.numeric(dt14$boneh)

# Convert Missing Values to NA for non-dates

dt14$sample <- as.factor(ifelse((trimws(as.character(dt14$sample))==trimws("NA")),NA,as.character(dt14$sample)))
dt14$group <- as.factor(ifelse((trimws(as.character(dt14$group))==trimws("NA")),NA,as.character(dt14$group)))
dt14$replicate <- as.factor(ifelse((trimws(as.character(dt14$replicate))==trimws("NA")),NA,as.character(dt14$replicate)))
dt14$site <- as.factor(ifelse((trimws(as.character(dt14$site))==trimws("NA")),NA,as.character(dt14$site)))
dt14$species <- as.factor(ifelse((trimws(as.character(dt14$species))==trimws("NA")),NA,as.character(dt14$species)))
dt14$library <- as.factor(ifelse((trimws(as.character(dt14$library))==trimws("NA")),NA,as.character(dt14$library)))
dt14$nseqs <- ifelse((trimws(as.character(dt14$nseqs))==trimws("NA")),NA,dt14$nseqs)               
suppressWarnings(dt14$nseqs <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$nseqs))==as.character(as.numeric("NA"))),NA,dt14$nseqs))
dt14$coverage <- ifelse((trimws(as.character(dt14$coverage))==trimws("NA")),NA,dt14$coverage)               
suppressWarnings(dt14$coverage <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$coverage))==as.character(as.numeric("NA"))),NA,dt14$coverage))
dt14$sobs <- ifelse((trimws(as.character(dt14$sobs))==trimws("NA")),NA,dt14$sobs)               
suppressWarnings(dt14$sobs <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$sobs))==as.character(as.numeric("NA"))),NA,dt14$sobs))
dt14$chao <- ifelse((trimws(as.character(dt14$chao))==trimws("NA")),NA,dt14$chao)               
suppressWarnings(dt14$chao <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$chao))==as.character(as.numeric("NA"))),NA,dt14$chao))
dt14$simpsonD <- ifelse((trimws(as.character(dt14$simpsonD))==trimws("NA")),NA,dt14$simpsonD)               
suppressWarnings(dt14$simpsonD <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$simpsonD))==as.character(as.numeric("NA"))),NA,dt14$simpsonD))
dt14$simpson_inv <- ifelse((trimws(as.character(dt14$simpson_inv))==trimws("NA")),NA,dt14$simpson_inv)               
suppressWarnings(dt14$simpson_inv <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$simpson_inv))==as.character(as.numeric("NA"))),NA,dt14$simpson_inv))
dt14$shannonH <- ifelse((trimws(as.character(dt14$shannonH))==trimws("NA")),NA,dt14$shannonH)               
suppressWarnings(dt14$shannonH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$shannonH))==as.character(as.numeric("NA"))),NA,dt14$shannonH))
dt14$simpsoneven <- ifelse((trimws(as.character(dt14$simpsoneven))==trimws("NA")),NA,dt14$simpsoneven)               
suppressWarnings(dt14$simpsoneven <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$simpsoneven))==as.character(as.numeric("NA"))),NA,dt14$simpsoneven))
dt14$shannoneven <- ifelse((trimws(as.character(dt14$shannoneven))==trimws("NA")),NA,dt14$shannoneven)               
suppressWarnings(dt14$shannoneven <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$shannoneven))==as.character(as.numeric("NA"))),NA,dt14$shannoneven))
dt14$boneh <- ifelse((trimws(as.character(dt14$boneh))==trimws("NA")),NA,dt14$boneh)               
suppressWarnings(dt14$boneh <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt14$boneh))==as.character(as.numeric("NA"))),NA,dt14$boneh))


# Here is the structure of the input data frame:
str(dt14)                            
attach(dt14)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(group)
summary(replicate)
summary(site)
summary(species)
summary(library)
summary(nseqs)
summary(coverage)
summary(sobs)
summary(chao)
summary(simpsonD)
summary(simpson_inv)
summary(shannonH)
summary(simpsoneven)
summary(shannoneven)
summary(boneh) 
# Get more details on character variables

summary(as.factor(dt14$sample)) 
summary(as.factor(dt14$group)) 
summary(as.factor(dt14$replicate)) 
summary(as.factor(dt14$site)) 
summary(as.factor(dt14$species)) 
summary(as.factor(dt14$library))
detach(dt14)               


# inUrl15  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/71ac5900311856532eb759e3219f87ae" 
infile15 <- "../raw_data/knb-lter-sev.332.2/Pie_DSE_Latitude.csv"
# try(download.file(inUrl15,infile15,method="curl"))
# if (is.na(file.size(infile15))) download.file(inUrl15,infile15,method="auto")


dt15 <-read.csv(infile15,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "site",     
                  "latitude",     
                  "longitude",     
                  "elevation_m",     
                  "ANGE",     
                  "BOER",     
                  "BOGR",     
                  "BUDA",     
                  "SCSC"    ), check.names=TRUE)

# unlink(infile15)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt15$site)!="factor") dt15$site<- as.factor(dt15$site)
if (class(dt15$latitude)=="factor") dt15$latitude <-as.numeric(levels(dt15$latitude))[as.integer(dt15$latitude) ]               
if (class(dt15$latitude)=="character") dt15$latitude <-as.numeric(dt15$latitude)
if (class(dt15$longitude)=="factor") dt15$longitude <-as.numeric(levels(dt15$longitude))[as.integer(dt15$longitude) ]               
if (class(dt15$longitude)=="character") dt15$longitude <-as.numeric(dt15$longitude)
if (class(dt15$elevation_m)=="factor") dt15$elevation_m <-as.numeric(levels(dt15$elevation_m))[as.integer(dt15$elevation_m) ]               
if (class(dt15$elevation_m)=="character") dt15$elevation_m <-as.numeric(dt15$elevation_m)
if (class(dt15$ANGE)=="factor") dt15$ANGE <-as.numeric(levels(dt15$ANGE))[as.integer(dt15$ANGE) ]               
if (class(dt15$ANGE)=="character") dt15$ANGE <-as.numeric(dt15$ANGE)
if (class(dt15$BOER)=="factor") dt15$BOER <-as.numeric(levels(dt15$BOER))[as.integer(dt15$BOER) ]               
if (class(dt15$BOER)=="character") dt15$BOER <-as.numeric(dt15$BOER)
if (class(dt15$BOGR)=="factor") dt15$BOGR <-as.numeric(levels(dt15$BOGR))[as.integer(dt15$BOGR) ]               
if (class(dt15$BOGR)=="character") dt15$BOGR <-as.numeric(dt15$BOGR)
if (class(dt15$BUDA)=="factor") dt15$BUDA <-as.numeric(levels(dt15$BUDA))[as.integer(dt15$BUDA) ]               
if (class(dt15$BUDA)=="character") dt15$BUDA <-as.numeric(dt15$BUDA)
if (class(dt15$SCSC)=="factor") dt15$SCSC <-as.numeric(levels(dt15$SCSC))[as.integer(dt15$SCSC) ]               
if (class(dt15$SCSC)=="character") dt15$SCSC <-as.numeric(dt15$SCSC)

# Convert Missing Values to NA for non-dates

dt15$site <- as.factor(ifelse((trimws(as.character(dt15$site))==trimws("NA")),NA,as.character(dt15$site)))
dt15$latitude <- ifelse((trimws(as.character(dt15$latitude))==trimws("NA")),NA,dt15$latitude)               
suppressWarnings(dt15$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$latitude))==as.character(as.numeric("NA"))),NA,dt15$latitude))
dt15$longitude <- ifelse((trimws(as.character(dt15$longitude))==trimws("NA")),NA,dt15$longitude)               
suppressWarnings(dt15$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$longitude))==as.character(as.numeric("NA"))),NA,dt15$longitude))
dt15$elevation_m <- ifelse((trimws(as.character(dt15$elevation_m))==trimws("NA")),NA,dt15$elevation_m)               
suppressWarnings(dt15$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$elevation_m))==as.character(as.numeric("NA"))),NA,dt15$elevation_m))
dt15$ANGE <- ifelse((trimws(as.character(dt15$ANGE))==trimws("NA")),NA,dt15$ANGE)               
suppressWarnings(dt15$ANGE <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$ANGE))==as.character(as.numeric("NA"))),NA,dt15$ANGE))
dt15$BOER <- ifelse((trimws(as.character(dt15$BOER))==trimws("NA")),NA,dt15$BOER)               
suppressWarnings(dt15$BOER <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$BOER))==as.character(as.numeric("NA"))),NA,dt15$BOER))
dt15$BOGR <- ifelse((trimws(as.character(dt15$BOGR))==trimws("NA")),NA,dt15$BOGR)               
suppressWarnings(dt15$BOGR <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$BOGR))==as.character(as.numeric("NA"))),NA,dt15$BOGR))
dt15$BUDA <- ifelse((trimws(as.character(dt15$BUDA))==trimws("NA")),NA,dt15$BUDA)               
suppressWarnings(dt15$BUDA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$BUDA))==as.character(as.numeric("NA"))),NA,dt15$BUDA))
dt15$SCSC <- ifelse((trimws(as.character(dt15$SCSC))==trimws("NA")),NA,dt15$SCSC)               
suppressWarnings(dt15$SCSC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt15$SCSC))==as.character(as.numeric("NA"))),NA,dt15$SCSC))


# Here is the structure of the input data frame:
str(dt15)                            
attach(dt15)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(site)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(ANGE)
summary(BOER)
summary(BOGR)
summary(BUDA)
summary(SCSC) 
# Get more details on character variables

summary(as.factor(dt15$site))
detach(dt15)               


# inUrl16  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/ffded945780cc78c5660fad42e92f68f" 
infile16 <- "../raw_data/knb-lter-sev.332.2/SCSCEnvsum.csv"
# try(download.file(inUrl16,infile16,method="curl"))
# if (is.na(file.size(infile16))) download.file(inUrl16,infile16,method="auto")


dt16 <-read.csv(infile16,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "latitude",     
                  "longitude",     
                  "elevation_m",     
                  "GDD2015",     
                  "ppt2015",     
                  "GWC",     
                  "pH",     
                  "ammonium",     
                  "phos",     
                  "SRL",     
                  "SLA",     
                  "herbivory_perc"    ), check.names=TRUE)

# unlink(infile16)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt16$sample)!="factor") dt16$sample<- as.factor(dt16$sample)
if (class(dt16$latitude)=="factor") dt16$latitude <-as.numeric(levels(dt16$latitude))[as.integer(dt16$latitude) ]               
if (class(dt16$latitude)=="character") dt16$latitude <-as.numeric(dt16$latitude)
if (class(dt16$longitude)=="factor") dt16$longitude <-as.numeric(levels(dt16$longitude))[as.integer(dt16$longitude) ]               
if (class(dt16$longitude)=="character") dt16$longitude <-as.numeric(dt16$longitude)
if (class(dt16$elevation_m)=="factor") dt16$elevation_m <-as.numeric(levels(dt16$elevation_m))[as.integer(dt16$elevation_m) ]               
if (class(dt16$elevation_m)=="character") dt16$elevation_m <-as.numeric(dt16$elevation_m)
if (class(dt16$GDD2015)=="factor") dt16$GDD2015 <-as.numeric(levels(dt16$GDD2015))[as.integer(dt16$GDD2015) ]               
if (class(dt16$GDD2015)=="character") dt16$GDD2015 <-as.numeric(dt16$GDD2015)
if (class(dt16$ppt2015)=="factor") dt16$ppt2015 <-as.numeric(levels(dt16$ppt2015))[as.integer(dt16$ppt2015) ]               
if (class(dt16$ppt2015)=="character") dt16$ppt2015 <-as.numeric(dt16$ppt2015)
if (class(dt16$GWC)=="factor") dt16$GWC <-as.numeric(levels(dt16$GWC))[as.integer(dt16$GWC) ]               
if (class(dt16$GWC)=="character") dt16$GWC <-as.numeric(dt16$GWC)
if (class(dt16$pH)=="factor") dt16$pH <-as.numeric(levels(dt16$pH))[as.integer(dt16$pH) ]               
if (class(dt16$pH)=="character") dt16$pH <-as.numeric(dt16$pH)
if (class(dt16$ammonium)=="factor") dt16$ammonium <-as.numeric(levels(dt16$ammonium))[as.integer(dt16$ammonium) ]               
if (class(dt16$ammonium)=="character") dt16$ammonium <-as.numeric(dt16$ammonium)
if (class(dt16$phos)=="factor") dt16$phos <-as.numeric(levels(dt16$phos))[as.integer(dt16$phos) ]               
if (class(dt16$phos)=="character") dt16$phos <-as.numeric(dt16$phos)
if (class(dt16$SRL)=="factor") dt16$SRL <-as.numeric(levels(dt16$SRL))[as.integer(dt16$SRL) ]               
if (class(dt16$SRL)=="character") dt16$SRL <-as.numeric(dt16$SRL)
if (class(dt16$SLA)=="factor") dt16$SLA <-as.numeric(levels(dt16$SLA))[as.integer(dt16$SLA) ]               
if (class(dt16$SLA)=="character") dt16$SLA <-as.numeric(dt16$SLA)
if (class(dt16$herbivory_perc)=="factor") dt16$herbivory_perc <-as.numeric(levels(dt16$herbivory_perc))[as.integer(dt16$herbivory_perc) ]               
if (class(dt16$herbivory_perc)=="character") dt16$herbivory_perc <-as.numeric(dt16$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt16$sample <- as.factor(ifelse((trimws(as.character(dt16$sample))==trimws("NA")),NA,as.character(dt16$sample)))
dt16$latitude <- ifelse((trimws(as.character(dt16$latitude))==trimws("NA")),NA,dt16$latitude)               
suppressWarnings(dt16$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$latitude))==as.character(as.numeric("NA"))),NA,dt16$latitude))
dt16$longitude <- ifelse((trimws(as.character(dt16$longitude))==trimws("NA")),NA,dt16$longitude)               
suppressWarnings(dt16$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$longitude))==as.character(as.numeric("NA"))),NA,dt16$longitude))
dt16$elevation_m <- ifelse((trimws(as.character(dt16$elevation_m))==trimws("NA")),NA,dt16$elevation_m)               
suppressWarnings(dt16$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$elevation_m))==as.character(as.numeric("NA"))),NA,dt16$elevation_m))
dt16$GDD2015 <- ifelse((trimws(as.character(dt16$GDD2015))==trimws("NA")),NA,dt16$GDD2015)               
suppressWarnings(dt16$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$GDD2015))==as.character(as.numeric("NA"))),NA,dt16$GDD2015))
dt16$ppt2015 <- ifelse((trimws(as.character(dt16$ppt2015))==trimws("NA")),NA,dt16$ppt2015)               
suppressWarnings(dt16$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$ppt2015))==as.character(as.numeric("NA"))),NA,dt16$ppt2015))
dt16$GWC <- ifelse((trimws(as.character(dt16$GWC))==trimws("NA")),NA,dt16$GWC)               
suppressWarnings(dt16$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$GWC))==as.character(as.numeric("NA"))),NA,dt16$GWC))
dt16$pH <- ifelse((trimws(as.character(dt16$pH))==trimws("NA")),NA,dt16$pH)               
suppressWarnings(dt16$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$pH))==as.character(as.numeric("NA"))),NA,dt16$pH))
dt16$ammonium <- ifelse((trimws(as.character(dt16$ammonium))==trimws("NA")),NA,dt16$ammonium)               
suppressWarnings(dt16$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$ammonium))==as.character(as.numeric("NA"))),NA,dt16$ammonium))
dt16$phos <- ifelse((trimws(as.character(dt16$phos))==trimws("NA")),NA,dt16$phos)               
suppressWarnings(dt16$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$phos))==as.character(as.numeric("NA"))),NA,dt16$phos))
dt16$SRL <- ifelse((trimws(as.character(dt16$SRL))==trimws("NA")),NA,dt16$SRL)               
suppressWarnings(dt16$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$SRL))==as.character(as.numeric("NA"))),NA,dt16$SRL))
dt16$SLA <- ifelse((trimws(as.character(dt16$SLA))==trimws("NA")),NA,dt16$SLA)               
suppressWarnings(dt16$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$SLA))==as.character(as.numeric("NA"))),NA,dt16$SLA))
dt16$herbivory_perc <- ifelse((trimws(as.character(dt16$herbivory_perc))==trimws("NA")),NA,dt16$herbivory_perc)               
suppressWarnings(dt16$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt16$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt16$herbivory_perc))


# Here is the structure of the input data frame:
str(dt16)                            
attach(dt16)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt16$sample))
detach(dt16)               


# inUrl17  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/ec421e59d3c61bd0f0bb00e2239e176a" 
infile17 <- "../raw_data/knb-lter-sev.332.2/SCSCsumOTU.perc_long.csv"
# try(download.file(inUrl17,infile17,method="curl"))
# if (is.na(file.size(infile17))) download.file(inUrl17,infile17,method="auto")


dt17 <-read.csv(infile17,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "OTU",     
                  "Percent"    ), check.names=TRUE)

# unlink(infile17)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt17$sample)!="factor") dt17$sample<- as.factor(dt17$sample)
if (class(dt17$OTU)!="factor") dt17$OTU<- as.factor(dt17$OTU)
if (class(dt17$Percent)=="factor") dt17$Percent <-as.numeric(levels(dt17$Percent))[as.integer(dt17$Percent) ]               
if (class(dt17$Percent)=="character") dt17$Percent <-as.numeric(dt17$Percent)

# Convert Missing Values to NA for non-dates

dt17$sample <- as.factor(ifelse((trimws(as.character(dt17$sample))==trimws("NA")),NA,as.character(dt17$sample)))
dt17$OTU <- as.factor(ifelse((trimws(as.character(dt17$OTU))==trimws("NA")),NA,as.character(dt17$OTU)))
dt17$Percent <- ifelse((trimws(as.character(dt17$Percent))==trimws("NA")),NA,dt17$Percent)               
suppressWarnings(dt17$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt17$Percent))==as.character(as.numeric("NA"))),NA,dt17$Percent))


# Here is the structure of the input data frame:
str(dt17)                            
attach(dt17)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt17$sample)) 
summary(as.factor(dt17$OTU))
detach(dt17)               


# inUrl18  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/86f17de26c5cf53b6b90c7bf2f0014ce" 
infile18 <- "../raw_data/knb-lter-sev.332.2/env_gdm.csv"
# try(download.file(inUrl18,infile18,method="curl"))
# if (is.na(file.size(infile18))) download.file(inUrl18,infile18,method="auto")


dt18 <-read.csv(infile18,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "latitude",     
                  "longitude",     
                  "elevation_m",     
                  "GDD2015",     
                  "ppt2015",     
                  "GWC",     
                  "pH",     
                  "ammonium",     
                  "phos",     
                  "SRL",     
                  "SLA",     
                  "herbivory_perc"    ), check.names=TRUE)

# unlink(infile18)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt18$sample)!="factor") dt18$sample<- as.factor(dt18$sample)
if (class(dt18$latitude)=="factor") dt18$latitude <-as.numeric(levels(dt18$latitude))[as.integer(dt18$latitude) ]               
if (class(dt18$latitude)=="character") dt18$latitude <-as.numeric(dt18$latitude)
if (class(dt18$longitude)=="factor") dt18$longitude <-as.numeric(levels(dt18$longitude))[as.integer(dt18$longitude) ]               
if (class(dt18$longitude)=="character") dt18$longitude <-as.numeric(dt18$longitude)
if (class(dt18$elevation_m)=="factor") dt18$elevation_m <-as.numeric(levels(dt18$elevation_m))[as.integer(dt18$elevation_m) ]               
if (class(dt18$elevation_m)=="character") dt18$elevation_m <-as.numeric(dt18$elevation_m)
if (class(dt18$GDD2015)=="factor") dt18$GDD2015 <-as.numeric(levels(dt18$GDD2015))[as.integer(dt18$GDD2015) ]               
if (class(dt18$GDD2015)=="character") dt18$GDD2015 <-as.numeric(dt18$GDD2015)
if (class(dt18$ppt2015)=="factor") dt18$ppt2015 <-as.numeric(levels(dt18$ppt2015))[as.integer(dt18$ppt2015) ]               
if (class(dt18$ppt2015)=="character") dt18$ppt2015 <-as.numeric(dt18$ppt2015)
if (class(dt18$GWC)=="factor") dt18$GWC <-as.numeric(levels(dt18$GWC))[as.integer(dt18$GWC) ]               
if (class(dt18$GWC)=="character") dt18$GWC <-as.numeric(dt18$GWC)
if (class(dt18$pH)=="factor") dt18$pH <-as.numeric(levels(dt18$pH))[as.integer(dt18$pH) ]               
if (class(dt18$pH)=="character") dt18$pH <-as.numeric(dt18$pH)
if (class(dt18$ammonium)=="factor") dt18$ammonium <-as.numeric(levels(dt18$ammonium))[as.integer(dt18$ammonium) ]               
if (class(dt18$ammonium)=="character") dt18$ammonium <-as.numeric(dt18$ammonium)
if (class(dt18$phos)=="factor") dt18$phos <-as.numeric(levels(dt18$phos))[as.integer(dt18$phos) ]               
if (class(dt18$phos)=="character") dt18$phos <-as.numeric(dt18$phos)
if (class(dt18$SRL)=="factor") dt18$SRL <-as.numeric(levels(dt18$SRL))[as.integer(dt18$SRL) ]               
if (class(dt18$SRL)=="character") dt18$SRL <-as.numeric(dt18$SRL)
if (class(dt18$SLA)=="factor") dt18$SLA <-as.numeric(levels(dt18$SLA))[as.integer(dt18$SLA) ]               
if (class(dt18$SLA)=="character") dt18$SLA <-as.numeric(dt18$SLA)
if (class(dt18$herbivory_perc)=="factor") dt18$herbivory_perc <-as.numeric(levels(dt18$herbivory_perc))[as.integer(dt18$herbivory_perc) ]               
if (class(dt18$herbivory_perc)=="character") dt18$herbivory_perc <-as.numeric(dt18$herbivory_perc)

# Convert Missing Values to NA for non-dates

dt18$sample <- as.factor(ifelse((trimws(as.character(dt18$sample))==trimws("NA")),NA,as.character(dt18$sample)))
dt18$latitude <- ifelse((trimws(as.character(dt18$latitude))==trimws("NA")),NA,dt18$latitude)               
suppressWarnings(dt18$latitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$latitude))==as.character(as.numeric("NA"))),NA,dt18$latitude))
dt18$longitude <- ifelse((trimws(as.character(dt18$longitude))==trimws("NA")),NA,dt18$longitude)               
suppressWarnings(dt18$longitude <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$longitude))==as.character(as.numeric("NA"))),NA,dt18$longitude))
dt18$elevation_m <- ifelse((trimws(as.character(dt18$elevation_m))==trimws("NA")),NA,dt18$elevation_m)               
suppressWarnings(dt18$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$elevation_m))==as.character(as.numeric("NA"))),NA,dt18$elevation_m))
dt18$GDD2015 <- ifelse((trimws(as.character(dt18$GDD2015))==trimws("NA")),NA,dt18$GDD2015)               
suppressWarnings(dt18$GDD2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$GDD2015))==as.character(as.numeric("NA"))),NA,dt18$GDD2015))
dt18$ppt2015 <- ifelse((trimws(as.character(dt18$ppt2015))==trimws("NA")),NA,dt18$ppt2015)               
suppressWarnings(dt18$ppt2015 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$ppt2015))==as.character(as.numeric("NA"))),NA,dt18$ppt2015))
dt18$GWC <- ifelse((trimws(as.character(dt18$GWC))==trimws("NA")),NA,dt18$GWC)               
suppressWarnings(dt18$GWC <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$GWC))==as.character(as.numeric("NA"))),NA,dt18$GWC))
dt18$pH <- ifelse((trimws(as.character(dt18$pH))==trimws("NA")),NA,dt18$pH)               
suppressWarnings(dt18$pH <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$pH))==as.character(as.numeric("NA"))),NA,dt18$pH))
dt18$ammonium <- ifelse((trimws(as.character(dt18$ammonium))==trimws("NA")),NA,dt18$ammonium)               
suppressWarnings(dt18$ammonium <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$ammonium))==as.character(as.numeric("NA"))),NA,dt18$ammonium))
dt18$phos <- ifelse((trimws(as.character(dt18$phos))==trimws("NA")),NA,dt18$phos)               
suppressWarnings(dt18$phos <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$phos))==as.character(as.numeric("NA"))),NA,dt18$phos))
dt18$SRL <- ifelse((trimws(as.character(dt18$SRL))==trimws("NA")),NA,dt18$SRL)               
suppressWarnings(dt18$SRL <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$SRL))==as.character(as.numeric("NA"))),NA,dt18$SRL))
dt18$SLA <- ifelse((trimws(as.character(dt18$SLA))==trimws("NA")),NA,dt18$SLA)               
suppressWarnings(dt18$SLA <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$SLA))==as.character(as.numeric("NA"))),NA,dt18$SLA))
dt18$herbivory_perc <- ifelse((trimws(as.character(dt18$herbivory_perc))==trimws("NA")),NA,dt18$herbivory_perc)               
suppressWarnings(dt18$herbivory_perc <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt18$herbivory_perc))==as.character(as.numeric("NA"))),NA,dt18$herbivory_perc))


# Here is the structure of the input data frame:
str(dt18)                            
attach(dt18)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(latitude)
summary(longitude)
summary(elevation_m)
summary(GDD2015)
summary(ppt2015)
summary(GWC)
summary(pH)
summary(ammonium)
summary(phos)
summary(SRL)
summary(SLA)
summary(herbivory_perc) 
# Get more details on character variables

summary(as.factor(dt18$sample))
detach(dt18)               


# inUrl19  <- "https://pasta.lternet.edu/package/data/eml/knb-lter-sev/332/1/80666e34cc6e5eae0784b844114c008c" 
infile19 <- "../raw_data/knb-lter-sev.332.2/otu_gdm_indiv_long.csv"
# try(download.file(inUrl19,infile19,method="curl"))
# if (is.na(file.size(infile19))) download.file(inUrl19,infile19,method="auto")


dt19 <-read.csv(infile19,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "sample",     
                  "row_number",     
                  "OTU",     
                  "Percent"    ), check.names=TRUE)

# unlink(infile19)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt19$sample)!="factor") dt19$sample<- as.factor(dt19$sample)
if (class(dt19$row_number)!="factor") dt19$row_number<- as.factor(dt19$row_number)
if (class(dt19$OTU)!="factor") dt19$OTU<- as.factor(dt19$OTU)
if (class(dt19$Percent)=="factor") dt19$Percent <-as.numeric(levels(dt19$Percent))[as.integer(dt19$Percent) ]               
if (class(dt19$Percent)=="character") dt19$Percent <-as.numeric(dt19$Percent)

# Convert Missing Values to NA for non-dates

dt19$sample <- as.factor(ifelse((trimws(as.character(dt19$sample))==trimws("NA")),NA,as.character(dt19$sample)))
dt19$row_number <- as.factor(ifelse((trimws(as.character(dt19$row_number))==trimws("NA")),NA,as.character(dt19$row_number)))
dt19$OTU <- as.factor(ifelse((trimws(as.character(dt19$OTU))==trimws("NA")),NA,as.character(dt19$OTU)))
dt19$Percent <- ifelse((trimws(as.character(dt19$Percent))==trimws("NA")),NA,dt19$Percent)               
suppressWarnings(dt19$Percent <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt19$Percent))==as.character(as.numeric("NA"))),NA,dt19$Percent))


# Here is the structure of the input data frame:
str(dt19)                            
attach(dt19)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

summary(sample)
summary(row_number)
summary(OTU)
summary(Percent) 
# Get more details on character variables

summary(as.factor(dt19$sample)) 
summary(as.factor(dt19$row_number)) 
summary(as.factor(dt19$OTU))
detach(dt19)               





