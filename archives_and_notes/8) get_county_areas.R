# 4) Get the total area of each of the counties
# https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_counties_current.html


library(rvest)
library(tools)


root_county_areas_2020_directory <- "https://tigerweb.geo.census.gov/tigerwebmain/"
county_areas_2020_link <- "https://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_counties_current.html"


html <- read_html(county_areas_2020_link)

# test1 <- html %>% html_elements("tr") %>% html_elements("td") %>% html_element("a") %>% html_attr('href')
test1 <- html %>% html_elements("td") %>% html_element("a") %>% html_attr('href')

for(i in test1){
  # html <- read_html(paste(root_county_areas_2020_directory, i, sep=""))
html <- read_html(paste(root_county_areas_2020_directory,i, sep=""))

  table2 <- html %>% html_element("table") %>% html_table()

  print(table2)
}
# test1[1]
# html <- read_html(paste(root_county_areas_2020_directory, test1[1], sep=""))
# 
# table2 <- html %>% html_element("table") %>% html_table()
# 
# print(table2)
