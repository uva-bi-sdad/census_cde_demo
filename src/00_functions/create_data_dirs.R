create_data_dirs <- function(data_source_subject_abbrv) {
  dd_orig <<- file.path("data/original", data_source_subject_abbrv)
  dd_work <<- file.path("data/working", data_source_subject_abbrv)
  dd_docs <<- file.path("docs/01_data", data_source_subject_abbrv)
  dir.create(dd_orig, recursive = TRUE)
  dir.create(dd_work, recursive = TRUE)
  dir.create(dd_docs, recursive = TRUE)
}
