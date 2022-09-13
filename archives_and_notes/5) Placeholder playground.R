
### Retrieve links fropm census by downloading shapefile zip data files
# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01001_roads.zip
# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/
###

library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()

download_file_name <- "tl_2020_01011_roads.zip"

# steps required
# check for all of the data entries found in census website
# check for all of the shape file in the computer
# for missing shape files, download and extract

shapefile_2020_website_text <- "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/"

html <- read_html(shapefile_2020_website_text)

class(html)
html

class(html)
table2 <- html %>% html_element("table") %>% html_table()
# make sure right entries are selected from table2 is not being done because i'm too lazy
# Can follow up with a try statement and/or hard code to skip first and last parts that have invalid data

for(i in 3:10)
# for(i in 3:nrow(table2))
### Returns the total number of rows found in census tiger website
# nrow(table2)
###
{
  a <- table2[i,2] # returns column of zip file names found in the US Census Tiger data
  print(a)
  
  # Extrapolate file level directory information for each row found from US Census Tiger data
  origin_website_zip_file_link <- paste(shapefile_2020_website_text, a, sep = "")
  zip_file_name_converted_to_shp <- paste(file_path_sans_ext(a), ".shp", sep="") # shp and shx files must be used in tandem
  zip_file_name_converted_to_shx <- paste(file_path_sans_ext(a), ".shx", sep="") # file_path_sans_ext(a) removes extensions from file names

  ## Obsolete because code now uses default directory
  # verification_of_shp_file_path <- paste(download_directory, zip_file_name_converted_to_shp, sep="")
  # verification_of_shx_file_path <- paste(download_directory, zip_file_name_converted_to_shx, sep="")

  # https://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data
  temp <- tempfile() # store temp zip file and extract shp and shx files
  download.file(origin_website_zip_file_link, destfile = temp)
  ###
  # The following code is used if one wants to save a file rather than storing it temporarily
  # destination_zip_file_directory <-  paste(download_zip_directory, a, sep = "")
  # download.file(origin_website_zip_file_link, destfile = destination_zip_file_directory)
  ###
  
  ###
  # https://stackoverflow.com/questions/37221184/r-function-unzip-error-1-in-extracting-from-zip-file
  # r function unzip error 1 in extracting from zip file
  # - Above link demonstrates the usage of unzip() function
  ###
  shp_file_from_zip <- unzip(temp, zip_file_name_converted_to_shp, list = FALSE)
  shx_file_from_zip <- unzip(temp, zip_file_name_converted_to_shx, list = FALSE)
  
  shp_file <- file_create(shp_file_from_zip)
  file_create(shx_file_from_zip)

  # # Obsolete because code now uses default directory
  # file_create(path(shp_file_from_zip))
  # file_create(path(shx_file_from_zip))

  ## Bottom code doesn't seem to filter anything out so I'm just commenting them out. I'm not sure why it's not filtering things out
  # if (file.exists(shp_file_from_zip)) {
  #   cat("The shp already exists")
  # } else if (file.exists(shx_file_from_zip)) {
  #   cat("The shx already exists")
  # } else {
  #   file_create(download_directory, shp_file_from_zip)
  #   file_create(download_directory, shx_file_from_zip)
  # }
  
  
  ### Retrieve the shp_file that was saved above and read that into boundary variable
  # I have no idea why the naming standard has the users use the term "HARV" but here we are
  road_boundary_HARV <-  st_read(shp_file)
  
  # Retrieve geometry attributes from road_boundary_HARV for processing
  sd = st_sfc(geometry=road_boundary_HARV$geometry, crs=4326)
  
  # Verify the calculation of lengths and intersections within the shapefile
  st_area(sd) # this returns only 0 because shapefile only includes the vectors of the roads
  attributes(sd)
  st_length(sd) # - shows distance in meters
  st_intersects(sd) # shows number of intersects

  # Process the length of each individual 

}















