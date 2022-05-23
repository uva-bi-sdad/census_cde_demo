# dataset creation code - data source ingest - file 1
# source file: https://hazards.fema.gov/nri/Content/StaticDocuments/DataDownload//NRI_Table_CensusTracts/NRI_Table_CensusTracts_Virginia.zip

# Import source file and save to original for backup
source_file <- "https://hazards.geoplatform.gov/server/rest/services/Hosted/NRI_Counties_(October_2020)/FeatureServer/0"
download.file(source_file, "docs/01_data/va_fema_2021_national_hazard_risk_index_-_nri/NRI_Counties_(October_2020)-HAS-COL-DEFINITIONS.html")

