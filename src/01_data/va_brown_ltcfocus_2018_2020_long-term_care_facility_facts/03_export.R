dt <- fread("data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/distribution/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con, 
                schema_name = "census_cde_demo", 
                table_name = "va_brown_ltcfocus_2018_2020_long-term_care_facility_facts",
                table_data = dt,
                table_owner = "census_cde_demo")
DBI::dbDisconnect(con)
