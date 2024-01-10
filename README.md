# KSU Paired 16S & ITS Amplicon Data Analysis Project

Comparing and contrasting dynamics of bacterial and fungal arid grassland communities. 
\
For results, go here: https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html 

## Subfolders

### raw_data

-   Folder for raw data

### metadata

-   Folder for metadata

### analyses

-   Folder for output of analyses (typically .txt or .csv files). Does not include visualizations (see docs folder)
-   **taxonomy**
    -   OTU relative abundance agglomerated to all taxonomic ranks
-   **ordinations**
    -   NMDS
-   **nestedness**
    -   nestedness vs turnover

### docs

-   Hosting Github Page for html output of data visualizations (https://kellifeeser.github.io/ksu-paired-amplicon-workflow/index.html)

### processed_data

-   Folder for storing outputs or any data processed from raw data including phyloseq objects (in subfolder **clean_rds_saves**

### code

-   Folder keeping scripts (mostly R/RMD)
