# dataset creation code - data source ingest - file 1
# source file: https://floodobservatory.colorado.edu/Events/4676/2018USA4676.tif

# Import source file and save to original for backup
source_file <- "https://floodobservatory.colorado.edu/Events/4676/2018USA4676.tif"
download.file(source_file, "data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/va_ucol_fldobs_2018_hurricane_florence_flooding.tif")
