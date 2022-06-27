# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
file_paths <- list.files("data/va_hhs_cms_2019q4_payroll_nurse_staffing/original", pattern = "*.json", full.names = T)

if(exists("dt_fin")) rm(dt_fin)
for (f in file_paths) {
  dt <- data.table::rbindlist(jsonlite::read_json(f))
  if(exists("dt_fin")) {
    dt_fin <- data.table::rbindlist(list(dt_fin, dt))
  } else {
    dt_fin <- dt
  }
}

va_hhs_cms_2019q4_payroll_nurse_staffing <- unique(dt_fin)


# Export final dataset
data.table::fwrite(va_hhs_cms_2019q4_payroll_nurse_staffing, "data/va_hhs_cms_2019q4_payroll_nurse_staffing/distribution/va_hhs_cms_2019q4_payroll_nurse_staffing.csv")

# Update file manifest
data_file_checksums()
