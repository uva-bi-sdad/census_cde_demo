# dataset creation code - data source ingest - file 1
# source file: https://hazards.fema.gov/nri/Content/StaticDocuments/DataDownload//NRI_Table_CensusTracts/NRI_Table_CensusTracts_Virginia.zip

# Import source file and save to original for backup
source_file <- "https://hazards.fema.gov/nri/Content/StaticDocuments/DataDownload//NRI_Table_CensusTracts/NRI_Table_CensusTracts_Virginia.zip"
download.file(source_file, "data/va_fema_2021_national_hazard_risk_index_-_nri/original/NRI_Table_CensusTracts_Virginia.zip")

file.copy("data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia/NRI_metadata_November2021.docx", "docs/01_data/va_fema_2021_national_hazard_risk_index_-_nri")
file.copy("data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia/NRI_metadata_November2021.xml", "docs/01_data/va_fema_2021_national_hazard_risk_index_-_nri")
