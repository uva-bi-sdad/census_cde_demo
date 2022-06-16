# dataset creation code - data source ingest - file 3
# source file: https://data.ltcfocus.org/download/3363c230-dd0a-11ec-8bd9-d31a985d284e/facility_2020.xlsx

# Import source file and save to original for backup
source_file <- "https://data.ltcfocus.org/download/3363c230-dd0a-11ec-8bd9-d31a985d284e/facility_2020.xlsx"
download.file(source_file, "data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/original/facility_2020.xlsx")
