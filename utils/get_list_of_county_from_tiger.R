# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/

# Function name is 
get_county_list <- function() {
    
    html <- read_html("https://www2.census.gov/geo/tiger/TIGER2020/ROADS/")
  
    tiger_county_list <- html %>% html_element("table") %>% html_table()

    
    # for(i in 3:3){
    #     a <- tiger_county_list[i,2] # returns column of zip file names found in the .  US Census Tiger data
    #     print(a)
    # }

    # for(i in 3235:3234){
    #   a <- tiger_county_list[i,2] # returns column of zip file names found in the US Census Tiger data
    #   print(a)
    # }

    # dataframe was considered in containin county id per each county. using out() instead if possible
    # df <- data.frame(first_column, second_column)
    
    df <- data.frame("fips_count_id", "county_zip_file_name")
    # Beginning and ending points of the counties list is hard coded
    for(i in 3:3234){
        zip_file_name <- tiger_county_list[i,2] # returns column of zip file names found in the US Census Tiger data
        # out <- c(a, str_sub(a, 9, 13))
        # out <- c(out, c(a, str_sub(a, 9, 13)))
        df[nrow(df) + 1,] = c(str_sub(zip_file_name, 9, 13), zip_file_name)
    }
    
    return(df)
}