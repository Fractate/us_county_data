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

if(!file.exists(zip_file_name_converted_to_shp)) {
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

    write.csv(df_lj,".\\export.csv", row.names = FALSE)
}

print("data1")
data1 <- read.csv(".\\export.csv", header=TRUE, stringsAsFactors=FALSE)
print("data2")

# 4) Get the total area of each of the counties
# Retrieve total area for each county

# 5) Do Analysis
# at this point, there should be a dataframe with population, length of road, total intersections between the roads, total land area of each county


## The census data align at the county level by using County FIPS Codes. This is the State Code + County Code for 5 digit number











