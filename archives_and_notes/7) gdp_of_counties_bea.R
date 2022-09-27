
library(tidyverse)
library(bea.R)

source(".\\\\..\\utils\\setup_r_environment.R")

# Setup API key
beaKey <- beke

beaSets(beaKey = beaKey)

# print(beaSearch('personal consumption', beaKey))

# print("")

# print(beaSearch('gdp', beaKey, asHtml = FALSE))
# a <- beaSearch('gdp', beaKey, asHtml = FALSE)

# print(head(a))
# print(tail(a))

# https://apps.bea.gov/api/data/?&UserID=123123123123123123123123&method=GetData&datasetname=Regional&TableName=CAGDP1&LineCode=3&GeoFIPS=COUNTY&Year=2020&ResultFormat=XML
beaSpecs <- list(
	'UserID' = beaKey ,
	'Method' = 'GetData',
  'tablename' = 'CAGDP1',
	'datasetname' = 'Regional',
	'Year' = '2020',
	'ResultFormat' = 'json',
  'LineCode'='3',
  'GeoFIPS'='COUNTY'
)
beaPayload <- beaGet(beaSpecs)

print(beaPayload)