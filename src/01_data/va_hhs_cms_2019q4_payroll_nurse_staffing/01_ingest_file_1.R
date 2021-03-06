# dataset creation code - data source ingest - file 1
# source file: https://data.cms.gov/data-api/v1/dataset/c90dd8a4-8f97-4b56-b756-4ec09c9bb034/data

# Import source file and save to original for backup
source_file_base <- "https://data.cms.gov/data-api/v1/dataset/c90dd8a4-8f97-4b56-b756-4ec09c9bb034/data"

seq <- seq(1, 25760, 5000)
seq <- c(seq, 25760)

for (i in 1:length(seq)-1){
  offset <- seq[i]-1
  source_file <- paste0(source_file_base, "?size=5000&filter[state]=VA&distinct=1&offset=", offset)
  download.file(source_file, paste0("data/va_hhs_cms_2019q4_payroll_nurse_staffing/original/va_hhs_cms_2019q4_payroll_nurse_staffing_", offset, ".json"))
}

