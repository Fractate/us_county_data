### Using Data from Bureau of Economic Analyis
# Install package
# install.packages('bea.R')
library(bea.R)

### This code will run all of the appropriate calls later on
source(".\\\\..\\utils\\setup_r_environment.R")
env_setup()

source(".\\\\..\\utils\\get_list_of_county_from_tiger.R")
source(".\\\\..\\utils\\get_county_fips_population.R")
source(".\\\\..\\utils\\get_county_road_data_tiger.R")

# 1) Get a list of all the counties that need to be processed from the TIGER - roads map website

library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()
library("stringr") # allows the use of "left" and "right" string manipulations
library(tidyverse) # allows the usage of left_join



#   # Extrapolate file level directory information for each row found from US Census Tiger data
#   origin_website_zip_file_link <- paste(shapefile_2020_website_link, a, sep = "")
#   zip_file_name_converted_to_shp <- paste(file_path_sans_ext(a), ".shp", sep="") # shp and shx files must be used in tandem
#   zip_file_name_converted_to_shx <- paste(file_path_sans_ext(a), ".shx", sep="") # file_path_sans_ext(a) removes extensions from file names

if(!file.exists("export.csv")) {
    tiger_county_list <- get_county_list()

    ## tiger_county_list should now be returned as dataframe by default so the lines below are not needed
    ## ## lazy way of doing this, instead of retrieving a dataframe i am converting a returned list into a dataframe
    ## df <- do.call(rbind, lapply(tiger_county_list, as.data.frame))

    # 2) Get population for each of the counties
    df_county_pop <- get_county_population()

    df_county_pop_cropped <- df_county_pop[,c("GEOID", "NAME", "value")]

    # # 2.1) Filter for the counties that match between the list of county population and county tiger files and populate population column
    # df_lj <- left_join(df, df_county_pop_cropped, by = c("X[[i]]"="GEOID"))
    df_lj <- left_join(tiger_county_list, df_county_pop_cropped, by = c("X.fips_count_id."="GEOID"))

    print(tail(tiger_county_list))
    print(tail(df_county_pop))
    print(tail(df_county_pop_cropped))
    print(tail(df_lj))

    # 3) Get all of the roads data including length and intersections
    # add a column to df_lj to house total length and intersections
    # df_lj[ , 'roads_length', 'intersections'] <- NA
    empty_cols <- c('roads_length', 'intersections')
    df_lj[ , empty_cols] <- NA

    # # for loop will be needed for road data retrieval per each county
    print("flag11")
    print(tail(df_lj))

    for(i in 2:nrow(df_lj)) {
    # for(i in 2:3) {
        # print(df_lj[i]['X.county_zip_file_name.'])
        # print(df_lj[i][value])
        # print(i)
        # print(df_lj[i,2])

        # print(class(df_lj[i,]))
        # Set up new class to handle populating road lengths and number of intersections
        temp <- get_county_road_data(df_lj[i,2], df_lj[i,5], df_lj[i,6])
        df_lj[i,5] <- temp[1]
        df_lj[i,6] <- temp[2]
    }

    print(head(df_lj))
    print(tail(df_lj))
    print(class(df_lj))

    colnames(df_lj) <- c("fips_id", "county_zip_file_name", "county_names", "population", "road_length_total", "intersections_total")
    df_lj <- df_lj[-1,] # removing unnecessary row

    write.csv(df_lj,".\\export.csv", row.names = FALSE)
}

# Version 1 of the project will include the following
# land area
# water area
# total road length - done
# total road intersections - done
# gdp per county
# median income per county


# version 2 can have long term consequences of unemployment and covid recovery rates


# what data already exists in the system
# https://ask.census.gov/prweb/PRServletCustom/app/ECORRAsk2_/YACFBFye-rFIz_FoGtyvDRUGg1Uzu5Mn*/!STANDARD?pzuiactionzzz=CXtpbn0rTEpMcGRYOG1vS0tqTFAwaENUZWpvM1NNWEMzZ3p5aFpnWUxzVmw0TjJqMkV0dXBFN09Jc3FNc3NFNmNaN25K*
# County Business Patterns


# do some research in whether or not examples can be found from a previous research conducted per county level

# Tiger County Data - https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_counties_current.html
# Poverty per county - https://www.ers.usda.gov/data-products/county-level-data-sets/download-data/
###### Old Link - https://www.census.gov/data/datasets/2020/demo/saipe/2020-state-and-county.html
# Median Household Income - https://www.census.gov/data/datasets/2020/demo/saipe/2020-state-and-county.html
# Average home cost - https://www.census.gov/programs-surveys/popest/technical-documentation/research/evaluation-estimates/2020-evaluation-estimates/2010s-totals-housing-units.html
# Education Attainment - https://www.ers.usda.gov/data-products/county-level-data-sets/download-data/
# Employment Rates - https://www.ers.usda.gov/data-products/county-level-data-sets/download-data/
# Population Estimates - https://www.ers.usda.gov/data-products/county-level-data-sets/download-data/

# county business data - https://www.census.gov/programs-surveys/cbp/data/datasets.html
# https://www.census.gov/data/datasets/2020/econ/cbp/2020-cbp.html - "Complete County File"

# racial data - https://walker-data.com/umich-workshop-2022/intro-2020-census/#57

### df_counties columns
## defaults
# fips_id                           -   Tiger File Data
# county_zip_file_name              -   
# county_names                      -   
# population                        -   
# road_length_total                 -   
# intersections_total               -   

## geological data
# how_much_land                     -   Tiger County Data
# area_of_body_of_waters            -   Tiger County Data
# average water rainfall            -   N/A
# average temperature per year      -   N/A
# average temperature range yearly  -   N/A
# temperature highs                 -   N/A
# temperature lows                  -   N/A

## building data (?)                -   
# houses_per_county                 -   
# bedrooms_per_county               -   
# libraries per county              -   
# schools per county                -   
# firetrucks per county             -   
# post offices per county           -   
# restaurants per county            -   
# grocery stores per county         -   

## demographics data (?)
# racial_makeup                     -   https://walker-data.com/umich-workshop-2022/intro-2020-census/#57
# gender_makeup                     -   
# age_group_makeup                  -   
# total_population                  -   
# political affiliation             -   

## economics data (?)
# average income                    -   
# average money spent on AC         -  
# average cost of eletricity        -   
# average cost of water             -   
# average cost of car payment       -   
# average car ownership             -   
# average cost of insurances        -   
# average cost of houses            -   
# average amount of debt            -   

## quality of life data
# average pollution per county      -   
# crime rates                       -   
# homicide rates                    -   
# education attainment              -   

## statistical analysis
# is there a way to put a number value to the road length, intersects, population count, total area and boil it down to a number
# are there ways to see if the numbers are related to counties near by. are there patterns
# are there evidence of counties other values (such as economic) carrying over onto other counties as well (less of a priority)

# read in cvs file to append additional columns
df_counties <- read.csv(".\\export.csv", header=TRUE, stringsAsFactors=FALSE)
print(head(data1))
print(class(data1))


print("data2")

# 4) Get the total area of each of the counties
# Retrieve total area for each county

# 5) Do Analysis
# at this point, there should be a dataframe with population, length of road, total intersections between the roads, total land area of each county


## The census data align at the county level by using County FIPS Codes. This is the State Code + County Code for 5 digit number











