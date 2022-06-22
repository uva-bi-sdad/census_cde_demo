sf <- sf::st_read("data/us_pl_dhs_hifld_2022_nursing_homes/distribution/us_pl_dhs_hifld_2022_nursing_homes.geojson")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "us_pl_dhs_hifld_2022_nursing_homes",
                table_data = sf,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)


