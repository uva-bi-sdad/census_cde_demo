library(sf)
library(data.table)
sapply(list.files("src/00_functions/", full.names = TRUE), source)

# CDC-CMS Nursing Home Data

## Set Dataset and Download File Info
### Set dataset info
dataset_info <- list(
  data_agency_company_abbrv = "hhs",
  data_center_program = "cms",
  dataset_general_subject = "nursing_homes",
  dataset_sub_subject = "incl_rebab_srvcs",
  dataset_geo_coverage = "us",
  dataset_geo_level = "pl",
  dataset_start_year = "2022",
  dataset_end_year = ""
)

### Set dataset download files
dataset_download_files <- list(
  list(
    url = "https://data.cms.gov/provider-data/sites/default/files/archive/Nursing%20homes%20including%20rehab%20services/current/nursing_homes_including_rehab_services_current_data.zip",
    suffix = ".zip"
  )
)

## Create/Set Locations & Names
### Create/Set Data & Metadata Directories
data_source_abbrv <- set_data_source_abbrv(dataset_info)
create_data_dirs(data_source_abbrv)

### Set original data file(s) basename to something informative
data_file_basename <- set_data_file_basename(dataset_info)

## Get and Organize Data and Data Info Files
### Get data files and save to data/original
for (i in 1:length(dataset_download_files)) {
  dest_file <- file.path(dd_orig, paste0(data_file_basename, dataset_download_files[[i]]$suffix))
  download.file(url = dataset_download_files[[i]]$url,
                destfile = dest_file)
}

### extract any zip files directly to working
zip_files <- list.files(dd_orig, pattern = "(zip$)", ignore.case = TRUE)
for (z in zip_files) unzip(file.path(dd_orig, z), exdir = dd_work)

### copy data files to working
data_files <- grep("(csv$|geojson$|RData$|RDS$)", list.files(dd_orig), value = TRUE, ignore.case = TRUE)
file.copy(from = file.path(dd_orig, data_files), to = file.path(dd_work, data_files))

### copy non-data files (e.g. data dictionaries) from original to docs
non_data_files <- grep("(csv$|geojson$|RData$|RDS$|zip$)", list.files(dd_orig), value = TRUE, ignore.case = TRUE, invert = TRUE)
for (d in non_data_files) file.copy(from = file.path(dd_orig, d), to = file.path(dd_docs, d))

### move non-data files (e.g. data dictionaries) from working to docs
non_data_files <- grep("(csv$|geojson$|RData$|RDS$|zip$)", list.files(dd_work), value = TRUE, ignore.case = TRUE, invert = TRUE)
for (d in non_data_files) file.rename(from = file.path(dd_work, d), to = file.path(dd_docs, d))

### compress non-compressed files in data/original
files_to_zip <- file.path(dd_orig, c(data_files, non_data_files))
if (length(files_to_zip) > 0) {
  zip(file.path(dd_orig, paste0(data_file_basename, ".zip")), files_to_zip)
  unlink(files_to_zip)  
}

