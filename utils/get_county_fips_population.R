# Load the tidycensus package into your R session
library(tidycensus)

# Function name is 
get_county_population <- function() {

    # # testing purposes
    # id_county_fips = "78030"

    a = get_decennial(geography = "county", variables = "P2_001N", year = 2020)
    return(a)
}
