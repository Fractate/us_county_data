library(sf)

aoi_boundary_HARV <- st_read("tl_2020_36061_roads.shp", layer = shape,
                             quiet = TRUE, stringsAsFactors = FALSE)

zip.file.extract(file, zipname = "tl_2020_30041_roads.zip", unzip = getOption("unzip"))





library(tigris)

# ct <- counties()
# 
# class(ct)
# 
# print(ct)
# 
# 
# names(ct)
# 
# 
# newdata <- ct[order(newdata$GEOID),]
# 
# 
# ct
# 
# newdata
# 

rd <- roads(year = 2020, county = 'Forsyth', state = 'GA')

rd

cd2 <- tigris.load_tiger("tl_2020_36061_roads.shp", tigris_type = "road")
cd2
