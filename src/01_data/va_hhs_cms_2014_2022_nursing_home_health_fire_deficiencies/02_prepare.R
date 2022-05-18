# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
nursing_homes_including_rehab_services_2022 <- sf::st_read("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/nursing_homes_including_rehab_services_2022.zip")
nursing_homes_including_rehab_services_2021 <- sf::st_read("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/nursing_homes_including_rehab_services_2021.zip")
nursing_homes_including_rehab_services_2020 <- sf::st_read("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/nursing_homes_including_rehab_services_2020.zip")
nursing_homes_including_rehab_services_2019 <- sf::st_read("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/nursing_homes_including_rehab_services_2019.zip")
nh_archive_2018 <- sf::st_read("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/nh_archive_2018.zip")

va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies <- 

# Assign geoid
va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies$geoid <- ""

# Assign region_type
va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies$region_type <- ""

# Assign region_name
va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies$region_name <- ""

# Assign year
va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies$year <- "2014"

# measure, measure_type, and value need to be included in non-geo datasets

# Select final columns
final_dataset <- va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies[, c("geoid", "region_name", "region_type", "year", "geometry", "measure", "measure_unit", "measure_type", "value")]

# Simplify the geography
final_dataset_simplified <- rmapshaper::ms_simplify(final_dataset)

# Export final dataset
sf::st_write(final_dataset_simplified, "data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies.geojson")

# Update file manifest
data_file_checksums()
