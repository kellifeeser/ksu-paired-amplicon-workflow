# extract and download MAP data for 2015
## CHELSAcruts - High resolution temperature and 
## precipitation timeseries for the 20th century and beyond

# home: https://opendata.swiss/en/dataset/chelsacruts-high-resolution-temperature-and-precipitation-timeseries-for-the-20th-century-and-b

# Data Access
# URL: https://envicloud.wsl.ch/#/?bucket=https%3A%2F%2Fos.zhdk.cloud.switch.ch%2Fchelsav1%2F&prefix=chelsa_cruts%2F
#   
#   CHELSAcruts is a delta change monthly climate dataset for the years 1901-2016 for mean monthly maximum temperatures, mean monthly minimum temperatures, and monthly precipitation sum.

# Additional information
# Identifier: 9c9c699a-e57f-49e9-b489-c6abdfa9b53b@envidat
# Issued date: October 29, 2018
# Modified date: September 19, 2024
# Contact points
#   EnviDat Support
#   Dirk Nikolaus Karger
# Landing page: https://www.envidat.ch/#/metadata/chelsacruts
  
library(raster)
library(data.table)

# mapping_coords_CHELSAcruts_prec2025.R

# 1. Load your coordinates file
site_coords <- fread("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/metadata/site_coords.csv")  # Ensure columns: latitude, longitude

# 2. Define CHELSA download URLs for monthly precip of 2015
months <- sprintf("%02d", 1:12)
# base_url <- "https://os.zhdk.cloud.switch.ch/envicloud/chelsa/chelsa_V1/climatologies/mswep_monthly/"

# Build full URLs and local filenames
# download_links <- paste0(
#   "https://os.zhdk.cloud.switch.ch/envicloud/chelsa/chelsa_V1/climatologies/mswep_monthly/CHELSAcruts_prec_", 
#   "2015_", months, ".tif"
# )
# file_names <- paste0("CHELSAcruts_prec_2015_", months, ".tif")
  # wget links
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_10_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_11_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_12_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_1_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_2_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_3_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_4_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_5_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_6_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_7_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_8_2015_V.1.0.tif 
    # https://os.zhdk.cloud.switch.ch/chelsav1/chelsa_cruts/prec/CHELSAcruts_prec_9_2015_V.1.0.tif 

# renaming files Jan-Sept to have 2 digit month names, eg.:
  # CHELSAcruts_prec_01_2015_V.1.0.tif

# 3. Download the files (run only once)
# dir.create("data/chelsa_2015", showWarnings = FALSE)
# for (i in seq_along(download_links)) {
#   destfile <- file.path("data/chelsa_2015", file_names[i])
#   if (!file.exists(destfile)) {
#     download.file(download_links[i], destfile, mode = "wb")
#   }
# }

# 4. Load and stack the rasters
raster_files <- list.files("/Users/L347123/Desktop/ksu-paired-amplicon-workflow/metadata/CHELSAcruts_2015", 
                           pattern = ".tif$", full.names = TRUE)
monthly_stack <- stack(raster_files)

# 5. Calculate annual MAP for 2015
precip_2015_total <- calc(monthly_stack, sum, na.rm = TRUE)

# 6. Extract MAP values
coords <- site_coords[, .(longitude, latitude)]  # raster expects order: lon, lat
site_coords$MAP_2015 <- raster::extract(precip_2015_total, coords)

# 7. Save result
fwrite(site_coords, "/Users/L347123/Desktop/ksu-paired-amplicon-workflow/metadata/CHELSAcruts_2015/site_coords_with_MAP_2015_rasterout.csv")
