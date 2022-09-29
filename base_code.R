### Using Data from Bureau of Economic Analyis
# Install package
# install.packages('bea.R')
library(bea.R)

### This code will run all of the appropriate calls later on
source(".\\\\..\\utils\\setup_r_environment.R")
env_setup()

source(".\\\\..\\utils\\get_list_of_county_from_tiger.R")
source(".\\\\..\\utils\\get_county_gdps.R")
source(".\\\\..\\utils\\get_county_poverty_and_med_income.R")
source(".\\\\..\\utils\\get_county_land_water_areas.R")
source(".\\\\..\\utils\\get_county_fips_population.R")
source(".\\\\..\\utils\\get_county_road_data_tiger.R")

# 1) Get a list of all the counties that need to be processed from the TIGER - roads map website

library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()
library("stringr") # allows the use of "left" and "right" string manipulations
library(tidyverse) # allows the usage of left_join

# # Processes data download from tiger website
# get_county_list(enable_data_proc=FALSE)
# processes data processing (downloaded files are automatically overlooked)
# total road length - done
# total road intersections - done
df_county_roads <- get_county_list(enable_data_proc=TRUE)
print(head(df_county_roads))
print(tail(df_county_roads))

# 2) Get population for each of the counties
df_county_pop <- get_county_population()
print(head(df_county_pop))
print(tail(df_county_pop))

# land area - done
# water area - done
df_county_land_water_areas <- get_county_land_water_areas()
print(head(df_county_land_water_areas))
print(tail(df_county_land_water_areas))


# gdp per county - done
df_county_gdps <- get_county_gdps()
print(head(df_county_gdps))
print(tail(df_county_gdps))


# median income & poverty per county - done
df_county_poverty_and_med_income <- get_county_poverty_and_med_income()
print(head(df_county_poverty_and_med_income))
print(tail(df_county_poverty_and_med_income))



# # 3) Get all of the roads data including length and intersections



# colnames(df_lj) <- c("fips_id", "county_zip_file_name", "county_names", "population", "road_length_total", "intersections_total")
# df_lj <- df_lj[-1,] # removing unnecessary row

# write.csv(df_lj,".\\export.csv", row.names = FALSE)




# # # 2.1) Filter for the counties that match between the list of county population and county tiger files and populate population column
# # df_lj <- left_join(df, df_county_pop_cropped, by = c("X[[i]]"="GEOID"))
# df_lj <- left_join(tiger_county_list, df_county_pop, by = c("X.fips_count_id."="GEOID"))

# print(tail(tiger_county_list))
# print(tail(df_county_pop))
# print(tail(df_lj))




# ## statistical analysis
# # is there a way to put a number value to the road length, intersects, population count, total area and boil it down to a number
# # are there ways to see if the numbers are related to counties near by. are there patterns
# # are there evidence of counties other values (such as economic) carrying over onto other counties as well (less of a priority)

# # read in cvs file to append additional columns
# df_counties <- read.csv(".\\export.csv", header=TRUE, stringsAsFactors=FALSE)

# # 4) Get the total area of each of the counties
# # Retrieve total area for each county

# # 5) Do Analysis
# # at this point, there should be a dataframe with population, length of road, total intersections between the roads, total land area of each county


# ## The census data align at the county level by using County FIPS Codes. This is the State Code + County Code for 5 digit number








