# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
unzip("data/va_fema_2021_national_hazard_risk_index_-_nri/original/NRI_Table_CensusTracts_Virginia.zip", 
      exdir = "data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia")


va_fema_2021_national_hazard_risk_index <- fread("data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia/NRI_Table_CensusTracts_Virginia.csv")
colnames(va_fema_2021_national_hazard_risk_index) <- tolower(colnames(va_fema_2021_national_hazard_risk_index))

# Export final dataset
fwrite(va_fema_2021_national_hazard_risk_index, "data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri.csv")

# Update file manifest
data_file_checksums()
