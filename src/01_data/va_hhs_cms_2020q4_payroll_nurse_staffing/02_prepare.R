# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
va_hhs_cms_2020q4_payroll_nurse_staffing <- sf::st_read("data/va_hhs_cms_2020q4_payroll_nurse_staffing/original/va_hhs_cms_2020q4_payroll_nurse_staffing.json")

va_hhs_cms_2020q4_payroll_nurse_staffing <- 

# Assign geoid
va_hhs_cms_2020q4_payroll_nurse_staffing$geoid <- ""

# Assign region_type
va_hhs_cms_2020q4_payroll_nurse_staffing$region_type <- ""

# Assign region_name
va_hhs_cms_2020q4_payroll_nurse_staffing$region_name <- ""

# Assign year
va_hhs_cms_2020q4_payroll_nurse_staffing$year <- "2020Q4"

# measure, measure_type, and value need to be included in non-geo datasets

# Select final columns
final_dataset <- va_hhs_cms_2020q4_payroll_nurse_staffing[, c("geoid", "region_name", "region_type", "year", "geometry", "measure", "measure_unit", "measure_type", "value")]

# Simplify the geography
final_dataset_simplified <- rmapshaper::ms_simplify(final_dataset)

# Export final dataset
sf::st_write(final_dataset_simplified, "data/va_hhs_cms_2020q4_payroll_nurse_staffing/distribution/va_hhs_cms_2020q4_payroll_nurse_staffing.geojson")

# Update file manifest
data_file_checksums()
