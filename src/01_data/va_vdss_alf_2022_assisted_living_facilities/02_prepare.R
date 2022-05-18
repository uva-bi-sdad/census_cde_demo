# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)
library(sf)
library(data.table)
# Import file from original

va_vdss_alf_2022_assisted_living_facilities_links <- st_read("data/va_vdss_alf_2022_assisted_living_facilities/working/va_vdss_alf_2022_assisted_living_facilities_links.csv")
va_vdss_alf_2022_assisted_living_facilities_info <- st_read("data/va_vdss_alf_2022_assisted_living_facilities/working/va_vdss_alf_2022_assisted_living_facilities_info.csv")


va_vdss_alf_2022_assisted_living_facilities <- merge(va_vdss_alf_2022_assisted_living_facilities_links,
                                                     va_vdss_alf_2022_assisted_living_facilities_info,
                                                     by = "fac_id")

# Export final dataset
fwrite(va_vdss_alf_2022_assisted_living_facilities, "data/va_vdss_alf_2022_assisted_living_facilities/distribution/va_vdss_alf_2022_assisted_living_facilities.csv")

# Update file manifest
data_file_checksums()
