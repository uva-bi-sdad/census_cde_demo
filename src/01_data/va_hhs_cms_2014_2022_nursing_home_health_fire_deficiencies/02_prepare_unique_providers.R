# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
library(data.table)
library(tibble)
library(dplyr)
library(tidygeocoder)

csv_files <-
  list.files(
    path = "data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/working",
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
    "fed_provider_num",
    "provider_name",
    "provider_address",
    "provider_city",
    "provider_state",
    "provider_zip_code",
    "survey_date"
  )
dt_all_unq <- unique(dt_all)
dt_all_unq <- dt_all_unq[order(federal_provider_number, -survey_date)]
dt_all_unq_dedup <- dedup_choice_by_key(dt_all_unq[, c(1,2,3,4,5,6)], key = "fed_provider_num")

# dt_all_unq_dedup <- fread("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/us_hhs_cms_2014_2022_nursing_home_providers.csv")

dt_va_unq_dedup <- dt_all_unq_dedup[provider_state=="VA"]
dt_va_unq_dedup$provider_address_full <- paste(dt_va_unq_dedup$provider_address, 
                                               dt_va_unq_dedup$provider_city, 
                                               dt_va_unq_dedup$provider_state, 
                                               dt_va_unq_dedup$provider_zip_code)

dt_va_unq_dedup_google <- dt_va_unq_dedup %>%
  geocode(address = provider_address_full,
          method="google", 
          full_results=TRUE)

setDT(dt_va_unq_dedup_google)
# street=provider_address, 
# city=provider_city, 
# state=provider_state,
# postalcode=provider_zip_code,

fwrite(dt_all_unq_dedup, "data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/us_hhs_cms_2014_2022_nursing_home_providers.csv")

fwrite(dt_va_unq_dedup_google[, .(fed_provider_num, 
                                  lat, 
                                  long,
                                  provider_name, 
                                  provider_address, 
                                  provider_city, 
                                  provider_state, 
                                  provider_zip_code, 
                                  provider_address_full)],
       "data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2014_2022_nursing_home_providers.csv")

# Update file manifest
data_file_checksums()
