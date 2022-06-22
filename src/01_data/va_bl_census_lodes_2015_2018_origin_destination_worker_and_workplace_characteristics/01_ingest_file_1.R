# dataset creation code - data source ingest - file 1

library(lehdr)
lodes_od <- grab_lodes(state = "va", year = c(2015, 2016, 2017, 2018), lodes_type = "od", job_type = "JT01", 
           segment = "S000", state_part = "main", agg_geo = "tract")

fwrite(lodes_od, "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_od.csv")

lodes_rac <- grab_lodes(state = "va", year = c(2015, 2016, 2017, 2018), lodes_type = "rac", job_type = "JT01", 
                        segment = "S000", state_part = "main", agg_geo = "tract")

fwrite(lodes_rac, "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_rac.csv")


lodes_wac <- grab_lodes(state = "va", year = c(2015, 2016, 2017, 2018), lodes_type = "wac", job_type = "JT01", 
                       segment = "S000", state_part = "main", agg_geo = "tract")

fwrite(lodes_wac, "data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/original/va_tract_lodes_2015_2018_wac.csv")
