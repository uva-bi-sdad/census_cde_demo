# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
facility_2018 <- readxl::read_excel("data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/original/facility_2018.xlsx", sheet = 1, col_names = T)
facility_2019 <- readxl::read_excel("data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/original/facility_2019.xlsx", sheet = 1, col_names = T)
facility_2020 <- readxl::read_excel("data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/original/facility_2020.xlsx", sheet = 1, col_names = T)

colnames(facility_2018) <- tolower(colnames(facility_2018))
colnames(facility_2019) <- tolower(colnames(facility_2019))
colnames(facility_2020) <- tolower(colnames(facility_2020))

va_brown_ltcfocus_2018_2020_long_term_care_facility_facts <- data.table::rbindlist(list(facility_2018, facility_2019, facility_2020), use.names = T, fill = T)

# # Assign geoid
# va_brown_ltcfocus_2018_2020_long-term_care_facility_facts$geoid <- ""
# 
# # Assign region_type
# va_brown_ltcfocus_2018_2020_long-term_care_facility_facts$region_type <- ""
# 
# # Assign region_name
# va_brown_ltcfocus_2018_2020_long-term_care_facility_facts$region_name <- ""
# 
# # Assign year
# va_brown_ltcfocus_2018_2020_long-term_care_facility_facts$year <- "2018"
# 
# # measure, measure_type, and value need to be included in non-geo datasets
# 
# # Select final columns
# final_dataset <- va_brown_ltcfocus_2018_2020_long-term_care_facility_facts[, c("geoid", "region_name", "region_type", "year", "geometry", "measure", "measure_unit", "measure_type", "value")]
# 
# # Simplify the geography
# final_dataset_simplified <- rmapshaper::ms_simplify(final_dataset)

# Export final dataset
sf::st_write(final_dataset_simplified, "data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/distribution/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts.geojson")

# Update file manifest
data_file_checksums()
