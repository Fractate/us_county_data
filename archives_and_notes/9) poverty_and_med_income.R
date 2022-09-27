# https://www2.census.gov/programs-surveys/saipe/datasets/2020/2020-state-and-county/est20all.xls
library(tidyverse)
library(readxl)

temp.file <- paste(tempfile(),".xls",sep = "")
download.file("https://www2.census.gov/programs-surveys/saipe/datasets/2020/2020-state-and-county/est20all.xls", temp.file, mode = "wb")

# skip countes number of lines to skip in excel file to find column head names
tmp <- read_excel(temp.file, skip = 3)
df <- data.frame(tmp)

print("flag1")
# keep only the state, county, fips, area_land, area_water
df_output <- df %>% select(c("State.FIPS.Code", "County.FIPS.Code", "Poverty.Percent..All.Ages", "Median.Household.Income"))
colnames(df_output)  <- c("state_fips", "county_fips", "poverty_percentage", "median_household_income")
# df_output[,"poverty_percentage"] <- round(df_output[,"poverty_percentage"], 1)

print("flag2")

# print(df)

print(names(df_output))

print(head(df_output))
