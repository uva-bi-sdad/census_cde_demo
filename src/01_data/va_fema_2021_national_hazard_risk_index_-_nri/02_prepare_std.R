# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
unzip("data/va_fema_2021_national_hazard_risk_index_-_nri/original/NRI_Table_CensusTracts_Virginia.zip", 
      exdir = "data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia")


va_fema_2021_national_hazard_risk_index <- fread("data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia/NRI_Table_CensusTracts_Virginia.csv")
colnames(va_fema_2021_national_hazard_risk_index) <- tolower(colnames(va_fema_2021_national_hazard_risk_index))

unlink("data/va_fema_2021_national_hazard_risk_index_-_nri/working/NRI_Table_CensusTracts_Virginia", recursive = T)


va_fema_2021_national_hazard_risk_index$oid_ <- NULL
va_fema_2021_national_hazard_risk_index$nri_id <- NULL
va_fema_2021_national_hazard_risk_index$nri_ver <- NULL
va_fema_2021_national_hazard_risk_index$stateabbrv <- NULL
va_fema_2021_national_hazard_risk_index$statefips <- NULL
va_fema_2021_national_hazard_risk_index$countyfips <- NULL
va_fema_2021_national_hazard_risk_index$stcofips <- NULL

# Restructure by id(s) and create measure and value columns
va_fema_2021_national_hazard_risk_index_lng <- 
  melt(va_fema_2021_national_hazard_risk_index,
       id.vars = c("state", "county", "countytype", "tract", "tractfips"),
       variable.name = "measure",
       value.name = "value",
       na.rm = TRUE,
       variable.factor = FALSE)

# Assign geoid
va_fema_2021_national_hazard_risk_index_lng$geoid <- va_fema_2021_national_hazard_risk_index_lng$tractfips

# Assign region_type
va_fema_2021_national_hazard_risk_index_lng$region_type <- "tract"

# Assign region_name
va_fema_2021_national_hazard_risk_index_lng$region_name <- 
  stringr::str_to_title(
    paste0(
      "Census Tract ",
      va_fema_2021_national_hazard_risk_index_lng$tract,
      ", ",
      va_fema_2021_national_hazard_risk_index_lng$county,
      " ",
      va_fema_2021_national_hazard_risk_index_lng$countytype,
      ", ",
      va_fema_2021_national_hazard_risk_index_lng$state
    )
  )



# Assign year
va_fema_2021_national_hazard_risk_index_lng$year <- "2021"

# Assign measure_type
va_fema_2021_national_hazard_risk_index_lng$measure_type <- character()
va_fema_2021_national_hazard_risk_index_lng[measure == "population", measure_type := "attribute"]
va_fema_2021_national_hazard_risk_index_lng[measure == "area", measure_type := "attribute"]
va_fema_2021_national_hazard_risk_index_lng[measure %like% "value", measure_type := "money value"]
va_fema_2021_national_hazard_risk_index_lng[measure %like% "ratng", measure_type := "rating"]
va_fema_2021_national_hazard_risk_index_lng[measure %like% "riskr", measure_type := "rating"]

# Select final columns
final_dataset <- va_fema_2021_national_hazard_risk_index_lng[, c("geoid", "year", "measure", "value", "measure_type")]

# Simplify the geography
#final_dataset_simplified <- rmapshaper::ms_simplify(final_dataset)

# Export final dataset
fwrite(final_dataset, "data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri_std.csv")

# Update file manifest
data_file_checksums()
