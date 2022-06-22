dt <- fread("data/va_vdss_alf_2022_assisted_living_facilities/distribution/va_vdss_alf_2022_assisted_living_facilities.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_vdss_alf_2022_assisted_living_facilities",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)
