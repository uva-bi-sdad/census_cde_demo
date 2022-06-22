dt <- fread("data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_tract_fema_2021_national_hazard_risk_index_-_nri",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)
