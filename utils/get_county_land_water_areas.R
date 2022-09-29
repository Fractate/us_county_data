# https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_counties_current.html
library(rvest)
library(tools)
library("dplyr") # loading the required library for search() df

# Function initialization
get_county_land_water_areas <- function() {

  root_county_areas_2020_directory <- "https://tigerweb.geo.census.gov/tigerwebmain/"
  county_areas_2020_link <- "https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_counties_current.html"

  html <- read_html(county_areas_2020_link)

  # per_state_land_website <- html %>% html_elements("tr") %>% html_elements("td") %>% html_element("a") %>% html_attr('href')
  per_state_land_website <- html %>% html_elements("td") %>% html_element("a") %>% html_attr('href')

  # initialize empty dataframe for appending new data
  df_states <- data.frame()

  for(i in per_state_land_website){
    # state_html <- read_html(paste(root_county_areas_2020_directory, i, sep=""))
    state_html <- read_html(paste(root_county_areas_2020_directory,i, sep=""))

    df_states <- rbind(state_html %>% html_element("table") %>% html_table(), df_states)
    # df_states <- state_html %>% html_element("table") %>% html_table()
  }

  # keep only the state, county, fips, area_land, area_water
  df_output <- df_states %>% select(c("STATE", "COUNTY", "AREALAND", "AREAWATER"))
  colnames(df_output)  <- c("state", "county", "area_land", "area_water")

  # append fips column to df_output
  df_output['fips'] <- ((df_output['state'] * 1000) + df_output['county'])

  # order dataframe based on fips
  df_output <- df_output[order(df_output['fips']),]

  # write.csv(df_output,".\\export2.csv", row.names = FALSE)
  return(df_output)
}