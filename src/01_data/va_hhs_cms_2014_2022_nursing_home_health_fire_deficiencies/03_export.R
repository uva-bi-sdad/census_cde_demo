dt <- fread("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/us_hhs_cms_2014_2022_nursing_home_providers.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "us_hhs_cms_2014_2022_nursing_home_providers",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)

dt <- fread("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2014_2022_nursing_home_deficiencies.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_hhs_cms_2014_2022_nursing_home_deficiencies",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)

dt <- fread("data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2014_2022_nursing_home_providers.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_hhs_cms_2014_2022_nursing_home_providers",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)
