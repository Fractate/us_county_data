# Load the tidycensus package into your R session
library(tidycensus)

# Function name is 
get_county_population <- function() {

    if(!file.exists("get_county_fips_population.csv")){

        # # testing purposes
        # id_county_fips = "78030"

        df = get_decennial(geography = "county", variables = "P2_001N", year = 2020)
        
        # cropping dataframe
        df <- df[,c("GEOID", "NAME", "value")]
        colnames(df)  <- c("fips", "countyname", "population")
        
        write.csv(df,".\\get_county_fips_population.csv", row.names = FALSE)

        return(df)
    }
    else {
        df <- read.csv(".\\get_county_fips_population.csv", header=TRUE, stringsAsFactors=FALSE)
        return(df)
    }
}
