# use the cached zip file name to download directly without having to re-scrape for the needed urls

# Function name is 
get_county_road_length_intersects <- function(df_fips_id) {
    
    if(!file.exists("get_county_road_data_tiger.csv")) {

        # add a column to df_lj to house total length and intersections
        # df_fips[ , 'roads_length', 'intersections'] <- NA
        empty_cols <- c('roads_length', 'intersections')
        df_fips[ , empty_cols] <- NA
            
        # # for loop will be needed for road data retrieval per each county
        for(i in 2:nrow(df_fips)) {
        # for(i in 2:3) {
            # print(df_lj[i]['X.county_zip_file_name.'])
            # print(df_lj[i][value])
            # print(i)
            # print(df_lj[i,2])

            # print(class(df_lj[i,]))
            # Set up new class to handle populating road lengths and number of intersections
            temp <- get_county_road_data(df_lj[i,2], df_lj[i,5], df_lj[i,6])
            df_fips[i,5] <- temp[1]
            df_fips[i,6] <- temp[2]
        }

        write.csv(df_lj,".\\get_county_road_data_tiger.csv", row.names = FALSE)
    }
    else {
        df <- read.csv(".\\get_county_road_data_tiger.csv", header=TRUE, stringsAsFactors=FALSE)
        return(df)
    }
}





# Function name is 
get_county_road_data_1 <- function(zip_file_name) {
    
    # Set naming string variables
    shapefile_2020_website_text <- "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/"
    origin_website_zip_file_link <- paste(shapefile_2020_website_text, zip_file_name, sep = "")
    zip_file_name_converted_to_shp <- paste(file_path_sans_ext(zip_file_name), ".shp", sep="") # shp and shx files must be used in tandem
    zip_file_name_converted_to_shx <- paste(file_path_sans_ext(zip_file_name), ".shx", sep="") # file_path_sans_ext(a) removes extensions from file names
    
    # If file doesn't already exist then bring in & create file
    if(!file.exists(zip_file_name_converted_to_shp)) {
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