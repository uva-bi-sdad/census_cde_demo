library(data.table)
library(magrittr)
library(tidygeocoder)

dt <- fread("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/original/va_hhs_cms_2022_nursing_home_providers.csv")

dt_va_unq_dedup_google <- dt %>%
  geocode(address = location,
          method="google", 
          full_results=FALSE)

fwrite(dt_va_unq_dedup_google, "data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2022_nursing_home_providers.csv")

# Update file manifest
data_file_checksums()



# test <- dt_va_unq_dedup_google[, c("federal_provider_number", "provider_name", "lat", "long")]
# 
# test_sf <- sf::st_as_sf(test, coords = c("long", "lat"))
# plot(sf::st_geometry(test_sf))
