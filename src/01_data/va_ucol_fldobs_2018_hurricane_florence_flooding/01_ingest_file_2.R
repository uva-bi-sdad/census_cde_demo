# dataset creation code - data source ingest - file 2
# source file: https://floodobservatory.colorado.edu/Events/4676/GISData/DFO/Shp/

# Import source file and save to original for backup
source_file <- "https://floodobservatory.colorado.edu/Events/4676/GISData/DFO/Shp/2018091920180816aS1_region.prj"
download.file(source_file, "data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/2018091920180816aS1_region.prj")
source_file <- "https://floodobservatory.colorado.edu/Events/4676/GISData/DFO/Shp/2018091920180816aS1_region.shp"
download.file(source_file, "data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/2018091920180816aS1_region.shp")
source_file <- "https://floodobservatory.colorado.edu/Events/4676/GISData/DFO/Shp/2018091920180816aS1_region.dbf"
download.file(source_file, "data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/2018091920180816aS1_region.dbf")
source_file <- "https://floodobservatory.colorado.edu/Events/4676/GISData/DFO/Shp/2018091920180816aS1_region.shx"
download.file(source_file, "data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/2018091920180816aS1_region.shx")
