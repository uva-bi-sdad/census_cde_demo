library(sf)
library(data.table)

us_pl_hifld_2022_nursing_homes <- st_read("data/working/dhs_hifld_nursing_homes/us_pl_hifld_2022_nursing_homes.geojson")
va_pl_hifld_2022_nursing_homes <- us_pl_hifld_2022_nursing_homes[us_pl_hifld_2022_nursing_homes$STATE=="VA",]

# HIFLD Virginia Nursing Homes Count
va_pl_hifld_2022_nursing_homes_count <-  length(unique(va_pl_hifld_2022_nursing_homes$ID))
print(va_pl_hifld_2022_nursing_homes_count)



us_pl_hhscms_2022_skilled_nursing_homes <- fread("data/working/hhs_cms_nursing_homes/Skilled_Nursing_Facility_Quality_Reporting_Program_Provider_Data_Mar2022.csv")
va_pl_hhscms_2022_skilled_nursing_homes <- us_pl_hhscms_2022_nurising_homes[State=="VA",]

length(unique(va_pl_hhscms_2022_skilled_nursing_homes$`CMS Certification Number (CCN)`))
