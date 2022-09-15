### This code will run all of the appropriate calls later on

source(".\\\\..\\utils\\get_list_of_county_from_tiger.R")

# 1) Get a list of all the counties that need to be processed from the TIGER - roads map website

library(rvest)
library(tools)
library(sf) # zip and unzip files
library(fs) # file systems, allows the usage of file_create()
library("stringr") # allows the use of "left" and "right" string manipulations

tiger_county_list <- get_county_list("https://www2.census.gov/geo/tiger/TIGER2020/ROADS/")
print(tiger_county_list)

# 2) Get population for each of the counties


# 3) Get all of the roads data including length and intersections

# 4) Get the total area of each of the counties

# 5) Do Analysis


## The census data align at the county level by using County FIPS Codes. This is the State Code + County Code for 5 digit number