library(data.table)
library(sf)

# data file
va_fema_risks <- fread("data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri_std.csv", colClasses = "character")
# geo file from github.com/uva-bi-sdad/dc.geographies
va_tracts <- st_read("https://github.com/uva-bi-sdad/dc.geographies/blob/main/data/va_geo_census_cb_2020_census_tracts/distribution/va_geo_census_cb_2020_census_tracts.geojson?raw=T")

# select measure "risk_score"
va_fema_risks_score <- va_fema_risks[measure == "risk_score", .(geoid, year, value)]
# select geo cols - leaving out year of geo file
va_fema_risks_score_tracts <- merge(va_fema_risks_score, va_tracts[, c("geoid", "region_name", "geometry")])
# convert back to sf (geo)
va_fema_risks_score_tracts <- st_as_sf(va_fema_risks_score_tracts)

# plot
plot(va_fema_risks_score_tracts[, c("value")])
