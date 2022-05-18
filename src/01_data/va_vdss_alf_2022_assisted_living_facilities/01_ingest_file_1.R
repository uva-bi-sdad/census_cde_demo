# dataset creation code - data source ingest - file 1

library(rvest)
library(tibble)
library(data.table)
library(magrittr)
library(dataplumbr)
sapply(list.files("src/00_functions/", pattern = "*.R", full.names = TRUE), source)



### Set original data file(s) basename to something informative
data_file_basename <- set_data_file_basename(dataset_info)

base_url <- "https://www.dss.virginia.gov/"

# Get starting page links
base_cgi_url <- paste0(base_url, "facility/search/alf.cgi?rm=Search;;Start=")

url_list <- list()
i = 1
while (i < 572) {
  print(i)
  
  url <- paste0(base_cgi_url, i)
  url_list <- c(url_list, url)
  
  i = i + 25
}

# Get facility detail page links
if (exists("dt_out")) rm("dt_out")
for (u in 1:length(url_list)) {
  lnks <- scrapelinks(url_list[[u]])
  setDT(lnks)
  facility_links <- lnks[url %like% "Details",]
  facility_links[, url := paste0(base_url, url)]
  if (exists("dt_out")) dt_out <- rbindlist(list(dt_out, facility_links))
  else dt_out <- facility_links
}

dt_out$fac_id <- stringr::str_match(dt_out$url, "ID=([0-9]+);")[,2]
colnames(dt_out) <- c("fac_name", "url", "fac_id")
dt_out$fac_name <- stringr::str_replace_all(dt_out$fac_name, "\\(", "--") %>%
  stringr::str_replace_all("\\)", "--")
readr::write_csv(dt_out[, c("fac_name", "fac_id", "url")], file.path(dd_work, paste0(data_file_basename, "_links.csv")))




det_dt <- data.table::fread(file.path(dd_work, paste0(data_file_basename, "_links.csv")))
if (exists("info_out")) rm("info_out")
for (i in 1:nrow(det_dt)) {
  # get address
  fac_id <- det_dt[i,]$fac_id
  fac_name <- det_dt[i,]$fac_name
  html <- xml2::read_html(det_dt[i,]$url)
  tbs <- rvest::html_elements(html, "table")
  addr <- rvest::html_text2(tbs[1]) %>%
    stringr::str_replace("\\([0-9][0-9][0-9]\\) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]", "") %>%
    stringr::str_replace_all("\\(", "--") %>%
    stringr::str_replace_all("\\)", "--") %>%
    stringr::str_replace(fac_name, "") %>%
    stringr::str_replace("^\\r\\s*", "") %>%
    stringr::str_replace_all("\\n\\r", " ") %>%
    stringr::str_replace_all("\\t", ", ") %>%
    stringr::str_replace_all("\\r", "") %>%
    stringr::str_replace_all("\\s+,", ",") %>%
    stringr::str_replace_all(",\\s*$", "") %>%
    stringr::str_replace_all(",\\s*$", "")
  
  # get details
  df <- as.data.frame(t(as.data.frame(rvest::html_table(tbs[2], fill = T))), )
  cn <- dataplumbr::name.standard_col_names(df[1,])
  cn <- stringr::str_replace(cn, "_$", "")
  colnames(df) <- cn
  df <- df[-1,]
  rownames(df) <- NULL
  
  df$facility_address <- addr
  df$fac_id <- fac_id
  
  if (exists("info_out")) info_out <- rbindlist(list(info_out, df), use.names = TRUE, fill = TRUE)
  else info_out <- df
  info_out$V1 <- NULL
}

out <- info_out[, .(fac_id, facility_address, facility_type, license_type, expiration_date, qualification, administrator, business_hours, capacity, inspector)]
data.table::fwrite(out, file.path(dd_work, paste0(data_file_basename, "_info.csv")))




