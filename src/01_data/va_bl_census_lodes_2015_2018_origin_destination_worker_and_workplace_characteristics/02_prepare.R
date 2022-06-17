# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original

zip("data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_od.zip",
    "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_od.csv")

zip("data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_rac.zip",
    "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_rac.csv")

zip("data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_wac.zip",
    "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_wac.csv")


# Update file manifest
data_file_checksums()
