# dataset creation code - data source ingest - file 1
# source file: https://data.cms.gov/data-api/v1/dataset/93881636-0cde-4118-a110-ba2fd8cc890a/data

# Import source file and save to original for backup
seq <- seq(1, 25760, 5000)
seq <- c(seq, 25760)

for (i in 1:length(seq)-1){
  offset <- seq[i]-1
  source_file <- paste0("https://data.cms.gov/data-api/v1/dataset/93881636-0cde-4118-a110-ba2fd8cc890a/data?size=5000&filter[STATE]=VA&distinct=1&offset=", offset)
  download.file(source_file, paste0("data/va_hhs_cms_2021q4_payroll_nurse_staffing/original/va_hhs_cms_2021q4_payroll_nurse_staffing_", offset, ".json"))
}
