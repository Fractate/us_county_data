
library(tidyverse)
library(bea.R)

# source(".\\setup_r_environment.R")
source(".\\\\..\\utils\\setup_r_environment.R")
# source(".\\utils\\setup_r_environment.R")


# Function initialization
get_county_gdps <- function() {

	# Setup API key
	beaSets(beaKey = beaKey)

	# https://apps.bea.gov/api/data/?&UserID=123123123123123123123123&method=GetData&datasetname=Regional&TableName=CAGDP1&LineCode=3&GeoFIPS=COUNTY&Year=2020&ResultFormat=XML
	beaSpecs <- list(
		'UserID' 		= beaKey ,
		'Method' 		= 'GetData',
		'tablename' 	= 'CAGDP1',
	#   'tablename' 	= 'CAGDP2',
	#   'tablename' 	= 'CAGDP9',
		'datasetname' 	= 'Regional',
		'Year' 			= '2020',
		'ResultFormat' 	= 'json',
		'LineCode'		='1',
		'GeoFIPS'		='COUNTY'
	)
	beaPayload <- beaGet(beaSpecs)

	# print(beaPayload)
	# print(class(beaPayload))
	# print(names(beaPayload))
	# print("test1")
	# print(names(beaPayload))

	# keep only the state, county, fips, area_land, area_water
	df_output <- beaPayload %>% select(c("GeoFips", "DataValue_2020"))
	colnames(df_output)  <- c("fips_str", "gdp_2020_usd2012value")
	# print(head(df_output))
	# print(names(df_output))
	# print("test2")

	print("get_county_gdps.R")
	print(head(df_output))
	print(tail(df_output))
	print(names(df_output))
	print(lapply(df_output,class))

	print(nrow(df_output))

	# print(as.character(df_output['fips_str'])) # character needs to be defined

	for(i in 1:nrow(df_output)) {
		df_output[i, 'fips'] = as.numeric(as.character(df_output[i, 'fips_str']))
	}


	# df_output['fips'] = as.numeric(as.character(df_output['fips_str']))
	# df_output['fips'] = as.numeric(as.character(df_output['fips_str']))
	# df_output['fips'] <- sapply(df_output['fips_str'], as.numeric)
	print(nrow(df_output))

	# return dataframe
	# print(df_output)
	return(df_output)
}