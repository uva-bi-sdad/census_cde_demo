# dataset creation code - dataset preparation (transformation, new variables, linkage, etc)

# Import file from original
file.copy("data/va_ucol_fldobs_2018_hurricane_florence_flooding/original/va_ucol_fldobs_2018_hurricane_florence_flooding.tif", 
          to = "data/va_ucol_fldobs_2018_hurricane_florence_flooding/distribution/va_ucol_fldobs_2018_hurricane_florence_flooding.tif")

# Update file manifest
data_file_checksums()
