
library(tidyverse) # allows the usage of left_join

# Function name is 
get_county_naics <- function() {

    if(!file.exists("get_county_naics.csv")){

        if(!file.exists("..\\import_files\\cbp20co.txt")){
            # download dbp20co.txt (county level NAICS data)
            temp <- tempfile()
            download.file("https://www2.census.gov/programs-surveys/cbp/datasets/2020/cbp20co.zip", temp)
            # write.csv(df_fips,".\\get_county_naics.csv", row.names = FALSE)
            # data <- read.csv(unz(temp, "a1.dat"))
            unzip(temp,exdir='..\\import_files')
            # write.csv((unz(temp, "cbp20co.txt")),"..\\import_files\\cbp20co.txt", row.names = FALSE)
            # data <- read.csv(unz(temp, "a1.dat"))
            unlink(temp)
        }
        
        # setwd("C://Users/cjong/Projects/r_projects/us_county_human_road_density/unzipped_shp_and_shx_shape_files/")

        # data retrieved from "Complete County File" at https://www.census.gov/data/datasets/2020/econ/cbp/2020-cbp.html
        df <- read.csv("..\\import_files\\cbp20co.txt", header=TRUE, stringsAsFactors=FALSE)

        # https://www2.census.gov/programs-surveys/cbp/technical-documentation/records-layouts/2020_record_layouts/county-layout-2020.txt
        names(df)

        # cropping dataframe
        df <- df[,c("fipstate", "fipscty", "naics", "emp", "est")]
        df['fips'] = df['fipstate'] * 1000 + df['fipscty']
        df <- df[,c("fips", "naics", "emp", "est")]
        
        # colnames(df)  <- c("fips", "countyname", "population")
        # df_fips <- data.frame(Date=as.Date(character()),
        #                  File=character(), 
        #                  User=character(), 
        #                  stringsAsFactors=FALSE) 
        # unique(df$fips)
        # class( unique(df$fips))
        
        # retrieve all applicable fips for left joins
        
        
        # find unique fips
        df_fips <- data.frame(unique(df$fips))
        df_fips['fips'] <- unique(df$fips)
        df_fips <- df_fips['fips']
        # df_fips <- df_fips[,c("fips")]
        
        
        # df_72251 <- subset(df, naics == '113310')
        df_72251 <- df[df$naics == '72251/',]
        colnames(df_72251)  <- c("fips", "naics_72251", "emp_72251", "est_72251")
        df_813 <- df[df$naics == '813///',]
        colnames(df_813)  <- c("fips", "naics_813", "emp_813", "est_813")
        df_22 <- df[df$naics == '22----',]
        colnames(df_22)  <- c("fips", "naics_22", "emp_22", "est_22")
        df_51 <- df[df$naics == '51----',]
        colnames(df_51)  <- c("fips", "naics_51", "emp_51", "est_51")
        df_52 <- df[df$naics == '52----',]
        colnames(df_52)  <- c("fips", "naics_52", "emp_52", "est_52")
        
        
        df_fips = left_join(df_fips, df_72251, by = c("fips"="fips"))
        df_fips = left_join(df_fips, df_813, by = c("fips"="fips"))
        df_fips = left_join(df_fips, df_22, by = c("fips"="fips"))
        df_fips = left_join(df_fips, df_51, by = c("fips"="fips"))
        df_fips = left_join(df_fips, df_52, by = c("fips"="fips"))
        
        write.csv(df_fips,".\\get_county_naics.csv", row.names = FALSE)

        return(df)
    }
    else {
        df <- read.csv(".\\get_county_naics.csv", header=TRUE, stringsAsFactors=FALSE)
        return(df)
    }
}
