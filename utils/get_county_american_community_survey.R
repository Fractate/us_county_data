
# ############################################################################################################################################
# FOLLOWING DATA DOES NOT RETRIEVE COUNTY LEVLE INFORMATION
# ############################################################################################################################################
# ### https://api.census.gov/data/2019/acs/acs1/groups/B12007.html
# ## B12007_001	Estimate!!Median age at first marriage --!!Male
# ## B12007_002	Estimate!!Median age at first marriage --!!Female
# # B12007	MEDIAN AGE AT FIRST MARRIAGE
# B12007_median_age_first_marriage_by_sex_df <- get_acs(geography = "county", variables = c(B12007_male_median_age_first_marriage   = "B12007_001",
#                                                                                           B12007_female_median_age_first_marriage = "B12007_002"),
#                 year = 2020,) %>%
#   select(GEOID, variable, estimate) %>% 
#   spread(variable, estimate) %>% 
#   rename(fips = "GEOID")
# ############################################################################################################################################


# ############################################################################################################################################
# THE FOLLOWING CODE DOES NOT RETRIEVE COUNTY LEVEL DATA
# ############################################################################################################################################
# ### https://api.census.gov/data/2019/acs/acs1/groups/B12503.html
# ## B12503_002	Estimate!!Total:!!Male:
# ## B12503_003	Estimate!!Total:!!Male:!!Never married
# ## B12503_004	Estimate!!Total:!!Male:!!Ever married:
# ## B12503_007	Estimate!!Total:!!Female:
# ## B12503_008	Estimate!!Total:!!Female:!!Never married
# ## B12503_009	Estimate!!Total:!!Female:!!Ever married:
# # B12503	DIVORCES IN THE LAST YEAR BY SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER
# B12503_divorces_last_year_by_sex_df <- get_acs(geography = "county", variables = c(B12503_male_total           = "B12503_002",
#                                                                                    B12503_male_never_married   = "B12503_003",
#                                                                                    B12503_male_ever_married    = "B12503_004",
#                                                                                    B12503_female_total         = "B12503_007",
#                                                                                    B12503_female_never_married = "B12503_008",
#                                                                                    B12503_female_ever_married  = "B12503_009"),
#                 year = 2020,) %>%
#   select(GEOID, variable, estimate) %>% 
#   spread(variable, estimate) %>% 
#   rename(fips = "GEOID")
# ############################################################################################################################################


###############################################################################################################
    ### Interesting variables but not used in research due to too much specific details that may not directly correspond

    # S0801	COMMUTING CHARACTERISTICS BY SEX
    # S2402	OCCUPATION BY SEX FOR THE FULL-TIME, YEAR-ROUND CIVILIAN EMPLOYED POPULATION 16 YEARS AND OVER  
    # B07001	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY AGE FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B07009	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY EDUCATIONAL ATTAINMENT FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B07010	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY INDIVIDUAL INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS) FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B11001	HOUSEHOLD TYPE (INCLUDING LIVING ALONE)
    # B11011	HOUSEHOLD TYPE BY UNITS IN STRUCTURE

    # B08133	AGGREGATE TRAVEL TIME TO WORK (IN MINUTES) OF WORKERS BY TIME OF DEPARTURE TO GO TO WORK
    
    ### https://api.census.gov/data/2019/acs/acs1/groups/B01001.html
    # B01001	SEX BY AGE
    ## B01001_002	Male:
    ## B01001_026	Female:
    
    ### https://api.census.gov/data/2019/acs/acs1/groups/B01003.html
    # B01003	TOTAL POPULATION
    ## B01003_001	Total
    
    ### https://api.census.gov/data/2019/acs/acs1/groups/B14001.html
    # B14001	SCHOOL ENROLLMENT BY LEVEL OF SCHOOL FOR THE POPULATION 3 YEARS AND OVER
    ## B14001_001	Total:
    ## B14001_002	Enrolled in school:

    # using B15002 instead because it compiles all male and female data (respectively) for all age over 25 instead of breaking it down into sub age groups in B15002
    ### https://api.census.gov/data/2019/acs/acs1/groups/B15001.html
    # B15001	SEX BY AGE BY EDUCATIONAL ATTAINMENT FOR THE POPULATION 18 YEARS AND OVER

    # ### https://api.census.gov/data/2019/acs/acs1/groups/B15002.html
    # ## B15002_001	Estimate!!Total:
    # ## B15002_002	Estimate!!Total:!!Male:
    # ## B15002_003	Estimate!!Total:!!Male:!!No schooling completed
    # ## B15002_004	Estimate!!Total:!!Male:!!Nursery to 4th grade
    # ## B15002_005	Estimate!!Total:!!Male:!!5th and 6th grade
    # ## B15002_006	Estimate!!Total:!!Male:!!7th and 8th grade
    # ## B15002_007	Estimate!!Total:!!Male:!!9th grade
    # ## B15002_008	Estimate!!Total:!!Male:!!10th grade
    # ## B15002_009	Estimate!!Total:!!Male:!!11th grade
    # ## B15002_010	Estimate!!Total:!!Male:!!12th grade, no diploma
    # ## B15002_011	Estimate!!Total:!!Male:!!High school graduate (includes equivalency)
    # ## B15002_012	Estimate!!Total:!!Male:!!Some college, less than 1 year
    # ## B15002_013	Estimate!!Total:!!Male:!!Some college, 1 or more years, no degree
    # ## B15002_014	Estimate!!Total:!!Male:!!Associat"s degree
    # ## B15002_015	Estimate!!Total:!!Male:!!Bachelor"s degree
    # ## B15002_016	Estimate!!Total:!!Male:!!Master"s degree
    # ## B15002_017	Estimate!!Total:!!Male:!!Professional school degree
    # ## B15002_018	Estimate!!Total:!!Male:!!Doctorate degree
    # ## B15002_019	Estimate!!Total:!!Female:
    # ## B15002_020	Estimate!!Total:!!Female:!!No schooling completed
    # ## B15002_021	Estimate!!Total:!!Female:!!Nursery to 4th grade
    # ## B15002_022	Estimate!!Total:!!Female:!!5th and 6th grade
    # ## B15002_023	Estimate!!Total:!!Female:!!7th and 8th grade
    # ## B15002_024	Estimate!!Total:!!Female:!!9th grade
    # ## B15002_025	Estimate!!Total:!!Female:!!10th grade
    # ## B15002_026	Estimate!!Total:!!Female:!!11th grade
    # ## B15002_027	Estimate!!Total:!!Female:!!12th grade, no diploma
    # ## B15002_028	Estimate!!Total:!!Female:!!High school graduate (includes equivalency)
    # ## B15002_029	Estimate!!Total:!!Female:!!Some college, less than 1 year
    # ## B15002_030	Estimate!!Total:!!Female:!!Some college, 1 or more years, no degree
    # ## B15002_031	Estimate!!Total:!!Female:!!Associat"s degree
    # ## B15002_032	Estimate!!Total:!!Female:!!Bachelor"s degree
    # ## B15002_033	Estimate!!Total:!!Female:!!Master"s degree
    # ## B15002_034	Estimate!!Total:!!Female:!!Professional school degree
    # ## B15002_035	Estimate!!Total:!!Female:!!Doctorate degree
    # # B15002	SEX BY EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER
    # education_by_gender_df <- get_acs(geography = "county", variables = c("B15002_001",
    #                                                                       "B15002_002",
    #                                                                       "B15002_003",
    #                                                                       "B15002_004",
    #                                                                       "B15002_005",
    #                                                                       "B15002_006",
    #                                                                       "B15002_007",
    #                                                                       "B15002_008",
    #                                                                       "B15002_009",
    #                                                                       "B15002_010",
    #                                                                       "B15002_011",
    #                                                                       "B15002_012",
    #                                                                       "B15002_013",
    #                                                                       "B15002_014",
    #                                                                       "B15002_015",
    #                                                                       "B15002_016",
    #                                                                       "B15002_017",
    #                                                                       "B15002_018",
    #                                                                       "B15002_019",
    #                                                                       "B15002_020",
    #                                                                       "B15002_021",
    #                                                                       "B15002_022",
    #                                                                       "B15002_023",
    #                                                                       "B15002_024",
    #                                                                       "B15002_025",
    #                                                                       "B15002_026",
    #                                                                       "B15002_027",
    #                                                                       "B15002_028",
    #                                                                       "B15002_029",
    #                                                                       "B15002_030",
    #                                                                       "B15002_031",
    #                                                                       "B15002_032",
    #                                                                       "B15002_033",
    #                                                                       "B15002_034",
    #                                                                       "B15002_035"), year = 2020,)

    
    # ##### NOT WORKING, COUNTY VALUES NOT FOUND
    # ### https://data.census.gov/cedsci/table?q=S2602%3A%20CHARACTERISTICS%20OF%20THE%20GROUP%20QUARTERS%20POPULATION%20BY%20GROUP%20QUARTERS%20TYPE%20%283%20TYPES%29&g=0100000US&y=2019&tid=ACSST1Y2021.S2602
    # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2602.html
    # ## S2602_C01_004E	Estimate!!Total population!!Total population!!SEX AND AGE!!Under 15 years
    # # S2602	CHARACTERISTICS OF THE GROUP QUARTERS POPULATION BY GROUP QUARTERS TYPE (3 TYPES)
    # countyDf <- get_acs(geography = "county", variables = c("S2602_C01_004E","S2602_C01_009"),
    #                     year = 2020,) %>%
    #   select(GEOID, variable, estimate) %>% 
    #   spread(variable, estimate) %>% 
    # 

###############################################################################################################

###############################################################################################################
    #### initial research will exclusively be in relations to non-race specific data
    # it looks like people of color drive less
    # later researcb will include racial data
    # B08105A	MEANS OF TRANSPORTATION TO WORK (WHITE ALONE)
    # B08105B	MEANS OF TRANSPORTATION TO WORK (BLACK OR AFRICAN AMERICAN ALONE)
    # B08105C	MEANS OF TRANSPORTATION TO WORK (AMERICAN INDIAN AND ALASKA NATIVE ALONE)
    # B08105D	MEANS OF TRANSPORTATION TO WORK (ASIAN ALONE)
    # B08105E	MEANS OF TRANSPORTATION TO WORK (NATIVE HAWAIIAN AND OTHER PACIFIC ISLANDER ALONE)
    # B08105F	MEANS OF TRANSPORTATION TO WORK (SOME OTHER RACE ALONE)
    # B08105G	MEANS OF TRANSPORTATION TO WORK (TWO OR MORE RACES)
    # B08105H	MEANS OF TRANSPORTATION TO WORK (WHITE ALONE, NOT HISPANIC OR LATINO)
    # B08105I	MEANS OF TRANSPORTATION TO WORK (HISPANIC OR LATINO)
    # B08111	MEANS OF TRANSPORTATION TO WORK BY CITIZENSHIP STATUS
    # B08113	MEANS OF TRANSPORTATION TO WORK BY LANGUAGE SPOKEN AT HOME AND ABILITY TO SPEAK ENGLISH
###############################################################################################################

#################################################################################
# Notes based off https://geodacenter.github.io/opioid-environment-toolkit/getACSData-tutorial.html
#################################################################################
# 
# countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01001_001", 
#                                                         hispanic ="B03003_003", 
#                                                         notHispanic = "B03003_002",
#                                                         white = "B02001_002", 
#                                                         afrAm = "B02001_003", 
#                                                         asian = "B02001_005"), 
#                     year = 2018, state = 'IL', geometry = FALSE) %>% 
#   select(GEOID, NAME, variable, estimate) %>% 
#   spread(variable, estimate) %>% 
#   mutate(hispPr18  = hispanic/totPop18, whitePr18 = white/totPop18,
#          afrAmPr18 = afrAm/totPop18, asianPr18 = asian/totPop18) %>%
#   select(GEOID,totPop18,hispPr18,whitePr18,afrAmPr18, asianPr18)
# 
#################################################################################
#################################################################################
# 
# countyDf <- get_acs(geography = "county", variables = c("B01001_001", 
#                                                         "B03003_003", 
#                                                         "B03003_002",
#                                                         "B02001_002", 
#                                                         "B02001_003", 
#                                                         "B02001_005"), year = 2018,) %>% 
#   select(GEOID, NAME, variable, estimate) %>% 
#   spread(variable, estimate) %>% 
#   rename(fips = "GEOID",
#          totPop18 = "B01001_001",
#          hispanic = "B03003_003",
#          notHispanic = "B03003_002",
#          white = "B02001_002",
#          afrAm = "B02001_003",
#          asian = "B02001_005") %>%
#   select(fips,
#          totPop18,
#          hispanic,
#          notHispanic,
#          white,
#          afrAm,
#          asian)
# 
#################################################################################


# Load the tidycensus package into your R session
library(tidycensus)
library(tidyverse)


# Function name is 
get_county_american_community_survey <- function() {
  
  # https://walker-data.com/tidycensus/articles/basic-usage.html
  # https://data.census.gov/cedsci/table?q=B07001%3A%20GEOGRAPHICAL%20MOBILITY%20IN%20THE%20PAST%20YEAR%20BY%20AGE%20FOR%20CURRENT%20RESIDENCE%20IN%20THE%20UNITED%20STATES&g=0100000US&y=2021&tid=ACSDT1Y2021.B07001
  
  ### RETRIEVING ALL THE COES FOR US CENSUS ACS DATA
  # https://www.census.gov/programs-surveys/acs/technical-documentation/table-shells.2020.html#list-tab-SGE1GNSW97MT5EHBKM
  
  # 5 year table list that gives descriptions
  # https://www2.census.gov/programs-surveys/acs/tech_docs/table_shells/table_lists/2020_DataProductList_5Year.xlsx
  
  # 5 year table shells that gives additional details
  # https://www2.census.gov/programs-surveys/acs/summary_file/2020/documentation/user_tools/ACS2020_Table_Shells.xlsx

  
  # https://www.census.gov/acs/www/about/why-we-ask-each-question/vehicles/
  # https://data.census.gov/cedsci/table?tid=ACSDP5Y2020.DP04&g=0400000US13_0500000US13117&hidePreview=true
  # https://geodacenter.github.io/opioid-environment-toolkit/getACSData-tutorial.html
  # https://walker-data.com/tidycensus/reference/get_acs.html
  
  ### List of variables to potentially use
  # initial variables pulled by 2020_DataProductList_5Year.xlsx
  # secondary variables pulled by ACS2020_Table_Shells.xlsx
  
    if(!file.exists("get_county_american_community_survey.csv")){
      
      ###############################################################################################################
      ##### ACS Data I might actually use
      ###############################################################################################################
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2302.html
      ## S2302_C01_015	Estimate!!Total!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      ## S2302_C02_015	Estimate!!Percent!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      # S2302	EMPLOYMENT CHARACTERISTICS OF FAMILIES
      S2302_family_employment_12_months_df <- get_acs(geography = "county", variables = c(S2302_families_no_worker           = "S2302_C01_015",
                                                                                          S2302_families_no_worker_percent   = "S2302_C02_015"),
                                                year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2303.html
      ## S2303_C01_001	Estimate!!Total!!Population 16 to 64 years
      ## S2303_C01_008	Estimate!!Total!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      ## S2303_C02_008	Estimate!!Percent!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      # S2303	WORK STATUS IN THE PAST 12 MONTHS
      S2303_population_work_status_12_months_df <- get_acs(geography = "county", variables = c(S2303_population_16_to_64_total           = "S2303_C01_001",
                                                                                               S2303_population_16_to_64_no_work         = "S2303_C01_008",
                                                                                               S2303_population_16_to_64_no_work_percent = "S2303_C02_008"),
                                                     year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1901.html
      ## S1901_C01_001	Estimate!!Households!!Total
      ## S1901_C01_013	Estimate!!Households!!Mean income (dollars)
      ## S1901_C02_012	Estimate!!Families!!Median income (dollars)
      # S1901	INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      S1901_income_past_12_months_df <- get_acs(geography = "county", variables = c(S1901_households_total         = "S1901_C01_001",
                                                                                    S1901_households_mean_income   = "S1901_C01_013",
                                                                                    S1901_households_median_income = "S1901_C02_012"), year = 2020,) %>%
          select(GEOID, variable, estimate) %>% 
          spread(variable, estimate) %>% 
          rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1902.html
      # # S1902	MEAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1902_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME!!All households
      # ## S1902_C01_002E	Estimate!!Number!!HOUSEHOLD INCOME!!All households!!With earnings ## not using this due to uncertain sources
      # c111 <- get_acs(geography = "county", variables = c("S1902_C01_001"), year = 2020,)
      # 
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1903.html
      # # S1903	MEDIAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1903_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME BY RACE AND HISPANIC OR LATINO ORIGIN OF HOUSEHOLDER!!Householdsv
      # d111 <- get_acs(geography = "county", variables = c("S1903_C01_001"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1101.html
      ## S1101_C01_001	Estimate!!Total!!HOUSEHOLDS!!Total households
      ## S1101_C01_002	Estimate!!Total!!HOUSEHOLDS!!Average household size
      ## S1101_C01_005	Estimate!!Total!!AGE OF OWN CHILDREN!!Households with own children of the householder under 18 years
      ## S1101_C01_010	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Households with one or more people under 18 years
      ## S1101_C01_011	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Households with one or more people 60 years and over
      ## S1101_C01_012	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Householder living alone
      ## S1101_C01_013	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Householder living alone!!65 years and over
      ## S1101_C01_016	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!1-unit structures
      ## S1101_C01_017	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!2-or-more-unit structures
      ## S1101_C01_018	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!Mobile homes and all other types of units
      ## S1101_C01_019	Estimate!!Total!!Total households!!HOUSING TENURE!!Owner-occupied housing units
      ## S1101_C01_020	Estimate!!Total!!Total households!!HOUSING TENURE!!Renter-occupied housing units
      ## S1101_C02_001	Estimate!!Married-couple family household!!HOUSEHOLDS!!Total households
      ### might stick with only households as ther ecan be multiple households per family if the family is big
      ## S1101_C01_003	Estimate!!Total!!FAMILIES!!Total families
      ## S1101_C01_004	Estimate!!Total!!FAMILIES!!Average family size
      # S1101	HOUSEHOLDS AND FAMILIES
      S1101_household_and_families_df <- get_acs(geography = "county", variables = c(S1101_households_total               = "S1101_C01_001",
                                                                                     S1101_household_average_size         = "S1101_C01_002",
                                                                                     S1101_household_with_under_18        = "S1101_C01_005",
                                                                                     S1101_household_one_or_more_under_18 = "S1101_C01_010",
                                                                                     S1101_household_one_or_more_over_60  = "S1101_C01_011",
                                                                                     S1101_household_living_alone         = "S1101_C01_012",
                                                                                     S1101_household_living_alone_over_65 = "S1101_C01_013",
                                                                                     S1101_household_1_unit_structure     = "S1101_C01_016",
                                                                                     S1101_household_2_unit_structure     = "S1101_C01_017",
                                                                                     S1101_household_mobile_misc_homes    = "S1101_C01_018",
                                                                                     S1101_household_total_married        = "S1101_C02_001"),
                                           year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1401.html
      ## S1401_C01_001	Estimate!!Total!!Population 3 years and over enrolled in school
      ## S1401_C01_002	Estimate!!Total!!Population 3 years and over enrolled in school!!Nursery school, preschool
      ## S1401_C01_003	Estimate!!Total!!Population 3 years and over enrolled in school!!Kindergarten to 12th grade
      ## S1401_C01_008	Estimate!!Total!!Population 3 years and over enrolled in school!!College, undergraduate
      ## S1401_C01_009	Estimate!!Total!!Population 3 years and over enrolled in school!!Graduate, professional school
      # S1401	SCHOOL ENROLLMENT
      S1401_population_school_enrollment_df <- get_acs(geography = "county", variables = c(S1401_population_enrolled_in_school         = "S1401_C01_001",
                                                                                           S1401_population_enrolled_in_preschool      = "S1401_C01_002",
                                                                                           S1401_population_enrolled_in_standardschool = "S1401_C01_003",
                                                                                           S1401_population_enrolled_in_undergraduate  = "S1401_C01_008",
                                                                                           S1401_population_enrolled_in_graduate       = "S1401_C01_009"),
                                                 year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1701.html
      ## S1701_C01_001	Estimate!!Total!!Population for whom poverty status is determined
      ## S1701_C01_002	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!Under 18 years
      ## S1701_C01_006	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!18 to 64 years
      ## S1701_C01_010	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!65 years and over
      ## S1701_C01_011	Estimate!!Total!!Population for whom poverty status is determined!!SEX!!Male
      ## S1701_C01_012	Estimate!!Total!!Population for whom poverty status is determined!!SEX!!Female
      ## S1701_C01_022	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over
      ## S1701_C01_023	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Less than high school graduate
      ## S1701_C01_024	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!High school graduate (includes equivalency)
      ## S1701_C01_025	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Some college, associate's degree
      ## S1701_C01_026	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Bachelor's degree or higher
      # S1701	POVERTY STATUS IN THE PAST 12 MONTHS
      S1701_population_poverty_12_months_df <- get_acs(geography = "county", variables = c(S1701_population_poverty_total                    = "S1701_C01_001",
                                                                                           S1701_population_poverty_under_18                 = "S1701_C01_002",
                                                                                           S1701_population_poverty_18_to_64                 = "S1701_C01_006",
                                                                                           S1701_population_poverty_over_65                  = "S1701_C01_010",
                                                                                           S1701_population_poverty_male                     = "S1701_C01_011",
                                                                                           S1701_population_poverty_female                   = "S1701_C01_012",
                                                                                           S1701_population_poverty_over25_total             = "S1701_C01_022",
                                                                                           S1701_population_poverty_over25_no_highschool     = "S1701_C01_023",
                                                                                           S1701_population_poverty_over25_highschool        = "S1701_C01_024",
                                                                                           S1701_population_poverty_over25_some_college      = "S1701_C01_025",
                                                                                           S1701_population_poverty_over25_baschelors_degree = "S1701_C01_026"),
                                                 year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1702.html
      ## S1702_C01_001	Estimate!!All families!!Total!!Families
      ## S1702_C01_042	Estimate!!All families!!Total!!Families!!TENURE!!Renter Occupied
      ## S1702_C01_041	Estimate!!All families!!Total!!Families!!TENURE!!Owner occupied
      # details on the types of poverty
      ## S1702_C01_043	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!50 percent of poverty level
      ## S1702_C01_044	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!125 percent of poverty level
      ## S1702_C01_045	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!150 percent of poverty level
      ## S1702_C01_046	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!185 percent of poverty level
      ## S1702_C01_047	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!200 percent of poverty level
      ## S1702_C01_048	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!300 percent of poverty level
      ## S1702_C01_049	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!400 percent of poverty level
      ## S1702_C01_050	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!500 percent of poverty level
      # It looks like to get percentage, _C02_ should be sufficient
      # S1702	POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES
      S1702_family_poverty_12_months_df <- get_acs(geography = "county", variables = c(S1702_family_poverty_total       = "S1702_C02_001",
                                                                                       S1702_family_poverty_home_renter = "S1702_C02_042",
                                                                                       S1702_family_poverty_home_owner  = "S1702_C02_041"
                                                                                       # ,
                                                                                       # S1702_family_poverty_50_below    = "S1702_C02_043",
                                                                                       # S1702_family_poverty_125_below   = "S1702_C02_044",
                                                                                       # S1702_family_poverty_150_below   = "S1702_C02_045",
                                                                                       # S1702_family_poverty_185_below   = "S1702_C02_046",
                                                                                       # S1702_family_poverty_200_below   = "S1702_C02_047",
                                                                                       # S1702_family_poverty_300_below   = "S1702_C02_048",
                                                                                       # S1702_family_poverty_400_below   = "S1702_C02_049",
                                                                                       # S1702_family_poverty_500_below   = "S1702_C02_050"
                                                                                       ),
                                          year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1301.html
      ## S1301_C01_001	Estimate!!Total!!Women 15 to 50 years
      # S1301	FERTILITY
      S1301_fertility_df <- get_acs(geography = "county", variables = c(S1301_omen_total_15_to_50 = "S1301_C01_001"),
                              year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1501.html
      ## S1501_C01_059	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings
      ## S1501_C01_060	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Less than high school graduate
      ## S1501_C01_061	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!High school graduate (includes equivalency)
      ## S1501_C01_062	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Some college or associate's degree
      ## S1501_C01_063	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Bachelor"s degree
      ## S1501_C01_064	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Graduate or professional degree
      # S1501	EDUCATIONAL ATTAINMENT
      S1501_education_attainment_df <- get_acs(geography = "county", variables = c(S1501_population_over_25_total                   = "S1501_C01_059",
                                                                                   S1501_population_over_25_some_highschool         = "S1501_C01_060",
                                                                                   S1501_population_over_25_completed_highschool    = "S1501_C01_061",
                                                                                   S1501_population_over_25_some_undergraduates     = "S1501_C01_062",
                                                                                   S1501_population_over_25_completed_undergraduate = "S1501_C01_063",
                                                                                   S1501_population_over_25_completed_graduate      = "S1501_C01_064"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
        
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://data.census.gov/cedsci/table?q=S2501&y=2019
      ### https://api.census.gov/data/2019/acs/acs1/subject/groups/S2501.html
      ## S2501_C01_001	Estimate!!Occupied housing units!!Occupied housing units
      ## S2501_C01_032	Estimate!!Occupied housing units!!Occupied housing units!!FAMILY TYPE AND PRESENCE OF OWN CHILDREN!!With related children of householder under 18 years
      # S2501	OCCUPANCY CHARACTERISTICS
      S2501_occupancy_characteristics_df <- get_acs(geography = "county", variables = c(S2501_household_total                  = "S2501_C01_001",
                                                                                        S2501_household_with_relative_under_18 = "S2501_C01_032"),
                                              year = 2020,) %>%
        select(GEOID, variable, estimate) %>%
        spread(variable, estimate) %>%
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://data.census.gov/cedsci/table?q=S2502&g=0100000US
      ### https://api.census.gov/data/2020/acs/acs5/subject/groups/S2502.html
      ## S2502_C02_001	Estimate!!Percent occupied housing units!!Occupied housing units
      ## S2502_C02_011	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!Under 35 years
      ## S2502_C02_012	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!35 to 44 years
      ## S2502_C02_013	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!45 to 54 years
      ## S2502_C02_014	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!55 to 64 years
      ## S2502_C02_015	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!65 to 74 years
      ## S2502_C02_016	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!75 to 84 years
      ## S2502_C02_017	Estimate!!Percent occupied housing units!!Occupied housing units!!AGE OF HOUSEHOLDER!!85 years and over
      ## S2502_C02_018	Estimate!!Percent occupied housing units!!Occupied housing units!!EDUCATIONAL ATTAINMENT OF HOUSEHOLDER!!Less than high school graduate
      ## S2502_C02_019	Estimate!!Percent occupied housing units!!Occupied housing units!!EDUCATIONAL ATTAINMENT OF HOUSEHOLDER!!High school graduate (includes equivalency)
      ## S2502_C02_020	Estimate!!Percent occupied housing units!!Occupied housing units!!EDUCATIONAL ATTAINMENT OF HOUSEHOLDER!!Some college or associate's degree
      ## S2502_C02_021	Estimate!!Percent occupied housing units!!Occupied housing units!!EDUCATIONAL ATTAINMENT OF HOUSEHOLDER!!Bachelor's degree or higher
      ## S2502_C02_022	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 2019 or later
      ## S2502_C02_023	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 2015 to 2018
      ## S2502_C02_024	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 2010 to 2014
      ## S2502_C02_025	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 2000 to 2009
      ## S2502_C02_026	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 1990 to 1999
      ## S2502_C02_027	Estimate!!Percent occupied housing units!!Occupied housing units!!YEAR HOUSEHOLDER MOVED INTO UNIT!!Moved in 1989 or earlier
      # S2502	DEMOGRAPHIC CHARACTERISTICS FOR OCCUPIED HOUSING UNITS
      S2502_occupancy_characteristics_df <- get_acs(geography = "county", variables = c(S2502_households_occupied_total                        = "S2502_C02_001",
                                                                                        S2502_householder_age_under_35                         = "S2502_C02_011",
                                                                                        S2502_householder_age_35_to_44                         = "S2502_C02_012",
                                                                                        S2502_householder_age_45_to_54                         = "S2502_C02_013",
                                                                                        S2502_householder_age_55_to_64                         = "S2502_C02_014",
                                                                                        S2502_householder_age_65_to_74                         = "S2502_C02_015",
                                                                                        S2502_householder_age_75_to_84                         = "S2502_C02_016",
                                                                                        S2502_householder_age_over_85                          = "S2502_C02_017",
                                                                                        S2502_householder_education_no_highschool              = "S2502_C02_018",
                                                                                        S2502_householder_education_highschool                 = "S2502_C02_019",
                                                                                        S2502_householder_education_some_college_or_associates = "S2502_C02_020",
                                                                                        S2502_householder_education_over_undergraduates        = "S2502_C02_021",
                                                                                        S2502_household_moved_into_after_2019                  = "S2502_C02_022",
                                                                                        S2502_household_moved_into_2015_to_2018                = "S2502_C02_023",
                                                                                        S2502_household_moved_into_2010_to_2014                = "S2502_C02_024",
                                                                                        S2502_household_moved_into_2000_to_2009                = "S2502_C02_025",
                                                                                        S2502_household_moved_into_1990_to_1999                = "S2502_C02_026",
                                                                                        S2502_household_moved_into_before_1989                 = "S2502_C02_027"),
                                              year = 2020,) %>%
        select(GEOID, variable, estimate) %>%
        spread(variable, estimate) %>%
        rename(fips = "GEOID")
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://data.census.gov/cedsci/table?q=S2503&g=0100000US&y=2019
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2503.html
      
      ##### household income brackettotals
      ## S2503_C02_001	Estimate!!Occupied housing units!!Occupied housing units
      ## S2503_C02_002	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Less than $5,000
      ## S2503_C02_003	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$5,000 to $9,999
      ## S2503_C02_004	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$10,000 to $14,999
      ## S2503_C02_005	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$15,000 to $19,999
      ## S2503_C02_006	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$20,000 to $24,999
      ## S2503_C02_007	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$25,000 to $34,999
      ## S2503_C02_008	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$35,000 to $49,999
      ## S2503_C02_009	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$50,000 to $74,999
      ## S2503_C02_010	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$75,000 to $99,999
      ## S2503_C02_011	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$100,000 to $149,999
      ## S2503_C02_012	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$150,000 or more
      ## S2503_C02_013	Estimate!!Occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Median household income (dollars)
      
      # S2503  FINANCIAL CHARACTERISTICS
      S2503_household_count_per_income_bracket_df <- get_acs(geography = "county", variables = c(S2503_households_percemt_total                        = "S2503_C02_001",
                                                                                                 S2503_households_percemt_with_income_under_5000       = "S2503_C02_002",
                                                                                                 S2503_households_percemt_with_income_5000_to_10000    = "S2503_C02_003",
                                                                                                 S2503_households_percemt_with_income_10000_to_15000   = "S2503_C02_004",
                                                                                                 S2503_households_percemt_with_income_15000_to_20000   = "S2503_C02_005",
                                                                                                 S2503_households_percemt_with_income_20000_to_25000   = "S2503_C02_006",
                                                                                                 S2503_households_percemt_with_income_25000_to_35000   = "S2503_C02_007",
                                                                                                 S2503_households_percemt_with_income_35000_to_50000   = "S2503_C02_008",
                                                                                                 S2503_households_percemt_with_income_50000_to_75000   = "S2503_C02_009",
                                                                                                 S2503_households_percemt_with_income_75000_to_100000  = "S2503_C02_010",
                                                                                                 S2503_households_percemt_with_income_100000_to_150000 = "S2503_C02_011",
                                                                                                 S2503_households_percemt_with_income_over_150000      = "S2503_C02_012",
                                                                                                 S2503_households_percemt_median_income                = "S2503_C02_013"),
                                              year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://data.census.gov/cedsci/table?q=S2503&g=0100000US&y=2019
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2503.html
      
      ##### percentage of income spent in housing costs per income brackets
      ## S2503_C01_026	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!Less than $20,000!!Less than 20 percent
      ## S2503_C01_027	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!Less than $20,000!!20 to 29 percent
      ## S2503_C01_028	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!Less than $20,000!!30 percent or more
      ## S2503_C01_030	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$20,000 to $34,999!!Less than 20 percent
      ## S2503_C01_031	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$20,000 to $34,999!!20 to 29 percent
      ## S2503_C01_032	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$20,000 to $34,999!!30 percent or more
      ## S2503_C01_034	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$35,000 to $49,999!!Less than 20 percent
      ## S2503_C01_035	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$35,000 to $49,999!!20 to 29 percent
      ## S2503_C01_036	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$35,000 to $49,999!!30 percent or more
      ## S2503_C01_038	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$50,000 to $74,999!!Less than 20 percent
      ## S2503_C01_039	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$50,000 to $74,999!!20 to 29 percent
      ## S2503_C01_040	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$50,000 to $74,999!!30 percent or more
      ## S2503_C01_042	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$75,000 or more!!Less than 20 percent
      ## S2503_C01_043	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$75,000 or more!!20 to 29 percent
      ## S2503_C01_044	Estimate!!Occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME IN THE PAST 12 MONTHS!!$75,000 or more!!30 percent or more
      
      
      ##### Following are NOT used because it doesn't provide relative data in relations to one's income
      ## S2503_C02_014	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!Less than $300
      ## S2503_C02_015	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$300 to $499
      ## S2503_C02_016	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$500 to $799
      ## S2503_C02_017	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$800 to $999
      ## S2503_C02_018	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$1,000 to $1,499
      ## S2503_C02_019	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$1,500 to $1,999
      ## S2503_C02_020	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$2,000 to $2,499
      ## S2503_C02_021	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$2,500 to $2,999
      ## S2503_C02_022	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$3,000 or more
      # S2503  FINANCIAL CHARACTERISTICS
      S2503_housing_cost_percentage_per_incomes_df <- get_acs(geography = "county", variables = c(S2503_housing_cost_percentage_for_incomes_under_20000_under_20_percent    = "S2503_C01_026",
                                                                                                  S2503_housing_cost_percentage_for_incomes_under_20000_20_to_29_percent    = "S2503_C01_027",
                                                                                                  S2503_housing_cost_percentage_for_incomes_under_20000_over_30_percent     = "S2503_C01_028",
                                                                                                  S2503_housing_cost_percentage_for_incomes_20000_to_35000_under_20_percent = "S2503_C01_030",
                                                                                                  S2503_housing_cost_percentage_for_incomes_20000_to_35000_20_to_29_percent = "S2503_C01_031",
                                                                                                  S2503_housing_cost_percentage_for_incomes_20000_to_35000_over_30_percent  = "S2503_C01_032",
                                                                                                  S2503_housing_cost_percentage_for_incomes_35000_to_50000_under_20_percent = "S2503_C01_034",
                                                                                                  S2503_housing_cost_percentage_for_incomes_35000_to_50000_20_to_29_percent = "S2503_C01_035",
                                                                                                  S2503_housing_cost_percentage_for_incomes_35000_to_50000_over_30_percent  = "S2503_C01_036",
                                                                                                  S2503_housing_cost_percentage_for_incomes_50000_to_75000_under_20_percent = "S2503_C01_038",
                                                                                                  S2503_housing_cost_percentage_for_incomes_50000_to_75000_20_to_29_percent = "S2503_C01_039",
                                                                                                  S2503_housing_cost_percentage_for_incomes_50000_to_75000_over_30_percent  = "S2503_C01_040",
                                                                                                  S2503_housing_cost_percentage_for_incomes_over_75000_under_20_percent     = "S2503_C01_042",
                                                                                                  S2503_housing_cost_percentage_for_incomes_over_75000_20_to_29_percent     = "S2503_C01_043",
                                                                                                  S2503_housing_cost_percentage_for_incomes_over_75000_over_30_percent      = "S2503_C01_044"),
                                              year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2801.html
      ### https://data.census.gov/cedsci/table?q=S2801&g=0100000US&y=2019
      ## S2801_C02_002	Estimate!!Percent!!TYPES OF COMPUTER!!Has one or more types of computing devices
      ## S2801_C02_003	Estimate!!Percent!!TYPES OF COMPUTER!!Has one or more types of computing devices!!Desktop or laptop
      ## S2801_C02_005	Estimate!!Percent!!TYPES OF COMPUTER!!Has one or more types of computing devices!!Smartphone
      ## S2801_C01_012	Estimate!!Total!!TYPE OF INTERNET SUBSCRIPTIONS!!With an Internet subscription
      ## S2801_C01_019	Estimate!!Total!!TYPE OF INTERNET SUBSCRIPTIONS!!Without an Internet subscription
      # S2801	TYPES OF COMPUTERS AND INTERNET SUBSCRIPTIONS
      S2801_technology_access_df <- get_acs(geography = "county", variables = c(S2801_percentage_with_computing_device      = "S2801_C02_002",
                                                                                S2801_percentage_with_computer              = "S2801_C02_003",
                                                                                S2801_percentage_with_smartphone            = "S2801_C02_005",
                                                                                S2801_percentage_with_internet_subscription = "S2801_C02_012",
                                                                                S2801_percentage_without_internet           = "S2801_C02_019"),
                                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ##### NOTE - THERE ARE PERCENTAGES AS PER MORGAGE COSTS BUT I AM FOCUSING ONLY ON RENT FOR SIMPLICITIES SAKE
      ### https://api.census.gov/data/2018/acs/acs5/profile/variables.html
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP04.html
      ### https://data.census.gov/cedsci/table?q=DP04&y=2019
      
      ##### Vehicle Specific
      ## DP04_0057	Estimate!!VEHICLES AVAILABLE!!Occupied housing units
      ## DP04_0058P	Estimate!!VEHICLES AVAILABLE!!Occupied housing units!!No vehicles available
      ## DP04_0059P	Estimate!!VEHICLES AVAILABLE!!Occupied housing units!!1 vehicle available
      ## DP04_0060P	Estimate!!VEHICLES AVAILABLE!!Occupied housing units!!2 vehicles available
      ## DP04_0061P	Estimate!!VEHICLES AVAILABLE!!Occupied housing units!!3 or more vehicles available
      
      ##### Housing Specifics
      ## DP04_0037	Estimate!!ROOMS!!Total housing units!!Median rooms
      ## DP04_0119	Estimate!!SELECTED MONTHLY OWNER COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME (SMOCAPI)!!Housing unit without a mortgage
      
      ##### Rent Specific
      ## DP04_0136	Estimate!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)
      ## DP04_0137P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!Less than 15.0 percent
      ## DP04_0138P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!15.0 to 19.9 percent
      ## DP04_0139P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!20.0 to 24.9 percent
      ## DP04_0140P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!25.0 to 29.9 percent
      ## DP04_0141P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!30.0 to 34.9 percent
      ## DP04_0142P	Percent!!GROSS RENT AS A PERCENTAGE OF HOUSEHOLD INCOME (GRAPI)!!Occupied units paying rent (excluding units where GRAPI cannot be computed)!!35.0 percent or more
      # DP04	SELECTED HOUSING CHARACTERISTICS # contains vehicle information
      DP04_vehicle_and_housing_characteristics_df <- get_acs(geography = "county", variables = c(DP04_vehicles_housing_total                  = "DP04_0057",
                                                                                                 DP04_vehicles_0                              = "DP04_0058P",
                                                                                                 DP04_vehicles_1                              = "DP04_0059P",
                                                                                                 DP04_vehicles_2                              = "DP04_0060P",
                                                                                                 DP04_vehicles_3_or_more                      = "DP04_0061P",
                                                                                                 
                                                                                                 DP04_housing_median_room_count               = "DP04_0037",
                                                                                                 DP04_housing_owner_cost_as_percent_income    = "DP04_0119",
                                                                                                 
                                                                                                 DP04_rental_units_total                      = "DP04_0136",
                                                                                                 DP04_rental_cost_less_than_15_percent_income = "DP04_0137P",
                                                                                                 DP04_rental_cost_15_to_20_percent_income     = "DP04_0138P",
                                                                                                 DP04_rental_cost_20_to_25_percent_income     = "DP04_0139P",
                                                                                                 DP04_rental_cost_25_to_30_percent_income     = "DP04_0140P",
                                                                                                 DP04_rental_cost_30_to_35_percent_income     = "DP04_0141P",
                                                                                                 DP04_rental_cost_35_or_more_percent_income   = "DP04_0142P"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP05.html
      ### https://data.census.gov/cedsci/table?q=DP05&y=2019
      ## DP05_0005P	Percent!!SEX AND AGE!!Total population!!Under 5 years
      ## DP05_0006P	Percent!!SEX AND AGE!!Total population!!5 to 9 years
      ## DP05_0007P	Percent!!SEX AND AGE!!Total population!!10 to 14 years
      ## DP05_0008P	Percent!!SEX AND AGE!!Total population!!15 to 19 years
      ## DP05_0009P	Percent!!SEX AND AGE!!Total population!!20 to 24 years
      ## DP05_0010P	Percent!!SEX AND AGE!!Total population!!25 to 34 years
      ## DP05_0011P	Percent!!SEX AND AGE!!Total population!!35 to 44 years
      ## DP05_0012P	Percent!!SEX AND AGE!!Total population!!45 to 54 years
      ## DP05_0013P	Percent!!SEX AND AGE!!Total population!!55 to 59 years
      ## DP05_0014P	Percent!!SEX AND AGE!!Total population!!60 to 64 years
      ## DP05_0015P	Percent!!SEX AND AGE!!Total population!!65 to 74 yearss
      ## DP05_0016P	Percent!!SEX AND AGE!!Total population!!75 to 84 years
      ## DP05_0017P	Percent!!SEX AND AGE!!Total population!!85 years and ove
      ## DP05_0018P	Percent!!SEX AND AGE!!Total population!!Median age (years)
      # DP05	ACS DEMOGRAPHIC AND HOUSING ESTIMATES
      DP05_population_age_groups_df <- get_acs(geography = "county", variables = c(DP05_age_percent_under_5        = "DP05_0005P",
                                                                                   DP05_age_percent_5_to_9         = "DP05_0006P",
                                                                                   DP05_age_percent_10_to_14       = "DP05_0007P",
                                                                                   DP05_age_percent_15_to_19       = "DP05_0008P",
                                                                                   DP05_age_percent_20_to_24       = "DP05_0009P",
                                                                                   DP05_age_percent_25_to_34       = "DP05_0010P",
                                                                                   DP05_age_percent_35_to_44       = "DP05_0011P",
                                                                                   DP05_age_percent_45_to_54       = "DP05_0012P",
                                                                                   DP05_age_percent_55_to_59       = "DP05_0013P",
                                                                                   DP05_age_percent_60_to_64       = "DP05_0014P",
                                                                                   DP05_age_percent_65_to_74       = "DP05_0015P",
                                                                                   DP05_age_percent_75_to_84       = "DP05_0016P",
                                                                                   DP05_age_percent_over_85        = "DP05_0017P",
                                                                                   DP05_age_population_median_age  = "DP05_0018P"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2019/acs/acs1/groups/B08121.html
      ### https://data.census.gov/cedsci/table?q=B08121&y=2019
      ## B08121_001	Total:
      ## B08121_002	Car, truck, or van - drove alone
      ## B08121_003	Car, truck, or van - carpooled
      ## B08121_004	Public transportation (excluding taxicab)
      ## B08121_005	Walked
      ## B08121_006	Taxicab, motorcycle, bicycle, or other means
      ## B08121_007	Worked from home
      # B08121	MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS) BY MEANS OF TRANSPORTATION TO WORK
      B08121_median_income_per_transportation_df <- get_acs(geography = "county", variables = c(B08121_median_income_total           = "B08121_001",
                                                                                                B08121_median_income_vehicle_alone   = "B08121_002",
                                                                                                B08121_median_income_vehicle_carpool = "B08121_003",
                                                                                                B08121_median_income_public_transit  = "B08121_004",
                                                                                                B08121_median_income_walked          = "B08121_005",
                                                                                                B08121_median_income_other_means     = "B08121_006",
                                                                                                B08121_median_income_work_from_home  = "B08121_007"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2019/acs/acs1/groups/B09001.html
      ## B09001_002	Estimate!!Total:!!In households:
      ## B09001_003	Estimate!!Total:!!In households:!!Under 3 years
      ## B09001_004	Estimate!!Total:!!In households:!!3 and 4 years
      ## B09001_005	Estimate!!Total:!!In households:!!5 years
      ## B09001_006	Estimate!!Total:!!In households:!!6 to 8 years
      ## B09001_007	Estimate!!Total:!!In households:!!9 to 11 years
      ## B09001_008	Estimate!!Total:!!In households:!!12 to 14 years
      ## B09001_009	Estimate!!Total:!!In households:!!15 to 17 years
      ## additional age range specifics can be found
      # B09001	POPULATION UNDER 18 YEARS BY AGE 
      B09001_population_under_18_df <- get_acs(geography = "county", variables = c(B09001_population_under_18_total = "B09001_002",
                                                                                   B09001_population_under_3        = "B09001_003",
                                                                                   B09001_population_3_to_4         = "B09001_004",
                                                                                   B09001_population_5              = "B09001_005",
                                                                                   B09001_population_6_to_8         = "B09001_006",
                                                                                   B09001_population_9_to_11        = "B09001_007",
                                                                                   B09001_population_12_to_14       = "B09001_008",
                                                                                   B09001_population_15_to_17       = "B09001_009"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://data.census.gov/cedsci/table?q=B11012&y=2019
      ### https://api.census.gov/data/2019/acs/acs1/groups/B11012.html
      ## B11012_001	Estimate!!Total:
      ## B11012_003	Estimate!!Total:!!Married-couple household:!!With own children under 18 years
      ## B11012_006	Estimate!!Total:!!Cohabiting couple household:!!With own children of the householder under 18 years
      ## B11012_010	Estimate!!Total:!!Female householder, no spouse or partner present:!!With own children under 18 years
      ## B11012_015	Estimate!!Total:!!Male householder, no spouse or partner present:!!With own children under 18 years
      # B11012	HOUSEHOLDS BY TYPE
      B11012_households_by_type_df <- get_acs(geography = "county", variables = c(B11012_households_total                        = "B11012_001",
                                                                                  B11012_households_married_couple_with_under_18 = "B11012_003",
                                                                                  B11012_households_cohabitation_with_under_18   = "B11012_006",
                                                                                  B11012_households_single_female_with_under_18  = "B11012_010",
                                                                                  B11012_households_single_male_with_under_18    = "B11012_015"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
      
      ############################################################################################################################################
      ### https://api.census.gov/data/2019/acs/acs1/groups/B11016.html
      ## B11016_002	Estimate!!Total:!!Family households:
      ## B11016_003	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_004	Estimate!!Total:!!Family households:!!3-person household
      ## B11016_005	Estimate!!Total:!!Family households:!!4-person household
      ## B11016_006	Estimate!!Total:!!Family households:!!5-person household
      ## B11016_007	Estimate!!Total:!!Family households:!!6-person household
      ## B11016_008	Estimate!!Total:!!Family households:!!7-or-more-person household
      # B11016	HOUSEHOLD TYPE BY HOUSEHOLD SIZE
      B11016_households_by_size_df <- get_acs(geography = "county", variables = c(B11016_family_households_total     = "B11016_002",
                                                                                  B11016_family_households_2         = "B11016_003",
                                                                                  B11016_family_households_3         = "B11016_004",
                                                                                  B11016_family_households_4         = "B11016_005",
                                                                                  B11016_family_households_5         = "B11016_006",
                                                                                  B11016_family_households_6         = "B11016_007",
                                                                                  B11016_family_households_7_or_more = "B11016_008"),
                      year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
            
      ############################################################################################################################################
      ### https://api.census.gov/data/2019/acs/acs1/groups/B13002.html
      ## B13002_001	Estimate!!Total:
      ## B13002_002	Estimate!!Total:!!Women who had a birth in the past 12 months:
      # B13002	WOMEN 15 TO 50 YEARS WHO HAD A BIRTH IN THE PAST 12 MONTHS BY MARITAL STATUS AND AGE
      B13002_women_15_to_50_df <- get_acs(geography = "county", variables = c(B13002_fertile_women_total       = "B13002_001",
                                                                              B13002_fertile_women_given_birth = "B13002_002"),
                                   year = 2020,) %>%
        select(GEOID, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = "GEOID")
      
      ############################################################################################################################################
      
            
      ############################################################################################################################################
      
      
      # S2302_family_employment_12_months_df
      # S2303_population_work_status_12_months_df
      # S1901_income_past_12_months_df
      # S1101_household_and_families_df
      # S1401_population_school_enrollment_df
      # S1701_population_poverty_12_months_df
      # S1702_family_poverty_12_months_df
      # S1301_fertility_df
      # S1501_education_attainment_df
      # S2501_occupancy_characteristics_df
      # S2502_occupancy_characteristics_df
      # S2503_household_count_per_income_bracket_df
      # S2503_housing_cost_percentage_per_incomes_df
      # S2801_technology_access_df
      # DP04_vehicle_and_housing_characteristics_df
      # DP05_population_age_groups_df
      # B08121_median_income_per_transportation_df
      # B09001_population_under_18_df
      # B11012_households_by_type_df
      # B11016_households_by_size_df
      # B13002_women_15_to_50_df
      # # B12007_median_age_first_marriage_by_sex_df
      # # B12503_divorces_last_year_by_sex_df
      
      df_lj <- left_join(S2302_family_employment_12_months_df, S2303_population_work_status_12_months_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1901_income_past_12_months_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1101_household_and_families_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1401_population_school_enrollment_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1701_population_poverty_12_months_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1702_family_poverty_12_months_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1301_fertility_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S1501_education_attainment_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S2501_occupancy_characteristics_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S2502_occupancy_characteristics_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S2503_household_count_per_income_bracket_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S2503_housing_cost_percentage_per_incomes_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, S2801_technology_access_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, DP04_vehicle_and_housing_characteristics_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, DP05_population_age_groups_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, B08121_median_income_per_transportation_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, B09001_population_under_18_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, B11012_households_by_type_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, B11016_households_by_size_df, by = c("fips"="fips"))
      df_lj <- left_join(df_lj, B13002_women_15_to_50_df, by = c("fips"="fips"))
      # df_lj <- left_join(df_lj, B12007_median_age_first_marriage_by_sex_df, by = c("fips"="fips"))
      # df_lj <- left_join(df_lj, B12503_divorces_last_year_by_sex_df, by = c("fips"="fips"))

      # Screw it, jsut run the base code twice, reading the xcel retrieves fips as integers anyways
      # # converting char fips to int
      # # df_lj['fips'] <- strtoi(df_lj['fips'], base=10L)
      # for(i in 1:nrow(df_lj)) {
      #   df_lj[i, 'fips'] <- strtoi(df_lj[i, 'fips'], base=10L)
      # }
      
      write.csv(df_lj,".\\get_county_american_community_survey.csv", row.names = FALSE)

      return(df_lj)
    }
    else {
      df <- read.csv(".\\get_county_american_community_survey.csv", header=TRUE, stringsAsFactors=FALSE)
      return(df)
    }
}
