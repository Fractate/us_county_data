# Load the Bureau of Labor Statistics data

# install.packages("blscrapeR")
library(blscrapeR)

# Function name is 
get_county_population <- function() {
  
  if(!file.exists("get_county_unemployment.csv")){
    
    df = get_bls_county("April 2022")
    
    # cropping dataframe
    df <- df[,c("GEOID", "NAME", "value")]
    colnames(df)  <- c("fips", "period", "labor_force", "employed", "unemployed", "unemployment_rate")
    
    write.csv(df,".\\get_county_unemployment.csv", row.names = FALSE)
    
    return(df)
  }
  else {
    df <- read.csv(".\\get_county_unemployment.csv", header=TRUE, stringsAsFactors=FALSE)
    return(df)
  }
}
