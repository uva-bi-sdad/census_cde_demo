
<!-- README.md is generated from README.Rmd. Please edit that file -->

# census_cde_demo

Data files are in data/<dataset_name>/distribution.<br /> Code for
ingest and preparation of datasets is in
src/01_data/<dataset_name>.<br /> Dataset documentation (if it exists)
is in docs/01_data/<dataset_name>.<br />

## File List

A manifest with a list of the latest distribution files, along with md5
checksums, is available at /data/distribution_file_manifest.csv

Current files:<br />

[us_pl_dhs_hifld_2022_nursing_homes.geojson](data/us_pl_dhs_hifld_2022_nursing_homes/distribution/us_pl_dhs_hifld_2022_nursing_homes.geojson)<br />[va_tract_lodes_2015_2018_od.zip](data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_od.zip)<br />[va_tract_lodes_2015_2018_rac.zip](data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_rac.zip)<br />[va_tract_lodes_2015_2018_wac.zip](data/va_bl_census_lodes_2015_2018_origin_destination_worker_and_workplace_characteristics/distribution/va_tract_lodes_2015_2018_wac.zip)<br />[va_brown_ltcfocus_2018_2020_long-term_care_facility_facts.csv](data/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts/distribution/va_brown_ltcfocus_2018_2020_long-term_care_facility_facts.csv)<br />[va_tract_fema_2021_national_hazard_risk_index\_-\_nri_std.csv](data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri_std.csv)<br />[va_tract_fema_2021_national_hazard_risk_index\_-\_nri.csv](data/va_fema_2021_national_hazard_risk_index_-_nri/distribution/va_tract_fema_2021_national_hazard_risk_index_-_nri.csv)<br />[us_hhs_cms_2014_2022_nursing_home_providers.csv](data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/us_hhs_cms_2014_2022_nursing_home_providers.csv)<br />[va_hhs_cms_2014_2022_nursing_home_deficiencies.csv](data/va_hhs_cms_2014_2022_nursing_home_health_fire_deficiencies/distribution/va_hhs_cms_2014_2022_nursing_home_deficiencies.csv)<br />[va_ucol_fldobs_2018_hurricane_florence_flooding.tif](data/va_ucol_fldobs_2018_hurricane_florence_flooding/distribution/va_ucol_fldobs_2018_hurricane_florence_flooding.tif)<br />[va_vdss_alf_2022_assisted_living_facilities.csv](data/va_vdss_alf_2022_assisted_living_facilities/distribution/va_vdss_alf_2022_assisted_living_facilities.csv)<br />

## New Dataset Creation

1.  Create new yaml settings file and place in
    /src/01_data/00_dataset_yaml_files. For example:
    <pre><code>
      ---
      dataset_info:
     dataset_type: "data"             
     data_agency_company_abbrv: "dhs"
     data_center_program: "hifld"
     dataset_general_subject: "Nursing Homes"
     dataset_sub_subject: ""
     dataset_region_type: ""
     dataset_geo_coverage: "us"
     dataset_geo_level: "pl"         
     dataset_start_year: "2022"
     dataset_end_year: ""
     dataset_source_files:
       - type: "data"    
         format: "geojson"
         url: "https://opendata.arcgis.com/datasets/78c58035fb3942ba82af991bb4476f13_0.geojson"
       - type: "doc"
         format: "xml"
         url: "https://www.arcgis.com/sharing/rest/content/items/78c58035fb3942ba82af991bb4476f13/info/metadata/metadata.xml"
    </code></pre>
2.  Open /src/01_data/01_set_up_new_datasets.R and add new
    new_dataset_setup command, and run. This creates a filename all of
    the folders that will go along with this dataset. For example:
    <pre><code>
      # US DHS HIFLD Nursing Homes 2022
      new_dataset_setup(dataset_info_yml_file_path = "src/01_data/00_dataset_yaml_files/us_hifld_nursing_homes_2022.yml",
                     code_files = "R",
                     overwrite = TRUE)
    </code></pre>
3.  Now go to the folder created for this dataset in
    /src/01_data/<name of new dataset> and open the first ingest file
    (01_ingest_file_1.R). There should now be one file for ingest for
    each source file you listed in the yaml file.

Running the already created code should download the source file and
place it in the /data/<name of new dataset>/original folder.

4.  Now open the prepared dataset preparation file, 02_prepare.R. This
    file has the basic steps and some of the needed code already
    prepopolated.

Once finished, you will have a final dataset in
/data/<name of new dataset>/distribution.
