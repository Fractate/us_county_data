# https://www2.census.gov/programs-surveys/saipe/datasets/2020/2020-state-and-county/est20all.xls
library(tidyverse)
library(readxl)

# Function initialization
get_county_poverty_and_med_income <- function() {

    # download excel file to temp file to process and discard
    temp.file <- paste(tempfile(),".xls",sep = "")
    download.file("https://www2.census.gov/programs-surveys/saipe/datasets/2020/2020-state-and-county/est20all.xls", temp.file, mode = "wb")

    # skip countes number of lines to skip in excel file to find column head names
    tmp <- read_excel(temp.file, skip = 3)
    df <- data.frame(tmp)

    # keep only the state, county, fips, area_land, area_water
    df_output <- df %>% select(c("State.FIPS.Code", "County.FIPS.Code", "Poverty.Percent..All.Ages", "Median.Household.Income"))
    colnames(df_output)  <- c("state_fips", "county_fips", "poverty_percentage", "median_household_income")
   
	for(i in 1:nrow(df_output)) {
		df_output[i, 'fips'] <- ((strtoi(df_output[i, 'state_fips']) * 1000) + strtoi(df_output[i, 'county_fips']))
	}

    # # append fips column to df_output
    # df_output['fips'] <- as.numeric(as.character(paste(df_output['state_fips'],
    #                                                    df_output['county_fips']),
    #                                                    as.numeric))
    # # df_output['fips'] <- sapply(paste(df_output['state_fips'],df_output['county_fips']), as.numeric)
    # # df_output['fips'] <- ((strtoi(df_output['state_fips']) * 1000) + strtoi(df_output['county_fips']))

    return(df_output)
}