# https://datacarpentry.org/r-raster-vector-geospatial/06-vector-open-shapefile-in-r/index.html

library(sf)

## reading shapefile
# https://datacarpentry.org/r-raster-vector-geospatial/06-vector-open-shapefile-in-r/index.html

## Go after the shape files

# if the file already is extracted from the zip file, skip this step


# 
aoi_boundary_HARV <- st_read("tl_2020_36061_roads.shp")


# st_geometry_type(aoi_boundary_HARV)
#
# head(aoi_boundary_HARV, n=10)
#
#
geometry_data <- aoi_boundary_HARV$geometry
# geometry_data <- head(aoi_boundary_HARV, n=1)$geometry

attributes(aoi_boundary_HARV$geometry)
st_set_crs(aoi_boundary_HARV, 4326)
st_set_crs(aoi_boundary_HARV$geometry, 4326)
attributes(aoi_boundary_HARV$geometry)

st_length(aoi_boundary_HARV)

# 
# sd = st_sf(geometry=st_sfc(geometry_data), crs=4326)
sd = st_sfc(geometry=geometry_data, crs=4326)

attributes(sd)
st_length(sd) # - shows distance in meters




st_intersects(sd)

test1_length <- st_length(sd)
test1_length

sort(test1_length, decreasing = TRUE)







aoi_boundary_HARV$len = st_length(aoi_boundary_HARV)
aoi_boundary_HARV$len





geometry_data
data(geometry_data)
View(geometry_data)

view(geometry_data[1])

# -73.99712
#  40.72893


# What is the SRID of census.gov shapefiles? - SRID might be used to be placeholder for data regarding how to read TIGER data?
# https://gis.stackexchange.com/questions/27702/what-is-the-srid-of-census-gov-shapefiles


# test2_length <- st_length(st_transform(geometry, 4326)::geography)::text
# the number 2469 came from the link below
# https://gis.stackexchange.com/questions/27702/what-is-the-srid-of-census-gov-shapefiles

# the value has been verified with me valudating the manual data coordinates from view(geometry_data[[1]]) vs the website result following
# https://epsg.io/map#srs=4326&x=-73.997160&y=40.728870&z=17&layer=streets

# test2_length <- st_length(st_transform(aoi_boundary_HARV, 4326))
# it's recommended to not transform the SRID of objects.

# i am now validating the SRID of current data, see if that infofrmation is stored somewhere

# # Coordinate system is not foundas seen below
# st_crs(aoi_boundary_HARV)
st_set_crs(aoi_boundary_HARV, 4326)



st_crs(aoi_boundary_HARV)



attributes(geometry_data)

attributes(aoi_boundary_HARV)




# test2_length <- st_length(st_transform(geometry, 4269)::geography)::text




# Using ST_Transform() to get the length of a LineString using SRID 4326 returning very small numbers
# https://gis.stackexchange.com/questions/414072/using-st-transform-to-get-the-length-of-a-linestring-using-srid-4326-returning


st_length(aoi_boundary_HARV)

tot_length = units::set_units(sum(st_length(aoi_boundary_HARV)), km)

tot_length = units::set_units(st_length(aoi_boundary_HARV), m)

tot_length


length_df <- st_length(aoi_boundary_HARV)

length_df <-length_df * 1609.34

length_df

attributes(length_df)

units::set_units(length_df, m)


### the below does a calculation of points' distances not following the actual data 
# st_distance(aoi_boundary_HARV)

st_intersects(aoi_boundary_HARV)

test1_length <- st_length(sd)
test1_length

sort(test1_length, decreasing = TRUE)





# intersections per line formula?

st_area(aoi_boundary_HARV)

st_geometry_type(aoi_boundary_HARV)

print(aoi_boundary_HARV)

head(aoi_boundary_HARV, n=10)

print("Geometry Data")
geometry_data <- aoi_boundary_HARV[[1]]$geometry

geometry_data <- head(aoi_boundary_HARV, n=1)$geometry
geometry_data2 <- head(aoi_boundary_HARV, n=1)$geometry$length


print(geometry_data)
print(geometry_data2)

geometry_data
geometry_data2


library(tidyverse)
geometry_data %>% arrange(desc(Sepal.Length))



# ####
#
# # Separate out the list of counties and use those as the basis, also know the county mapping table information
#
#
#
# # Specify URL where file is stored
# url <- "ttps://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01001_roads.zip"
#
# # Specify destination where file should be saved
#

# /tl_2020_36061_roads.shp
# https://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01001_roads.zip

#
# aoi_boundary_HARV <- st_read(
#   "https://www2.census.gov/geo/tiger/TIGER2020/ROADS/tl_2020_01001_roads.zip")
#
#
#
#
# ####################
# # Retrieving the lengths of all the roads in shapefile
# geometry_data
# summated data = sum(st_length(aoi_boundary_HARV))
# ####################


#
#
#
# st_bbox(aoi_boundary_HARV)
#
# aoi_boundary_HARV
#
#
# ggplot() +
#   geom_sf(data = aoi_boundary_HARV, size = 3, color = "black", fill = "cyan1") +
#   ggtitle("AOI Boundary Plot") +
#   coord_sf()
#
# head(mydata, n=10)




