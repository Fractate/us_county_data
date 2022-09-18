# steps required


# check for all of the data entries found in census website

# check for all of the shape file in the computer

# for missing shape files, download and extract




### Retrieve links fropm census by downloading the shapefile zip data files
# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01001_roads.zip
# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/



library(rvest)
library(tools)

library(sf) # zip and unzip files

shapefile_2020_website_text <- "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/"
html <- read_html(shapefile_2020_website_text)


table2 <- html %>% html_element("table") %>%
  html_table()


# make sure right entries are selected from table2 is not being done because i'm too lazy

## grep is used to download files 
nrow(table2)

# # for(i in 1:length(table2))
# # for(i in 1:nrow(table2))
# 
# 
# # 
# # html %>% html_attr("href")
# # print("flag 2")
# # html
# html %>%
#   html_nodes(xpath = "//tr/td/a") %>% 
#   html_attr("href")




# Set download_directory
download_directory <- "../downloaded_zip_files/"

download_file_name <- "tl_2020_01011_roads.zip"





for(i in 3:10)
{
  # a <- grep("One", names(table2[[i]]))
  # ... #etc.
  # print("flag3")
  row_zip_file_name <- table2[i,2]
  print(row_zip_file_name)
  
  
  # setting string variables
  origin_website_zip_file_link <- paste(shapefile_2020_website_text, row_zip_file_name, sep = "")
  destination_zip_file_directory <-  paste(download_directory, row_zip_file_name, sep = "")
  zip_file_name_converted_to_shp <- paste(file_path_sans_ext(row_zip_file_name), ".shp", sep="")
  
  
  # https://stackoverflow.com/questions/3053833/using-r-to-download-zipped-data-file-extract-and-import-data
  temp <- tempfile()
  download.file(origin_website_zip_file_link, destfile = temp)
  # download.file(origin_website_zip_file_link, destfile = destination_zip_file_directory)
  
  
  
  
  ## bottom downloads the zip file. looking to directly download shp files if possible
  download.file(origin_website_zip_file_link, destfile = destination_zip_file_directory)
  
  # aoi_boundary_HARV <- st_read(destination_zip_file_directory)
  

}













# ##### for the first 10 entries in html, download the files into a specific directory
# 
# # Set download_directory
# 
# ## https://www2.census.gov/geo/tiger/TIGER2020/ROADS/
# 
# # Specify destination where file should be saved
# download_file_name <- "tl_2020_01011_roads.zip"
# 
# # html_table %>% html_nodes(xpath='//td[@valign="top"]')
# # html_parsed
# 
# ## web scraping instructions
# # https://cran.r-project.org/web/packages/rvest/vignettes/rvest.html
# # https://www.geeksforgeeks.org/web-scraping-using-r-language/
# # https://stackoverflow.com/questions/41708685/equivalent-of-which-in-scraping
# 
# urls <- c("https://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01017_roads.zip")
# 
# for (url in urls) {
#   download.file(url, destfile = basename(url))
# }
# 
# download.file(url, destfile = basename(url), method="curl", extra="-k")
# 


