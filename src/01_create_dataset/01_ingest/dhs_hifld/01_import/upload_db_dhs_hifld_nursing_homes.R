library(sf)
library(data.table)

us_pl_hifld_2022_nursing_homes <- st_read("data/working/dhs_hifld_nursing_homes/us_pl_hifld_2022_nursing_homes.geojson")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con,
                schema_name = "census_cde_demo",
                table_name = "us_pl_hifld_2022_nursing_homes",
                table_data = us_pl_hifld_2022_nursing_homes)
DBI::dbDisconnect(con)
