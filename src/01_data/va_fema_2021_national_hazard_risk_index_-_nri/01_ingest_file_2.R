# dataset creation code - data source ingest - file 1
# source file: https://hazards.fema.gov/nri/Content/StaticDocuments/DataDownload//NRI_Table_CensusTracts/NRI_Table_CensusTracts_Virginia.zip

# Import source file and save to original for backup
source_file <- "https://www.fema.gov/sites/default/files/documents/fema_national-risk-index_technical-documentation.pdf"
download.file(source_file, "docs/01_data/va_fema_2021_national_hazard_risk_index_-_nri/fema_national-risk-index_technical-documentation.pdf")

