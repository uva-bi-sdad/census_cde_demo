# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
library(data.table)

csv_files <-
  list.files(
    path = "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working",
    pattern = "*.csv",
    recursive = T,
    full.names = T
  )

if (exists("dt_all")) rm(dt_all)
for (f in csv_files) {
  print(basename(f))
  dt <- fread(f, select = c(1,2,3,4,5,6,7))
  if (exists("dt_all")) dt_all <- rbindlist(list(dt_all, dt), use.names = F)
  else dt_all <- dt
}

colnames(dt_all) <-
  c(
    "federal_provider_number",
    "provider_name",
    "provider_address",
    "provider_city",
    "provider_state",
    "provider_zip_code",
    "survey_date"
  )
dt_all_unq <- unique(dt_all)
dt_all_unq <- dt_all_unq[order(federal_provider_number, -survey_date)]
dt_all_unq_dedup <- dedup_choice_by_key(dt_all_unq[, c(1,2,3,4,5,6)], key = "federal_provider_number")


fwrite(dt_all_unq_dedup, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/distribution/us_pl_cms_2018_2022_nursing_home_providers.csv")

# Update file manifest
data_file_checksums()
