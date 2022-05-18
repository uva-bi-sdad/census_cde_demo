# dataset creation code - data source ingest - file 3
# source file: https://data.cms.gov/provider-data/sites/default/files/archive/Nursing%20homes%20including%20rehab%20services/2020/nursing_homes_including_rehab_services_2020.zip

# Import source file and save to original for backup
source_file <- "https://data.cms.gov/provider-data/sites/default/files/archive/Nursing%20homes%20including%20rehab%20services/2020/nursing_homes_including_rehab_services_2020.zip"

data_dir_orig <- "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/original"
data_dir_work <- "data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/working"
dwnld_file_path <- file.path("data/us_pl_cms_2018_2022_nursing_home_health_and_fire_deficiencies/original", basename(source_file))

# Download source file
download.file(source_file, dwnld_file_path)

# Unzip source files (source file is a yearly zip file of month_year zip files)
unzip(dwnld_file_path, 
      exdir = tools::file_path_sans_ext(dwnld_file_path))

# Get list of month_year zip files
monthly_zip_files <- list.files(tools::file_path_sans_ext(dwnld_file_path), 
                                pattern = "[0-9][0-9]_[0-9][0-9][0-9][0-9].zip",
                                recursive = T,
                                full.names = T)

# For each month_year zip file, extract only files for health and fire deficiencies/citations, and place in working folder
for (z in monthly_zip_files) {
  zipped_file_names <- grep('(HealthDeficiencies|HealthCitations|FireSafetyCitations|FireSafetyDeficiencies|Deficiencies_Download)', unzip(z, list=TRUE)$Name, 
                            ignore.case=TRUE, value=TRUE)
  if (length(zipped_file_names) > 0) {
    ext_fld <- file.path(data_dir_work, basename(tools::file_path_sans_ext(z)))
    print(paste("unzipping", basename(z)))
    unzip(z, files=zipped_file_names, exdir = ext_fld)
  }
}