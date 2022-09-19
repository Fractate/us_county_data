# use the cached zip file name to download directly without having to re-scrape for the needed urls

# Function name is 
get_county_road_data <- function(zip_file_name, roads_length, intersections) {
    
    origin_website_zip_file_link <- paste(shapefile_2020_website_text, zip_file_name, sep = "")
    zip_file_name_converted_to_shp <- paste(file_path_sans_ext(zip_file_name), ".shp", sep="") # shp and shx files must be used in tandem
    zip_file_name_converted_to_shx <- paste(file_path_sans_ext(zip_file_name), ".shx", sep="") # file_path_sans_ext(a) removes extensions from file names
    
    # print(zip_file_name_converted_to_shp)

    # road_boundary_HARV <- st_read(zip_file_name_converted_to_shp)
    # road_boundary_HARV <- st_read('tl_2020_48441_roads.shp')
    # road_boundary_HARV <- st_read('tl_2020_01001_roads.shp')

    # print("test road_boundary_HARV")
    # print(road_boundary_HARV)
    # print(file.exists(zip_file_name_converted_to_shp))
    # print(!file.exists(zip_file_name_converted_to_shp))
    # print(file.exists('tl_2020_48441_roads.shp'))
    # print(!file.exists('tl_2020_48441_roads.shp'))
    # print(file.exists('tl_2020_01001_roads.shp'))
    # print(!file.exists('tl_2020_01001_roads.shp'))
    
    # If file doesn't already exist then bring in & create file
    if(!file.exists(zip_file_name_converted_to_shp)) {
        shapefile_2020_website_text <- "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/"
        # destination_zip_file_directory <-  paste(download_directory, a, sep = "")
        # Extrapolate file level directory information for each row found from US Census Tiger data
        temp <- tempfile()
        download.file(origin_website_zip_file_link, destfile = temp)

        shp_file_from_zip <- unzip(temp, zip_file_name_converted_to_shp, list = FALSE)
        shx_file_from_zip <- unzip(temp, zip_file_name_converted_to_shx, list = FALSE)

        shp_file <- file_create(shp_file_from_zip)
        file_create(shx_file_from_zip)
    }

    ### Retrieve the shp_file that was saved above and read that into boundary variable
    # I have no idea why the naming standard has the users use the term "HARV" but here we are
    # road_boundary_HARV <- st_read(shp_file)
    road_boundary_HARV <- st_read(zip_file_name_converted_to_shp)

    # Retrieve geometry attributes from road_boundary_HARV for processing, crs sets the length to be base meters in north america
    sd = st_sfc(geometry=road_boundary_HARV$geometry, crs=4326)

    # Verify the calculation of lengths and intersections within the shapefile
    st_area(sd) # this returns only 0 because shapefile only includes the vectors of the roads
    attributes(sd)
    # st_intersects(sd) # shows number of intersects

    # # https://cengel.github.io/R-spatial/spatialops.html
    # todo: have a 2d dataframe to iterate through in order to gather information
    stint <- st_intersects(sd)

    total_intersects = 0
    for(i in 1:nrow(stint)) {
        for(j in 1:lengths(stint[i])) {
            # if the intersection occurs with a road already considered, skip
            # if the intersections occurs with new roads, increment total_intersects
            if (stint[[i]][j] > i){
                total_intersects = total_intersects + 1
            }
        }
    }
    roads_length <- sum(st_length(sd)) # - shows distance in meters
    intersections <- total_intersects

    return(c(as.numeric(roads_length), intersections))
}