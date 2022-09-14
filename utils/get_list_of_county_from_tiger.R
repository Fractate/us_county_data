# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/

# Function name is 
get_county_list <- function(website_link) {
    
    html <- read_html("https://www2.census.gov/geo/tiger/TIGER2020/ROADS/")
  
    tiger_county_list <- html %>% html_element("table") %>% html_table()

    
    # for(i in 3:3){
    #     a <- tiger_county_list[i,2] # returns column of zip file names found in the US Census Tiger data
    #     print(a)
    # }

    # for(i in 3235:3234){
    #   a <- tiger_county_list[i,2] # returns column of zip file names found in the US Census Tiger data
    #   print(a)
    # }

    # dataframe was considered in containin county id per each county. using out() instead if possible
    # df <- data.frame(first_column, second_column)
    

    out <- c()
    # Beginning and ending points of the counties list is hard coded
    for(i in 3:3234){
        a <- tiger_county_list[i,2] # returns column of zip file names found in the US Census Tiger data
        out <- c(a, str_sub(a, 9, 14))
    }

    return(out)
}