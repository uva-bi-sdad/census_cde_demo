set_data_file_basename <- function(dataset_info) {
  gsub("__+", "_", gsub("_$", "", paste(dataset_info$dataset_geo_coverage,
                                        dataset_info$dataset_geo_level,
                                        dataset_info$data_center_program,
                                        dataset_info$dataset_start_year,
                                        dataset_info$dataset_end_year,
                                        dataset_info$dataset_general_subject,
                                        dataset_info$dataset_sub_subject,
                                        sep = "_"
                                  )
  ))
} 
