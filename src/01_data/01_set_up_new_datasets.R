source(".Rprofile")

# US CMS Nursing Home Health and Fire Deficiencies 2018-2022
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/us_cms_health_fire_deficiencies_2018_2022.yml",
                  code_files = "R",
                  overwrite = TRUE)

