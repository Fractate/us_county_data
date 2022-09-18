# use the cached zip file name to download directly without having to re-scrape for the needed urls

# Function name is 
get_county_road_data <- function(zip_file_name, roads_length, intersections) {
    
    
    shapefile_2020_website_text <- "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/"
    # destination_zip_file_directory <-  paste(download_directory, a, sep = "")
    # Extrapolate file level directory information for each row found from US Census Tiger data
    origin_website_zip_file_link <- paste(shapefile_2020_website_text, zip_file_name, sep = "")
    zip_file_name_converted_to_shp <- paste(file_path_sans_ext(zip_file_name), ".shp", sep="") # shp and shx files must be used in tandem
    zip_file_name_converted_to_shx <- paste(file_path_sans_ext(zip_file_name), ".shx", sep="") # file_path_sans_ext(a) removes extensions from file names

    temp <- tempfile()
    download.file(origin_website_zip_file_link, destfile = temp)

    shp_file_from_zip <- unzip(temp, zip_file_name_converted_to_shp, list = FALSE)
    shx_file_from_zip <- unzip(temp, zip_file_name_converted_to_shx, list = FALSE)

    shp_file <- file_create(shp_file_from_zip)
    file_create(shx_file_from_zip)

    ### Retrieve the shp_file that was saved above and read that into boundary variable
    # I have no idea why the naming standard has the users use the term "HARV" but here we are
    road_boundary_HARV <-  st_read(shp_file)

    # Retrieve geometry attributes from road_boundary_HARV for processing
    sd = st_sfc(geometry=road_boundary_HARV$geometry, crs=4326)

    # Verify the calculation of lengths and intersections within the shapefile
    st_area(sd) # this returns only 0 because shapefile only includes the vectors of the roads
    attributes(sd)
    st_length(sd) # - shows distance in meters
    print(st_length(sd)) # - shows distance in meters
    print(class(st_length(sd))) # - shows distance in meters
    st_intersects(sd) # shows number of intersects
    print(st_intersects(sd)) # shows number of intersects
    print(class(st_intersects(sd))) # shows number of intersects
    # print(st_intersects(sd, sparse = FALSE)) # shows number of intersects
    # print(class(st_intersects(sd, sparse = FALSE))) # shows number of intersects

    # https://cengel.github.io/R-spatial/spatialops.html


    # todo: have a 2d dataframe to iterate through in order to gather information
    stint <- st_intersects(sd)
    print("flagtest")
    print(stint[0])
    print(stint[1])
    print(stint[2])
    print("flagtest2")
}
