# dataset creation code - data source ingest - file 1
# source file: https://opendata.arcgis.com/datasets/78c58035fb3942ba82af991bb4476f13_0.geojson

# Import source file and save to original for backup
source_file <- "https://opendata.arcgis.com/datasets/78c58035fb3942ba82af991bb4476f13_0.geojson"
download.file(source_file, "data/us_pl_dhs_hifld_2022_nursing_homes/original/us_pl_dhs_hifld_2022_nursing_homes.geojson")
