# Commands that need to run

# Setting working directory to save files there
setwd("directory/here")


# Define your Census API key and set it with census_api_key()
api_key <- "api_key_here"


# Store api key locally
census_api_key(api_key, install = TRUE, overwrite=TRUE)