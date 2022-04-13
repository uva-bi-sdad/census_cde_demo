library(sf)
library(data.table)

va_pl_alf_2022_assisted_living_facilities_links <- st_read("data/working/vdss_alf_assisted_living_facilities/va_pl_alf_2022_assisted_living_facilities_links.csv")
va_pl_alf_2022_assisted_living_facilities_info <- st_read("data/working/vdss_alf_assisted_living_facilities/va_pl_alf_2022_assisted_living_facilities_info.csv")

va_pl_alf_2022_assisted_living_facilities <- merge(va_pl_alf_2022_assisted_living_facilities_links,
                                                   va_pl_alf_2022_assisted_living_facilities_info,
                                                   by = "fac_id")

con <- get_db_conn()
dc_dbWriteTable(db_conn = con,
                schema_name = "census_cde_demo",
                table_name = "va_pl_alf_2022_assisted_living_facilities",
                table_data = va_pl_alf_2022_assisted_living_facilities)
DBI::dbDisconnect(con)

xlsx::write.xlsx(va_pl_alf_2022_assisted_living_facilities, "data/working/vdss_alf_assisted_living_facilities/va_pl_alf_2022_assisted_living_facilities.xlsx")
