
# https://r-spatial.github.io/spdep/articles/CO69.html

library(spdep)
eire <- as(sf::st_read(system.file("shapes/eire.gpkg", package="spData")[1]), "Spatial")
row.names(eire) <- as.character(eire$names)
#proj4string(eire) <- CRS("+proj=utm +zone=30 +ellps=airy +units=km")