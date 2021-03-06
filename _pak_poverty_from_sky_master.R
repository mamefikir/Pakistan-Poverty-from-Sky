# Poverty Estimation from Satellite Imagery in Pakistan

# Filepaths --------------------------------------------------------------------
# Project file path
if(Sys.info()[["user"]] == "WB521633") project_file_path <- "C:/Users/wb521633/Dropbox/World Bank/IEs/Pakistan Poverty Estimation from Satellites"
if(Sys.info()[["user"]] == "robmarty") project_file_path <- "~/Dropbox/World Bank/IEs/Pakistan Poverty Estimation from Satellites"

raw_data_file_path <- file.path(project_file_path, "Data", "RawData")
final_data_file_path <- file.path(project_file_path,"Data", "FinalData")
tables_file_path <- file.path(project_file_path, "Outputs", "Results", "Tables")

# Code File Path
if(Sys.info()[["user"]] == "WB521633") code_file_path <- "C:/Users/wb521633/OneDrive - WBG/Documents/GitHub/Pakistan-Poverty-from-Sky/Code"
if(Sys.info()[["user"]] == "robmarty") code_file_path <- "~/Documents/Github/Pakistan-Poverty-from-Sky/Code"

# File path for BISP Geocodes
if(Sys.info()[["user"]] == "WB521633") bisp_geocodes_file_path <- "C:/Users/wb521633/OneDrive - WBG/Pakistan Poverty from Sky - Survey Data/BISP" # ONEDRIVE FILE PATH
if(Sys.info()[["user"]] == "robmarty") bisp_geocodes_file_path <- "~/Documents/World Bank/Pakistan Poverty from Sky/BISP/"

# Webscraping File Path
if(Sys.info()[["user"]] == "WB521633") webscraping_api_filepath <- "C:/Users/wb521633/Dropbox/World Bank/Webscraping/Files for Server"
if(Sys.info()[["user"]] == "robmarty") webscraping_api_filepath <- "~/Dropbox/World Bank/Webscraping/Files for Server"

# Parameters -------------------------------------------------------------------
PAK_UTM_PROJ <- "+init=epsg:24313"

# Packages ---------------------------------------------------------------------
library(rgdal)
library(viridis)
library(readstata13)
library(dplyr)
library(data.table)
library(raster)
library(leaflet)
library(rgdal)
library(dplyr)
library(raster)
library(stringdist)
library(tmaptools)
library(stringr)
library(doBy)
library(rgeos)
library(haven)
library(alluvial)
library(ggmap)
library(velox)
library(sf)
library(tidyverse)
source(file.path(code_file_path, "02_bisp_approach", "_functions", "functions.R"))

source("https://raw.githubusercontent.com/ramarty/fast-functions/master/R/functions_in_chunks.R")

# Run Scripts ------------------------------------------------------------------
if(F){

  # 1. Create Union Council Level Survey Dataset (csv) from Raw NSER data. 
  # Averages variables within union councils and calculates number of observations 
  # within each union council.
  # NOTE: Need access to raw NSER data for this script; can skip if Union Council
  #       level dataset is already created.
  source(file.path(project_file_path, "Code", "create_uc_level_survey_dataset.R"))
  
  # 2. Create Union Council Level Survey Shapefile 
  # Merges union council level csv file with union council shapefile. Cleans 
  # shapefile so that tehsil and union council names match with those from the
  # survey data
  source(file.path(project_file_path, "Code", "merge_survey_with_pak_boundary.R"))
}



