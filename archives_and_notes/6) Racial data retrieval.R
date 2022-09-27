# Load the tidycensus package into your R session
library(tidycensus)

# # testing purposes
# id_county_fips = "78030"


# ncdemography.org/2022/05/16/story-recipe-how-to-obtain-census-data-using-r-tidycensus/
# tips on which variables to use for filtering for 2020
# all_vars_acs5 <- load_variables(a, year=2020)
# print(all_vars_acs5)
# a = get_decennial(geography = "county", variables = "P2_001N", year = 2020)
# print(a)

# a = get_decennial(geography = "county", variables = "P2_002N", year = 2020)
# print(a)

# a = get_decennial(geography = "county", variables = "P2_005N", year = 2020)
# print(a)

desired_vars = c(
        all = "P2_001N", # All Residents
        hisp = "P2_002N", # Hispanic
        white = "P2_005N", # White
        baa = "P2_006N", # Black or African American
        amin = "P2_007N", # Native American(American Indian in data)
        asian = "P2_008N", # Asian
        nhopi = "P2_009N", # Native Hawaiian or Pacific Islander
        other = "P2_010N", # Some Other Race
        multi = "P2_011N" # Two or More Races
       )

a = get_decennial(
  geography = "county",
  variables = desired_vars,
  summary_var = "P2_001N", # Same as 'All'
  year = 2020
)
print(head(a))

# https://dcl-wrangle.stanford.edu/census.html
# guide on how to use tidycensus with various table data

# #####
# all_vars_acs5 <- 
#   load_variables(year = 2019, dataset = "acs5")

# print(all_vars_acs5)

# print(
#     all_vars_acs5 %>% 
#   filter(concept != "SEX BY AGE")
# )
# ######