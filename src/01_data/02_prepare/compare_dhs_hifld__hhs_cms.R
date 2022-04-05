library(sf)
library(data.table)

# Get CMS and HIFLD nursing home data from db
con <- get_db_conn()
us_pl_hhscms_2022_skilled_nursing_homes <-
  setDT(
    st_read(
      con,
      query = "select *
               from census_cde_demo.us_pl_hhscms_2022_skilled_nursing_homes
               where \"State\" = 'VA' "
    )
  )

va_pl_hifld_2022_nursing_homes <-
  setDT(
    st_read(
      con,
      query = "select *
               from census_cde_demo.us_pl_hifld_2022_nursing_homes
               where \"STATE\" = 'VA' "
    )
  )
DBI::dbDisconnect(con)

# Compare
## CMS Nursing Home Count
length(unique(us_pl_hhscms_2022_skilled_nursing_homes$`CMS Certification Number (CCN)`))

## HIFLD Virginia Nursing Homes Count
length(unique(va_pl_hifld_2022_nursing_homes$ID))
