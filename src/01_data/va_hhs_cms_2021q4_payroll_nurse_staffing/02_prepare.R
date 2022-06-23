# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
va_hhs_cms_2021q4_payroll_nurse_staffing <- jsonlite::read_json("data/va_hhs_cms_2021q4_payroll_nurse_staffing/original/va_hhs_cms_2021q4_payroll_nurse_staffing.json")

file_paths <- list.files("data/va_hhs_cms_2021q4_payroll_nurse_staffing/original", pattern = "*.json", full.names = T)

if(exists("dt_fin")) rm(dt_fin)
for (f in file_paths) {
  dt <- data.table::rbindlist(jsonlite::read_json(f))
  if(exists("dt_fin")) {
    dt_fin <- data.table::rbindlist(list(dt_fin, dt))
  } else {
    dt_fin <- dt
  }
}

one <- data.table::rbindlist(jsonlite::read_json(file_paths[1]))
two <- data.table::rbindlist(jsonlite::read_json(file_paths[2]))
three <- data.table::rbindlist(jsonlite::read_json(file_paths[3]))

va_hhs_cms_2021q4_payroll_nurse_staffing_ <- rbindlist(va_hhs_cms_2021q4_payroll_nurse_staffing)




# Assign geoid
va_hhs_cms_2021q4_payroll_nurse_staffing$geoid <- ""

# Assign region_type
va_hhs_cms_2021q4_payroll_nurse_staffing$region_type <- ""

# Assign region_name
va_hhs_cms_2021q4_payroll_nurse_staffing$region_name <- ""

# Assign year
va_hhs_cms_2021q4_payroll_nurse_staffing$year <- "2021Q4"

# measure, measure_type, and value need to be included in non-geo datasets

# Select final columns
final_dataset <- va_hhs_cms_2021q4_payroll_nurse_staffing[, c("geoid", "region_name", "region_type", "year", "geometry", "measure", "measure_unit", "measure_type", "value")]

# Simplify the geography
final_dataset_simplified <- rmapshaper::ms_simplify(final_dataset)

# Export final dataset
sf::st_write(final_dataset_simplified, "data/va_hhs_cms_2021q4_payroll_nurse_staffing/distribution/va_hhs_cms_2021q4_payroll_nurse_staffing.geojson")

# Update file manifest
data_file_checksums()


va <- pbj_daily_nurse_staffing_cy_2020q4[pbj_daily_nurse_staffing_cy_2020q4$STATE=="VA",]

seq <- seq(1, 25760, 5000)

for (i in 1:length(seq)){
  print(paste(seq[i], seq[i+1]-1))
}
seq[1]
