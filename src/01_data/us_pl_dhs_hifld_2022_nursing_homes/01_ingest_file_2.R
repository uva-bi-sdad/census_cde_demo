# dataset creation code - data source ingest - file 2
# source file: https://www.arcgis.com/sharing/rest/content/items/78c58035fb3942ba82af991bb4476f13/info/metadata/metadata.xml

# Import source file and save to original for backup
source_file <- "https://www.arcgis.com/sharing/rest/content/items/78c58035fb3942ba82af991bb4476f13/info/metadata/metadata.xml"
download.file(source_file, "docs/01_data/us_pl_dhs_hifld_2022_nursing_homes/us_pl_dhs_hifld_2022_nursing_homes.xml")
