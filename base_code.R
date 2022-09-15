### This code will run all of the appropriate calls later on

source(".\\\\..\\utils\\get_list_of_county_from_tiger.R")
source(".\\\\..\\utils\\get_county_fips_population.R")

# source(".\\\\..\\utils\\*")

# 1) Get a list of all the counties that need to be processed from the TIGER - roads map website

library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()
library("stringr") # allows the use of "left" and "right" string manipulations

library(tidyverse) # allows the usage of left_join

tiger_county_list <- get_county_list("https://www2.census.gov/geo/tiger/TIGER2020/ROADS/")
print(tiger_county_list)

## lazy way of doing this, instead of retrieving a dataframe i am converting a returned list into a dataframe
df <- do.call(rbind, lapply(tiger_county_list, as.data.frame))

df$names
print(df)
data(df)
attributes(df)
colnames(df) 

# 2) Get population for each of the counties
df_county_pop <- get_county_population()

print(df_county_pop)
data(df_county_pop)
attributes(df_county_pop)
colnames(df_county_pop) 

df_county_pop_cropped <- df_county_pop[,c("GEOID", "NAME", "value")]

# 2.1) Filter for the counties that match between the list of county population and county tiger files and populate population column
df_lj <- left_join(df, df_county_pop_cropped, by = c("X[[i]]"="GEOID"))

print(df_lj)
# 3) Get all of the roads data including length and intersections
# add a column to df_lj to house total length and intersections

# a for loop will be needed for data retrieval per each county


# 4) Get the total area of each of the counties
# Retrieve total area for each county

# 5) Do Analysis
# at this point, there should be a dataframe with population, length of road, total intersections between the roads, total land area of each county


## The census data align at the county level by using County FIPS Codes. This is the State Code + County Code for 5 digit number











