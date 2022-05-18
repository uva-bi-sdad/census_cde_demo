# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
us_pl_dhs_hifld_2022_nursing_homes <- sf::st_read("data/us_pl_dhs_hifld_2022_nursing_homes/original/us_pl_dhs_hifld_2022_nursing_homes.geojson")
us_pl_dhs_hifld_2022_nursing_homes$OBJECTID <- NULL
colnames(us_pl_dhs_hifld_2022_nursing_homes) <- tolower(colnames(us_pl_dhs_hifld_2022_nursing_homes))


# Export final dataset
sf::st_write(us_pl_dhs_hifld_2022_nursing_homes, "data/us_pl_dhs_hifld_2022_nursing_homes/distribution/us_pl_dhs_hifld_2022_nursing_homes.geojson")

# Update file manifest
data_file_checksums()
