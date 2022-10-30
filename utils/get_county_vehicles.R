
###############################################################################################################
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


# Load the tidycensus package into your R session
library(tidycensus)
library(tidyverse)

# Function name is 
get_county_vehicles <- function() {
  
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
  

###############################################################################################################
    ##### ACS Data I might actually use

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2602.html
    # S2602	CHARACTERISTICS OF THE GROUP QUARTERS POPULATION BY GROUP QUARTERS TYPE (3 TYPES)

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2302.html
    # S2302	EMPLOYMENT CHARACTERISTICS OF FAMILIES
    
    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2303.html
    # S2303	WORK STATUS IN THE PAST 12 MONTHS

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1902.html
    # S1902	MEAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1903.html
    # S1903	MEDIAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1901.html
    # S1901	INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1101.html
    # S1101	HOUSEHOLDS AND FAMILIES

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1401.html
    # S1401	SCHOOL ENROLLMENT

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1701.html
    # S1701	POVERTY STATUS IN THE PAST 12 MONTHS
    # S1702	POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1301.html
    # S1301	FERTILITY

    ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1501.html
    # S1501	EDUCATIONAL ATTAINMENT

    ### https://api.census.gov/data/2019/acs/acs1/subject/groups/S2501.html
    # S2501	OCCUPANCY CHARACTERISTICS
    ## NOT FOUND
    # S2502	DEMOGRAPHIC CHARACTERISTICS FOR OCCUPIED HOUSING UNITS
    ## NOT FOUND
    # S2503	FINANCIAL CHARACTERISTICS
    ## NOT FOUND
    # S2801	TYPES OF COMPUTERS AND INTERNET SUBSCRIPTIONS
    ## NOT FOUND

    # DP04	SELECTED HOUSING CHARACTERISTICS # contains vehicle information
    ## https://api.census.gov/data/2018/acs/acs5/profile/variables.html
    # DP05	ACS DEMOGRAPHIC AND HOUSING ESTIMATES
    ## https://api.census.gov/data/2018/acs/acs5/profile/variables.html

    # B01001	SEX BY AGE
    ## B01001_002	Male:
    ## B01001_026	Female:

    # B01003	TOTAL POPULATION
    ## B01003_001	Total
    
    # B08121	MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS) BY MEANS OF TRANSPORTATION TO WORK
    ## B08121_001	Total:
    ## B08121_002	Car, truck, or van - drove alone
    ## B08121_003	Car, truck, or van - carpooled
    ## B08121_004	Public transportation (excluding taxicab)
    ## B08121_005	Walked
    ## B08121_006	Taxicab, motorcycle, bicycle, or other means
    ## B08121_007	Worked from home

    # B09001	POPULATION UNDER 18 YEARS BY AGE 
    ## B09001_001	Total:
    ## additional age range specifics can be foudn

    # B11012	HOUSEHOLDS BY TYPE

    # B11016	HOUSEHOLD TYPE BY HOUSEHOLD SIZE
    
    # B12007	MEDIAN AGE AT FIRST MARRIAGE
    ## B12007_001	Male
    ## B12007_002	Female

    # B12503	DIVORCES IN THE LAST YEAR BY SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER
    ## B12503_002	Male:
    ## B12503_003	Never married
    ## B12503_004	Ever married:
    ## B12503_007	Female: 
    ## B12503_008	Never married
    ## B12503_009	Ever married:
    
    # B13002	WOMEN 15 TO 50 YEARS WHO HAD A BIRTH IN THE PAST 12 MONTHS BY MARITAL STATUS AND AGE
    ## B13002_002	Women who had a birth in the past 12 months:

    # B14001	SCHOOL ENROLLMENT BY LEVEL OF SCHOOL FOR THE POPULATION 3 YEARS AND OVER
    ## B14001_001	Total:
    ## B14001_002	Enrolled in school:

    # B15001	SEX BY AGE BY EDUCATIONAL ATTAINMENT FOR THE POPULATION 18 YEARS AND OVER
    
    # B15002	SEX BY EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER
  
  
###############################################################################################################



    if(!file.exists("get_county_vehicles.csv")){
      
      # https://api.census.gov/data/2019/acs/acs5/profile/groups/DP04.html
      
      ###############################################################################################################
      ##### ACS Data I might actually use
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2602.html
      # S2602	CHARACTERISTICS OF THE GROUP QUARTERS POPULATION BY GROUP QUARTERS TYPE (3 TYPES)
      # NOT WORKING, COUNTY VALUES NOT FOUND
      countyDf <- get_acs(geography = 'county', variables = c("S2602_C01_009"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2302.html
      # S2302	EMPLOYMENT CHARACTERISTICS OF FAMILIES
      ## S2302_C01_015E	Estimate!!Total!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      ## S2302_C02_015E	Estimate!!Percent!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      a111 <- get_acs(geography = 'county', variables = c("S2302_C01_015"), year = 2020,)
      a112 <- get_acs(geography = 'county', variables = c("S2302_C02_015"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2303.html
      # S2303	WORK STATUS IN THE PAST 12 MONTHS
      ## S2303_C01_001E	Estimate!!Total!!Population 16 to 64 years
      ## S2303_C01_008E	Estimate!!Total!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      ## S2303_C02_008E	Estimate!!Percent!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      b111 <- get_acs(geography = 'county', variables = c("S2303_C01_001"), year = 2020,)
      b112 <- get_acs(geography = 'county', variables = c("S2303_C01_008"), year = 2020,)
      b113 <- get_acs(geography = 'county', variables = c("S2303_C02_008"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1901.html
      # S1901	INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      ## S1901_C01_001E	Estimate!!Households!!Total
      ## S1901_C01_013E	Estimate!!Households!!Mean income (dollars)
      ## S1901_C02_012E	Estimate!!Families!!Median income (dollars)
      income_past_12_months_df <- get_acs(geography = 'county', variables = c(households_total         = "S1901_C01_001",
                                                                              households_mean_income   = "S1901_C01_013",
                                                                              households_median_income = "S1901_C02_012"), year = 2020,)
      
      
      
      
      
      
      
      income_past_12_months_df <- get_acs(geography = 'county', variables = c("S1901_C01_001",
                                                                              "S1901_C01_013",
                                                                              "S1901_C02_012"), year = 2020) %>% 
          select(GEOID, NAME, variable, estimate) %>% 
          spread(variable, estimate) %>% 
          rename(fips = 'GEOID',
                 households_total = 'S1901_C01_001',
                 households_mean_income = 'S1901_C01_013',
                 households_median_income = 'S1901_C02_012') %>%
          select(fips,
                 households_total,
                 households_mean_income,
                 households_median_income)
      
      
      income_past_12_months_df <- get_acs(geography = 'county', variables = c("S1901_C01_001",
                                                                              "S1901_C01_013",
                                                                              "S1901_C02_012"), year = 2020,) %>% 
        
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        # mutate(hispPr18  = hispanic/totPop18, whitePr18 = white/totPop18,
        #        afrAmPr18 = afrAm/totPop18, asianPr18 = asian/totPop18) %>%
        rename(fips, households_total, households_mean_income, households_median_income) %>%
        select(fips,
               households_total,
               households_mean_income,
               households_median_income) %>%
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18    = "B01001_001", 
                                                              hispanic    = "B03003_003", 
                                                              notHispanic = "B03003_002",
                                                              white       = "B02001_002", 
                                                              afrAm       = "B02001_003", 
                                                              asian       = "B02001_005"), 
                          year = 2018, state = 'IL', geometry = FALSE)
      
      #################################################################################
      
      countyDf <- get_acs(geography = 'county', variables = c("B01001_001", 
                                                              "B03003_003", 
                                                              "B03003_002",
                                                              "B02001_002", 
                                                              "B02001_003", 
                                                              "B02001_005"), year = 2018,) %>% 
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        select(GEOID,
               totPop18,
               hispanic,
               notHispanic,
               white,
               afrAm,
               asian)
      
      #################################################################################
      
      countyDf <- get_acs(geography = 'county', variables = c("B01001_001", 
                                                              "B03003_003", 
                                                              "B03003_002",
                                                              "B02001_002", 
                                                              "B02001_003", 
                                                              "B02001_005"), year = 2018,) %>% 
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename(fips = 'GEOID',
               totPop18 = 'B01001_001',
               hispanic = 'B03003_003',
               notHispanic = 'B03003_002',
               white = 'B02001_002',
               afrAm = 'B02001_003',
               asian = 'B02001_005') %>%
        select(fips,
               totPop18,
               hispanic,
               notHispanic,
               white,
               afrAm,
               asian)
      
      #################################################################################
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01001_001", 
                                                              hispanic ="B03003_003", 
                                                              notHispanic = "B03003_002",
                                                              white = "B02001_002", 
                                                              afrAm = "B02001_003", 
                                                              asian = "B02001_005"), 
                          year = 2018, state = 'IL', geometry = FALSE) %>% 
        
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        # mutate(hispPr18  = hispanic/totPop18, whitePr18 = white/totPop18,
        #        afrAmPr18 = afrAm/totPop18, asianPr18 = asian/totPop18) %>%
        # select(GEOID,totPop18,hispPr18,whitePr18,afrAmPr18, asianPr18)
        select(GEOID,
               totPop18,
               hispanic,
               notHispanic,
               white,
               afrAm,
               asian)
      
      
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1902.html
      # # S1902	MEAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1902_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME!!All households
      # ## S1902_C01_002E	Estimate!!Number!!HOUSEHOLD INCOME!!All households!!With earnings ## not using this due to uncertain sources
      # c111 <- get_acs(geography = 'county', variables = c("S1902_C01_001"), year = 2020,)
      # 
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1903.html
      # # S1903	MEDIAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1903_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME BY RACE AND HISPANIC OR LATINO ORIGIN OF HOUSEHOLDER!!Householdsv
      # d111 <- get_acs(geography = 'county', variables = c("S1903_C01_001"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1101.html
      # S1101	HOUSEHOLDS AND FAMILIES
      ## S1101_C01_001E	Estimate!!Total!!HOUSEHOLDS!!Total households
      ## S1101_C01_002E	Estimate!!Total!!HOUSEHOLDS!!Average household size
      ## S1101_C01_005E	Estimate!!Total!!AGE OF OWN CHILDREN!!Households with own children of the householder under 18 years
      ## S1101_C01_010E	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Households with one or more people under 18 years
      ## S1101_C01_011E	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Households with one or more people 60 years and over
      ## S1101_C01_012E	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Householder living alone
      ## S1101_C01_013E	Estimate!!Total!!Total households!!SELECTED HOUSEHOLDS BY TYPE!!Householder living alone!!65 years and over
      ## S1101_C01_016E	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!1-unit structures
      ## S1101_C01_017E	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!2-or-more-unit structures
      ## S1101_C01_018E	Estimate!!Total!!Total households!!UNITS IN STRUCTURE!!Mobile homes and all other types of units
      ## S1101_C01_019E	Estimate!!Total!!Total households!!HOUSING TENURE!!Owner-occupied housing units
      ## S1101_C01_020E	Estimate!!Total!!Total households!!HOUSING TENURE!!Renter-occupied housing units
      ## S1101_C02_001E	Estimate!!Married-couple family household!!HOUSEHOLDS!!Total households
      ### might stick with only households as ther ecan be multiple households per family if the family is big
      ## S1101_C01_003E	Estimate!!Total!!FAMILIES!!Total families
      ## S1101_C01_004E	Estimate!!Total!!FAMILIES!!Average family size
      household_and_families_df <- get_acs(geography = 'county', variables = c(
        totPop18 = "S1101_C01_001",
        totPop18 = "S1101_C01_002",
        totPop18 = "S1101_C01_005",
        totPop18 = "S1101_C01_010",
        totPop18 = "S1101_C01_011",
        totPop18 = "S1101_C01_012",
        totPop18 = "S1101_C01_013",
        totPop18 = "S1101_C01_016",
        totPop18 = "S1101_C01_017",
        totPop18 = "S1101_C01_018",
        totPop18 = "S1101_C02_001"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1401.html
      ## S1401_C01_001E	Estimate!!Total!!Population 3 years and over enrolled in school
      ## S1401_C01_002E	Estimate!!Total!!Population 3 years and over enrolled in school!!Nursery school, preschool
      ## S1401_C01_003E	Estimate!!Total!!Population 3 years and over enrolled in school!!Kindergarten to 12th grade
      ## S1401_C01_008E	Estimate!!Total!!Population 3 years and over enrolled in school!!College, undergraduate
      ## S1401_C01_009E	Estimate!!Total!!Population 3 years and over enrolled in school!!Graduate, professional school
      # S1401	SCHOOL ENROLLMENT
      g111 <- get_acs(geography = 'county', variables = c(aa = "S1101_C01_001",
                                                          bb = "S1101_C01_002",
                                                          cc = "S1101_C01_005",
                                                          dd = "S1101_C01_010",
                                                          ee = "S1101_C01_011"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1701.html
      ## S1701_C01_001E	Estimate!!Total!!Population for whom poverty status is determined
      ## S1701_C01_002E	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!Under 18 years
      ## S1701_C01_006E	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!18 to 64 years
      ## S1701_C01_010E	Estimate!!Total!!Population for whom poverty status is determined!!AGE!!65 years and over
      ## S1701_C01_011E	Estimate!!Total!!Population for whom poverty status is determined!!SEX!!Male
      ## S1701_C01_012E	Estimate!!Total!!Population for whom poverty status is determined!!SEX!!Female
      ## S1701_C01_022E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over
      ## S1701_C01_023E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Less than high school graduate
      ## S1701_C01_024E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!High school graduate (includes equivalency)
      ## S1701_C01_025E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Some college, associat's degree
      ## S1701_C01_026E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Bachelor's degree or higher
      # S1701	POVERTY STATUS IN THE PAST 12 MONTHS
      f111 <- get_acs(geography = 'county', variables = c("S1701_C01_001",
                                                          "S1701_C01_002",
                                                          "S1701_C01_006",
                                                          "S1701_C01_010",
                                                          "S1701_C01_011",
                                                          "S1701_C01_012",
                                                          "S1701_C01_022",
                                                          "S1701_C01_023",
                                                          "S1701_C01_024",
                                                          "S1701_C01_025",
                                                          "S1701_C01_026"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1702.html
      # S1702	POVERTY STATUS IN THE PAST 12 MONTHS OF FAMILIES
      ## S1702_C01_001E	Estimate!!All families!!Total!!Families
      ## S1702_C01_042E	Estimate!!All families!!Total!!Families!!TENURE!!Renter Occupied
      ## S1702_C01_041E	Estimate!!All families!!Total!!Families!!TENURE!!Owner occupied
      # details on the types of poverty
      ## S1702_C01_043E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!50 percent of poverty level
      ## S1702_C01_044E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!125 percent of poverty level
      ## S1702_C01_045E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!150 percent of poverty level
      ## S1702_C01_046E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!185 percent of poverty level
      ## S1702_C01_047E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!200 percent of poverty level
      ## S1702_C01_048E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!300 percent of poverty level
      ## S1702_C01_049E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!400 percent of poverty level
      ## S1702_C01_050E	Estimate!!All families!!Total!!Families!!ALL FAMILIES WITH INCOME BELOW THE FOLLOWING POVERTY RATIOS!!500 percent of poverty level
      ## S1702_C02_001E	Estimate!!All families!!Percent below poverty level!!Families
      # It looks like to get percentage, _C02_ should be sufficient
      f111 <- get_acs(geography = 'county', variables = c("S1701_C01_001",
                                                          "S1701_C01_002",
                                                          "S1701_C01_006",
                                                          "S1701_C01_010",
                                                          "S1701_C01_011",
                                                          "S1701_C01_012",
                                                          "S1701_C01_022",
                                                          "S1701_C01_023",
                                                          "S1701_C01_024",
                                                          "S1701_C01_025",
                                                          "S1701_C01_026"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1301.html
      ## S1301_C01_001E	Estimate!!Total!!Women 15 to 50 years
      # S1301	FERTILITY
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1501.html
      ## S1501_C01_059E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings
      ## S1501_C01_060E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Less than high school graduate
      ## S1501_C01_061E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!High school graduate (includes equivalency)
      ## S1501_C01_062E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Some college or associat's degree
      ## S1501_C01_063E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Bachelor's degree
      ## S1501_C01_064E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Graduate or professional degree
      # S1501	EDUCATIONAL ATTAINMENT
      f111 <- get_acs(geography = 'county', variables = c("S1501_C01_059",
                                                          "S1501_C01_060",
                                                          "S1501_C01_061",
                                                          "S1501_C01_062",
                                                          "S1501_C01_063",
                                                          "S1501_C01_064"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/subject/groups/S2501.html
      ## S2501_C01_001E	Estimate!!Occupied housing units!!Occupied housing units
      ## S2501_C01_032E	Estimate!!Occupied housing units!!Occupied housing units!!FAMILY TYPE AND PRESENCE OF OWN CHILDREN!!With related children of householder under 18 years
      # S2501	OCCUPANCY CHARACTERISTICS
      f111 <- get_acs(geography = 'county', variables = c("S2501_C01_001",
                                                          "S2501_C01_032"), year = 2020,)
      
      #################################################################################
      
      asdfasdf <- get_acs(geography = 'county', variables = c("S2501_C01_001", 
                                                              "S2501_C01_032"), year = 2020,)
      
      asdfasdf <- get_acs(geography = 'county', variables = c("S2501_C01_001", 
                                                                    "S2501_C01_032"), year = 2020,) %>% 
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        rename('fips' = 'GEOID',
               'totPop18' = 'S2501_C01_001',
               'hispanic' = 'S2501_C01_032') %>%
        select(fips,
               totPop18,
               hispanic)
      
      #################################################################################
      
      asdfasdf <- asdfasdf %>% 
        rename('fips' = 'GEOID',
               'totPop18' = 'S2501_C01_001',
               'hispanic' = 'S2501_C01_032')
      
      
      # S2502	DEMOGRAPHIC CHARACTERISTICS FOR OCCUPIED HOUSING UNITS
      ## S2502_C01_001E	Estimate!!Occupied housing units!!Occupied housing units
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2503.html
      ## S2503_C02_001E	Estimate!!Percent occupied housing units!!Occupied housing units
      ## S2503_C02_002E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Less than $5,000
      ## S2503_C02_003E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$5,000 to $9,999
      ## S2503_C02_004E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$10,000 to $14,999
      ## S2503_C02_005E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$15,000 to $19,999
      ## S2503_C02_006E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$20,000 to $24,999
      ## S2503_C02_007E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$25,000 to $34,999
      ## S2503_C02_008E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$35,000 to $49,999
      ## S2503_C02_009E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$50,000 to $74,999
      ## S2503_C02_010E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$75,000 to $99,999
      ## S2503_C02_011E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$100,000 to $149,999
      ## S2503_C02_012E	Estimate!!Percent occupied housing units!!Occupied housing units!!HOUSEHOLD INCOME IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!$150,000 or more
      # S2503	FINANCIAL CHARACTERISTICS
      fin1 <- get_acs(geography = 'county', variables = c("S2503_C02_001",
                                                          "S2503_C02_002",
                                                          "S2503_C02_003",
                                                          "S2503_C02_004",
                                                          "S2503_C02_005",
                                                          "S2503_C02_006",
                                                          "S2503_C02_007",
                                                          "S2503_C02_008",
                                                          "S2503_C02_009",
                                                          "S2503_C02_010",
                                                          "S2503_C02_011",
                                                          "S2503_C02_012"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2503.html
      ## S2503_C02_014E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!Less than $300
      ## S2503_C02_015E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$300 to $499
      ## S2503_C02_016E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$500 to $799
      ## S2503_C02_017E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$800 to $999
      ## S2503_C02_018E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$1,000 to $1,499
      ## S2503_C02_019E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$1,500 to $1,999
      ## S2503_C02_020E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$2,000 to $2,499
      ## S2503_C02_021E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$2,500 to $2,999
      ## S2503_C02_022E	Estimate!!Percent occupied housing units!!Occupied housing units!!MONTHLY HOUSING COSTS!!$3,000 or more
      # S2801	TYPES OF COMPUTERS AND INTERNET SUBSCRIPTIONS
      fin1 <- get_acs(geography = 'county', variables = c("S2503_C02_001",
                                                          "S2503_C02_002",
                                                          "S2503_C02_003",
                                                          "S2503_C02_004",
                                                          "S2503_C02_005",
                                                          "S2503_C02_006",
                                                          "S2503_C02_007",
                                                          "S2503_C02_008",
                                                          "S2503_C02_009",
                                                          "S2503_C02_010",
                                                          "S2503_C02_011",
                                                          "S2503_C02_012"), year = 2020,)
      
      ### https://api.census.gov/data/2018/acs/acs5/profile/variables.html
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP04.html
      ### https://data.census.gov/cedsci/table?q=DP04&y=2019
      ## DP04_0057E	Estimate!!VEHICLES AVAILABLE!!Occupied housing units
      ## DP04_0119E	Estimate!!SELECTED MONTHLY OWNER COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME (SMOCAPI)!!Housing unit without a mortgage (excluding units where SMOCAPI cannot be computed)!!10.0 to 14.9 percent
      # DP04	SELECTED HOUSING CHARACTERISTICS # contains vehicle information
      fin1 <- get_acs(geography = 'county', variables = c("DP04_0057",
                                                          "DP04_0119"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP05.html
      ### https://data.census.gov/cedsci/table?q=DP05&y=2019
      ## DP05_0007PE	Percent!!SEX AND AGE!!Total population!!10 to 14 years
      ## DP05_0006PE	Percent!!SEX AND AGE!!Total population!!5 to 9 years
      # DP05	ACS DEMOGRAPHIC AND HOUSING ESTIMATES
      fin1 <- get_acs(geography = 'county', variables = c("DP05_0007P",
                                                          "DP05_0006P"), year = 2020,)
      
      
      # B08121	MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS) BY MEANS OF TRANSPORTATION TO WORK
      ## B08121_001	Total:
      ## B08121_002	Car, truck, or van - drove alone
      ## B08121_003	Car, truck, or van - carpooled
      ## B08121_004	Public transportation (excluding taxicab)
      ## B08121_005	Walked
      ## B08121_006	Taxicab, motorcycle, bicycle, or other means
      ## B08121_007	Worked from home
      fin1 <- get_acs(geography = 'county', variables = c(a = "B08121_001",
                                                          b = "B08121_002",
                                                          c = "B08121_003",
                                                          d = "B08121_004",
                                                          e = "B08121_005",
                                                          f = "B08121_006",
                                                          g = "B08121_007"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B09001.html
      # B09001	POPULATION UNDER 18 YEARS BY AGE 
      ## B09001_002E	Estimate!!Total:!!In households:
      ## B09001_003E	Estimate!!Total:!!In households:!!Under 3 years
      ## B09001_004E	Estimate!!Total:!!In households:!!3 and 4 years
      ## B09001_005E	Estimate!!Total:!!In households:!!5 years
      ## B09001_006E	Estimate!!Total:!!In households:!!6 to 8 years
      ## B09001_007E	Estimate!!Total:!!In households:!!9 to 11 years
      ## B09001_008E	Estimate!!Total:!!In households:!!12 to 14 years
      ## B09001_009E	Estimate!!Total:!!In households:!!15 to 17 years
      ## additional age range specifics can be found
      fin1 <- get_acs(geography = 'county', variables = c("S2503_C02_001",
                                                          "S2503_C02_002",
                                                          "S2503_C02_003",
                                                          "S2503_C02_004",
                                                          "S2503_C02_005",
                                                          "S2503_C02_006",
                                                          "S2503_C02_007",
                                                          "S2503_C02_008",
                                                          "S2503_C02_009",
                                                          "S2503_C02_010",
                                                          "S2503_C02_011",
                                                          "S2503_C02_012"), year = 2020,)
      
      ### https://data.census.gov/cedsci/table?q=B11012&y=2019
      ### https://api.census.gov/data/2019/acs/acs1/groups/B11012.html
      ## B11012_001E	Estimate!!Total:
      ## B11012_003E	Estimate!!Total:!!Married-couple household:!!With own children under 18 years
      ## B11012_006E	Estimate!!Total:!!Cohabiting couple household:!!With own children of the householder under 18 years
      ## B11012_007E	Estimate!!Total:!!Cohabiting couple household:!!With no own children of the householder under 18 years
      ## B11012_003E	Estimate!!Total:!!Married-couple household:!!With own children under 18 years
      ## B11012_006E	Estimate!!Total:!!Cohabiting couple household:!!With own children of the householder under 18 years
      ## B11012_010E	Estimate!!Total:!!Female householder, no spouse or partner present:!!With own children under 18 years
      ## B11012_015E	Estimate!!Total:!!Male householder, no spouse or partner present:!!With own children under 18 years
      # B11012	HOUSEHOLDS BY TYPE
      fin1 <- get_acs(geography = 'county', variables = c("S2503_C02_001",
                                                          "S2503_C02_002",
                                                          "S2503_C02_003",
                                                          "S2503_C02_004",
                                                          "S2503_C02_005",
                                                          "S2503_C02_006",
                                                          "S2503_C02_007",
                                                          "S2503_C02_008",
                                                          "S2503_C02_009",
                                                          "S2503_C02_010",
                                                          "S2503_C02_011",
                                                          "S2503_C02_012"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B11016.html
      ## B11016_002E	Estimate!!Total:!!Family households:
      ## B11016_003E	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_004E	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_005E	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_006E	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_007E	Estimate!!Total:!!Family households:!!2-person household
      ## B11016_008E	Estimate!!Total:!!Family households:!!2-person household
      # B11016	HOUSEHOLD TYPE BY HOUSEHOLD SIZE
      fin1 <- get_acs(geography = 'county', variables = c("B11016_002",
                                                          "B11016_003",
                                                          "B11016_004",
                                                          "B11016_005",
                                                          "B11016_006",
                                                          "B11016_007",
                                                          "B11016_008"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B12007.html
      ## B12007_001E	Estimate!!Median age at first marriage --!!Male
      ## B12007_002E	Estimate!!Median age at first marriage --!!Female
      # B12007	MEDIAN AGE AT FIRST MARRIAGE
      fin1 <- get_acs(geography = 'county', variables = c("B12007_001",
                                                          "B12007_002"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B12503.html
      # B12503	DIVORCES IN THE LAST YEAR BY SEX BY MARITAL STATUS FOR THE POPULATION 15 YEARS AND OVER
      ## B12503_002E	Estimate!!Total:!!Male:
      ## B12503_003E	Estimate!!Total:!!Male:!!Never married
      ## B12503_004E	Estimate!!Total:!!Male:!!Ever married:
      ## B12503_007E	Estimate!!Total:!!Female:
      ## B12503_008E	Estimate!!Total:!!Female:!!Never married
      ## B12503_009E	Estimate!!Total:!!Female:!!Ever married:
      fin1 <- get_acs(geography = 'county', variables = c("B12503_002",
                                                          "B12503_003",
                                                          "B12503_004",
                                                          "B12503_007",
                                                          "B12503_008",
                                                          "B12503_009"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B13002.html
      ## B13002_001E	Estimate!!Total:
      # B13002	WOMEN 15 TO 50 YEARS WHO HAD A BIRTH IN THE PAST 12 MONTHS BY MARITAL STATUS AND AGE
      ## B13002_002	Women who had a birth in the past 12 months:
      ## B13002_002E	Estimate!!Total:!!Women who had a birth in the past 12 months:
      fin1 <- get_acs(geography = 'county', variables = c("B13002_001",
                                                          "B13002_002"), year = 2020,)
      
      ### https://api.census.gov/data/2019/acs/acs1/groups/B15002.html
      ## B15002_001E	Estimate!!Total:
      ## B15002_002E	Estimate!!Total:!!Male:
      ## B15002_003E	Estimate!!Total:!!Male:!!No schooling completed
      ## B15002_004E	Estimate!!Total:!!Male:!!Nursery to 4th grade
      ## B15002_005E	Estimate!!Total:!!Male:!!5th and 6th grade
      ## B15002_006E	Estimate!!Total:!!Male:!!7th and 8th grade
      ## B15002_007E	Estimate!!Total:!!Male:!!9th grade
      ## B15002_008E	Estimate!!Total:!!Male:!!10th grade
      ## B15002_009E	Estimate!!Total:!!Male:!!11th grade
      ## B15002_010E	Estimate!!Total:!!Male:!!12th grade, no diploma
      ## B15002_011E	Estimate!!Total:!!Male:!!High school graduate (includes equivalency)
      ## B15002_012E	Estimate!!Total:!!Male:!!Some college, less than 1 year
      ## B15002_013E	Estimate!!Total:!!Male:!!Some college, 1 or more years, no degree
      ## B15002_014E	Estimate!!Total:!!Male:!!Associat's degree
      ## B15002_015E	Estimate!!Total:!!Male:!!Bachelor's degree
      ## B15002_016E	Estimate!!Total:!!Male:!!Master's degree
      ## B15002_017E	Estimate!!Total:!!Male:!!Professional school degree
      ## B15002_018E	Estimate!!Total:!!Male:!!Doctorate degree
      ## B15002_019E	Estimate!!Total:!!Female:
      ## B15002_020E	Estimate!!Total:!!Female:!!No schooling completed
      ## B15002_021E	Estimate!!Total:!!Female:!!Nursery to 4th grade
      ## B15002_022E	Estimate!!Total:!!Female:!!5th and 6th grade
      ## B15002_023E	Estimate!!Total:!!Female:!!7th and 8th grade
      ## B15002_024E	Estimate!!Total:!!Female:!!9th grade
      ## B15002_025E	Estimate!!Total:!!Female:!!10th grade
      ## B15002_026E	Estimate!!Total:!!Female:!!11th grade
      ## B15002_027E	Estimate!!Total:!!Female:!!12th grade, no diploma
      ## B15002_028E	Estimate!!Total:!!Female:!!High school graduate (includes equivalency)
      ## B15002_029E	Estimate!!Total:!!Female:!!Some college, less than 1 year
      ## B15002_030E	Estimate!!Total:!!Female:!!Some college, 1 or more years, no degree
      ## B15002_031E	Estimate!!Total:!!Female:!!Associat's degree
      ## B15002_032E	Estimate!!Total:!!Female:!!Bachelor's degree
      ## B15002_033E	Estimate!!Total:!!Female:!!Master's degree
      ## B15002_034E	Estimate!!Total:!!Female:!!Professional school degree
      ## B15002_035E	Estimate!!Total:!!Female:!!Doctorate degree
      # B15002	SEX BY EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER
      education_by_gender_df <- get_acs(geography = 'county', variables = c("B15002_001",
                                                          "B15002_002",
                                                          "B15002_003",
                                                          "B15002_004",
                                                          "B15002_005",
                                                          "B15002_006",
                                                          "B15002_007",
                                                          "B15002_008",
                                                          "B15002_009",
                                                          "B15002_010",
                                                          "B15002_011",
                                                          "B15002_012",
                                                          "B15002_013",
                                                          "B15002_014",
                                                          "B15002_015",
                                                          "B15002_016",
                                                          "B15002_017",
                                                          "B15002_018",
                                                          "B15002_019",
                                                          "B15002_020",
                                                          "B15002_021",
                                                          "B15002_022",
                                                          "B15002_023",
                                                          "B15002_024",
                                                          "B15002_025",
                                                          "B15002_026",
                                                          "B15002_027",
                                                          "B15002_028",
                                                          "B15002_029",
                                                          "B15002_030",
                                                          "B15002_031",
                                                          "B15002_032",
                                                          "B15002_033",
                                                          "B15002_034",
                                                          "B15002_035"), year = 2020,)
      
      ###############################################################################################################
      
      
      
      countyDf <- get_acs(geography = 'county', variables = c("S2602_C01_006"), year = 2020,)

      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04_0057"), year = 2020,)
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01003_001"), year = 2020,)
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04_0057"))
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop1238 = "B01001_001", 
                                                              hispanic ="B03003_003", 
                                                              notHispanic = "B03003_002",
                                                              totPop18 = "DP04_0057"))
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01001_001", 
                                                              hispanic ="B03003_003", 
                                                              notHispanic = "B03003_002",
                                                              white = "B02001_002", 
                                                              afrAm = "B02001_003", 
                                                              asian = "B02001_005"), 
                          year = 2018, state = 'IL', geometry = FALSE) %>% 
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        mutate(hispPr18  = hispanic/totPop18, whitePr18 = white/totPop18,
               afrAmPr18 = afrAm/totPop18, asianPr18 = asian/totPop18) %>%
        select(GEOID,totPop18,hispPr18,whitePr18,afrAmPr18, asianPr18)
      
      head(countyDf)
      
      
      
      
      
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04"))
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP040_001"), 
                          year = 2018, state = 'IL', geometry = FALSE) %>% 
        select(GEOID, NAME, variable, estimate) %>% 
        spread(variable, estimate) %>% 
        mutate(hispPr18  = hispanic/totPop18, whitePr18 = white/totPop18,
               afrAmPr18 = afrAm/totPop18, asianPr18 = asian/totPop18) %>%
        select(GEOID,totPop18,hispPr18,whitePr18,afrAmPr18, asianPr18)
      
      
      

        df = get_acs(geography = "county", variables = "DP04", year = 2020)
        
        # cropping dataframe
        df <- df[,c("GEOID", "NAM", "valu")]
        colnames(df)  <- c("fips", "countynam", "population")
        
        write.csv(df,".\\get_county_vehicles.csv", row.names = FALSE)

        return(df)
    }
    else {
        df <- read.csv(".\\get_county_vehicles.csv", header=TRUE, stringsAsFactors=FALSE)
        return(df)
    }
}
