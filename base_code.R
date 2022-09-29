# import util codes
source(".\\\\..\\utils\\setup_r_environment.R")
env_setup()
source(".\\\\..\\utils\\get_list_of_county_from_tiger.R")
source(".\\\\..\\utils\\get_county_gdps.R")
source(".\\\\..\\utils\\get_county_poverty_and_med_income.R")
source(".\\\\..\\utils\\get_county_land_water_areas.R")
source(".\\\\..\\utils\\get_county_fips_population.R")
# source(".\\\\..\\utils\\get_county_road_data_tiger.R")

# libraries
library(bea.R) # Using Data from Bureau of Economic Analyis
library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()
library("stringr") # allows the use of "left" and "right" string manipulations
library(tidyverse) # allows the usage of left_join

# ensure "export.csv" does not exist in "unzipped_shp_and_shx_shape_files"
# (aka default as set in setup_r_environment.R) folder
if(!file.exists("export.csv")) {

    # total road intersections - done
    # total road length - done
    df_county_roads <- get_county_list(enable_data_proc=TRUE)
    # get_county_list(enable_data_proc=FALSE)
    # processes data processing (downloaded files are automatically overlooked)
    print(head(df_county_roads))
    print(tail(df_county_roads))
    print(names(df_county_roads)) # fips # county_zip_file_name # roads_length # intersections

    # populations - done
    df_county_pop <- get_county_population()
    print(head(df_county_pop))
    print(tail(df_county_pop))
    print(names(df_county_pop)) # fips # countyname # population

    # land area - done
    # water area - done
    df_county_land_water_areas <- get_county_land_water_areas()
    print(head(df_county_land_water_areas))
    print(tail(df_county_land_water_areas))
    print(names(df_county_land_water_areas)) # state # county # area_land # area_water # fips

    # gdp per county - done
    df_county_gdps <- get_county_gdps()
    print(head(df_county_gdps))
    print(tail(df_county_gdps))
    print(names(df_county_gdps)) # fips # gdp_2020_usd2012value

    # median income & poverty per county - done
    df_county_poverty_and_med_income <- get_county_poverty_and_med_income()
    print(head(df_county_poverty_and_med_income))
    print(tail(df_county_poverty_and_med_income))
    print(names(df_county_poverty_and_med_income)) # fips # state_fips # county_fips # poverty_percentage # median_household_income

    ### Joins
    # Filter for the counties that match between the list of county population and county tiger files and populate population column
    # df_lj <- left_join(df, df_county_pop_cropped, by = c("X[[i]]"="GEOID"))
    df_lj <- left_join(df_county_roads, df_county_pop, by = c("fips"="fips"))
    df_lj <- left_join(df_lj, df_county_land_water_areas, by = c("fips"="fips"))
    df_lj <- left_join(df_lj, df_county_gdps, by = c("fips"="fips"))
    df_lj <- left_join(df_lj, df_county_poverty_and_med_income, by = c("fips"="fips"))

    write.csv(df_lj,".\\export.csv", row.names = FALSE)
} else {
    # read in cvs file to append additional columns
    df_lj <- read.csv(".\\export.csv", header=TRUE, stringsAsFactors=FALSE)
}

# Version 1 Data Retrieval Complete
print(head(df_lj))
print(names(df_lj))





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








