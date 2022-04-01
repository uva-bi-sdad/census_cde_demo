set_data_source_abbrv <- function(dataset_info) {
  paste(dataset_info$data_agency_company_abbrv,
        dataset_info$data_center_program,
        dataset_info$dataset_general_subject,
        sep = "_")
} 
