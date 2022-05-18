# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
library(data.table)

if (exists("dt_all")) rm(dt_all)
compile_deficiencies <- function(file_list) {
  if (exists("dt_all")) rm(dt_all)
  for (f in file_list) {
    print(basename(f))
    if (exists("dt")) rm(dt)
    if (exists("dtt")) rm(dtt)
    
    dt_col_names <- colnames(fread(f, nrows = 0))
    
    col_list <- list(
      fed_provider_num = dt_col_names[dt_col_names %ilike% "provnum" | dt_col_names %ilike% "federal"],
      survey_date = dt_col_names[dt_col_names %ilike% "survey_date" | dt_col_names %ilike% "survey date"],
      survey_type = dt_col_names[dt_col_names %ilike% "type$"],
      deficiency_prefix = dt_col_names[dt_col_names %ilike% "defpref" | dt_col_names %ilike% "prefix"],
      category = dt_col_names[dt_col_names %ilike% "category$"],
      deficiency_tag = dt_col_names[dt_col_names %ilike% "^tag$" | dt_col_names %ilike% "tag number$"],
      deficiency_description = dt_col_names[dt_col_names %ilike% "desc"],
      scope_severity = dt_col_names[dt_col_names %ilike% "scope"],
      deficiency_corrected = dt_col_names[dt_col_names %ilike% "defstat" | dt_col_names %ilike% "corrected"],
      correction_date = dt_col_names[dt_col_names %ilike% "statdate" | dt_col_names %ilike% "correction"],
      inspection_cycle = dt_col_names[dt_col_names %ilike% "cycle"],
      standard_deficiency = dt_col_names[dt_col_names %ilike% "standard"],
      complaint_deficiency = dt_col_names[dt_col_names %ilike% "complaint"],
      infection_deficiency = dt_col_names[dt_col_names %ilike% "infection"]
    )
    #browser()
    dt <- fread(f)
    
    dtt <- data.table()
    
    for (i in 1:length(col_list)) {
      if (length(col_list[[i]]) > 0) {
        print(col_list[[i]])
        dtt[, (names(col_list[i])) := dt[, get(col_list[[i]])]]
      } else {
        dtt[, (names(col_list[i])) := NA]
      }
    }
    
    if (exists("dt_all")) dt_all <- rbindlist(list(dt_all, dtt))
    else dt_all <- dtt
  }
  dt_all
}

csv_files <-
  list.files(
    path = "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working",
    pattern = "*.csv",
    recursive = T,
    full.names = T
  )

csv_files <- csv_files[!csv_files %like% "deficiencies_[0-9][0-9][0-9][0-9]"]

deficiencies_2018 <- compile_deficiencies(csv_files[csv_files %like% "[0-9][0-9]_2018"])
fwrite(deficiencies_2018, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2018.csv")
deficiencies_2019 <- compile_deficiencies(csv_files[csv_files %like% "[0-9][0-9]_2019"])
fwrite(deficiencies_2019, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2019.csv")
deficiencies_2020 <- compile_deficiencies(csv_files[csv_files %like% "[0-9][0-9]_2020"])
fwrite(deficiencies_2020, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2020.csv")
deficiencies_2021 <- compile_deficiencies(csv_files[csv_files %like% "[0-9][0-9]_2021"])
fwrite(deficiencies_2021, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2021.csv")
deficiencies_2022 <- compile_deficiencies(csv_files[csv_files %like% "_[0-9][0-9]_2022"])
fwrite(deficiencies_2022, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2022.csv")


all_providers <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/distribution/us_pl_cms_2018_2022_nursing_home_providers.csv")

deficiencies_2018 <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2018.csv")
deficiencies_2018_p <- merge(deficiencies_2018, all_providers, by = "fed_provider_num")
fwrite(deficiencies_2018_p[provider_state=="VA", 
                           .(fed_provider_num,survey_date,survey_type,deficiency_prefix,category,deficiency_tag,deficiency_description,scope_severity,deficiency_corrected,correction_date,inspection_cycle,standard_deficiency,complaint_deficiency,infection_deficiency)], 
       "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2018.csv")


deficiencies_2019 <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2019.csv")
deficiencies_2019_p <- merge(deficiencies_2019, all_providers, by = "fed_provider_num")
fwrite(deficiencies_2019_p[provider_state=="VA", 
                           .(fed_provider_num,survey_date,survey_type,deficiency_prefix,category,deficiency_tag,deficiency_description,scope_severity,deficiency_corrected,correction_date,inspection_cycle,standard_deficiency,complaint_deficiency,infection_deficiency)], 
       "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2019.csv")

deficiencies_2020 <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2020.csv")
deficiencies_2020_p <- merge(deficiencies_2020, all_providers, by = "fed_provider_num")
fwrite(deficiencies_2020_p[provider_state=="VA", 
                           .(fed_provider_num,survey_date,survey_type,deficiency_prefix,category,deficiency_tag,deficiency_description,scope_severity,deficiency_corrected,correction_date,inspection_cycle,standard_deficiency,complaint_deficiency,infection_deficiency)], 
       "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2020.csv")

deficiencies_2021 <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2021.csv")
deficiencies_2021_p <- merge(deficiencies_2021, all_providers, by = "fed_provider_num")
fwrite(deficiencies_2021_p[provider_state=="VA", 
                           .(fed_provider_num,survey_date,survey_type,deficiency_prefix,category,deficiency_tag,deficiency_description,scope_severity,deficiency_corrected,correction_date,inspection_cycle,standard_deficiency,complaint_deficiency,infection_deficiency)], 
       "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2021.csv")

deficiencies_2022 <- fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_2022.csv")
deficiencies_2022_p <- merge(deficiencies_2022, all_providers, by = "fed_provider_num")
fwrite(deficiencies_2022_p[provider_state=="VA", 
                           .(fed_provider_num,survey_date,survey_type,deficiency_prefix,category,deficiency_tag,deficiency_description,scope_severity,deficiency_corrected,correction_date,inspection_cycle,standard_deficiency,complaint_deficiency,infection_deficiency)], 
       "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2022.csv")

deficiencies_va_all <- unique(rbindlist(list(fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2018.csv"),
                                      fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2019.csv"),
                                      fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2020.csv"),
                                      fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2021.csv"),
                                      fread("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working/deficiencies_va_2022.csv"))))

fwrite(deficiencies_va_all, "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/distribution/va_pl_cms_2018_2022_nursing_home_deficiencies.csv")

# Update file manifest
data_file_checksums()
