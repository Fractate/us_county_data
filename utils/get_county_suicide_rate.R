# https://wonder.cdc.gov/controller/datarequest/D76;jsessionid=4A9C437CDCC5629D05DBD6B153C7
# https://wonder.cdc.gov/controller/saved/D76/D312F124

library(tidyverse)
library(readxl)

get_county_suicide_rate <- function() {

    if(!file.exists("get_county_suicide_rate.csv")) {

        # data retrieved from "X60-X84 (Intentional self-harm)" at https://wonder.cdc.gov/controller/saved/D76/D312F124
        df <- read.csv("..\\import_files\\suicide_data\\Underlying Cause of Death, 1999-2020.txt", sep = '\t',header=TRUE, stringsAsFactors=FALSE)

        # https://www2.census.gov/programs-surveys/cbp/technical-documentation/records-layouts/2020_record_layouts/county-layout-2020.txt
        names(df)
        
        # overly complicated with not-null just to show example on how dropping rows based on conditions can look
        df <- df[!(df$Notes != ""),]
        
        # cropping dataframe
        df <- df[,c("County.Code", "Deaths", "Population", "Crude.Rate")]
        
        # Rename Columns
        colnames(df)  <- c("fips", "suicide_deaths", "suicide_data_total_population", "suicide_rate_per_100k")
        df <- lapply(df, gsub, pattern = "Suppressed", replacement = "NA", fixed = TRUE)
        df <- lapply(df, gsub, pattern = "Unreliable", replacement = "NA", fixed = TRUE)

        # Rename Columns
        write.csv(df,".\\get_county_suicide_rate.csv", row.names = FALSE)

        return(df)
    }
    else {
        # read in cvs file to append additional columns
        df <- read.csv(".\\get_county_suicide_rate.csv", header=TRUE, stringsAsFactors=FALSE)

        return(df)
    }
}