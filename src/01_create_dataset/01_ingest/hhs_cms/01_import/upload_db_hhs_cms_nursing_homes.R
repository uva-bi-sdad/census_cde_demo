library(sf)
library(data.table)

us_pl_hhscms_2022_skilled_nursing_homes <- fread("data/working/hhs_cms_nursing_homes/Skilled_Nursing_Facility_Quality_Reporting_Program_Provider_Data_Mar2022.csv")
con <- get_db_conn()
dc_dbWriteTable(db_conn = con,
                schema_name = "census_cde_demo",
                table_name = "us_pl_hhscms_2022_skilled_nursing_homes",
                table_data = us_pl_hhscms_2022_skilled_nursing_homes)
DBI::dbDisconnect(con)