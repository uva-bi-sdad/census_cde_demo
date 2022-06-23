library(dc.utils)

# US CMS Nursing Home Health and Fire Deficiencies 2018-2022
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_hhs_cms_nursing_home_health_fire_deficiencies_2014_2022.yml",
                  code_files = "R",
                  overwrite = TRUE)

# US CMS Payroll Nurse Staffing 2020Q4
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_hhs_cms_2020Q4_payroll_nurse_staffing.yml",
                  code_files = "R",
                  overwrite = TRUE)

# US DHS HIFLD Nursing Homes 2022
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/us_hifld_nursing_homes_2022.yml",
                  code_files = "R",
                  overwrite = TRUE)

# VA VDSS Assisted Living Facilities 2022
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_vdss_assisted_living_facilities_2022.yml",
                  code_files = "R",
                  overwrite = TRUE)

# VA FEMA Hazard Risk Index 2021
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_fema_national_risk_index_2021.yml",
                  code_files = "R",
                  overwrite = TRUE)

# VA Florence Flooding 2018
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_florence_flood_2018.yml",
                  code_files = "R",
                  overwrite = TRUE)

# Brown LTCFocus Data 2018-2020
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_brown_ltcfocus_data_2018_2020.yml",
                  code_files = "R",
                  overwrite = TRUE)

# Census LODES Data 2015-2018
new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/va_census_lodes_2015_2018.yml",
                  code_files = "R",
                  overwrite = TRUE)
