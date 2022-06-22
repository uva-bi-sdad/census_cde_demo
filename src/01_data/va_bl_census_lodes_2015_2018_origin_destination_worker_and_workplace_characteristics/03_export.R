dt <- fread(cmd = 'unzip -cq data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_rac.zip')
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_tract_lodes_2015_2018_rac",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)

dt <- fread(cmd = 'unzip -cq data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_wac.zip')
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_tract_lodes_2015_2018_wac",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)

dt <- fread(cmd = 'unzip -cq data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_od.zip')
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_tract_lodes_2015_2018_od",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)