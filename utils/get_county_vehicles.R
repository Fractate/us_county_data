
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
      countyDf <- get_acs(geography = 'county', variables = c("S2602_C01_009E"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2302.html
      # S2302	EMPLOYMENT CHARACTERISTICS OF FAMILIES
      ## S2302_C01_015E	Estimate!!Total!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      ## S2302_C02_015E	Estimate!!Percent!!WORK STATUS CHARACTERISTICS!!Families!!No workers in the past 12 months
      a111 <- get_acs(geography = 'county', variables = c("S2302_C01_015E"), year = 2020,)
      a112 <- get_acs(geography = 'county', variables = c("S2302_C02_015E"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S2303.html
      # S2303	WORK STATUS IN THE PAST 12 MONTHS
      ## S2303_C01_001E	Estimate!!Total!!Population 16 to 64 years
      ## S2303_C01_008E	Estimate!!Total!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      ## S2303_C02_008E	Estimate!!Percent!!Population 16 to 64 years!!WEEKS WORKED!!Did not work
      b111 <- get_acs(geography = 'county', variables = c("S2303_C01_001E"), year = 2020,)
      b112 <- get_acs(geography = 'county', variables = c("S2303_C01_008E"), year = 2020,)
      b113 <- get_acs(geography = 'county', variables = c("S2303_C02_008E"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1901.html
      # S1901	INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      ## S1901_C01_001E	Estimate!!Households!!Total
      ## S1901_C01_013E	Estimate!!Households!!Mean income (dollars)
      ## S1901_C02_012E	Estimate!!Families!!Median income (dollars)
      e111 <- get_acs(geography = 'county', variables = c("S1901_C01_001E", "S1901_C01_013E", "S1901_C02_012E"), year = 2020,)
      
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1902.html
      # # S1902	MEAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1902_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME!!All households
      # ## S1902_C01_002E	Estimate!!Number!!HOUSEHOLD INCOME!!All households!!With earnings ## not using this due to uncertain sources
      # c111 <- get_acs(geography = 'county', variables = c("S1902_C01_001E"), year = 2020,)
      # 
      # ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1903.html
      # # S1903	MEDIAN INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS)
      # ## S1903_C01_001E	Estimate!!Number!!HOUSEHOLD INCOME BY RACE AND HISPANIC OR LATINO ORIGIN OF HOUSEHOLDER!!Householdsv
      # d111 <- get_acs(geography = 'county', variables = c("S1903_C01_001E"), year = 2020,)
      
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
      f111 <- get_acs(geography = 'county', variables = c("S1101_C01_001E",
                                                          "S1101_C01_002E",
                                                          "S1101_C01_005E",
                                                          "S1101_C01_010E",
                                                          "S1101_C01_011E",
                                                          "S1101_C01_012E",
                                                          "S1101_C01_013E",
                                                          "S1101_C01_016E",
                                                          "S1101_C01_017E",
                                                          "S1101_C01_018E",
                                                          "S1101_C02_001E"), year = 2020,)
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1401.html
      ## S1401_C01_001E	Estimate!!Total!!Population 3 years and over enrolled in school
      ## S1401_C01_002E	Estimate!!Total!!Population 3 years and over enrolled in school!!Nursery school, preschool
      ## S1401_C01_003E	Estimate!!Total!!Population 3 years and over enrolled in school!!Kindergarten to 12th grade
      ## S1401_C01_008E	Estimate!!Total!!Population 3 years and over enrolled in school!!College, undergraduate
      ## S1401_C01_009E	Estimate!!Total!!Population 3 years and over enrolled in school!!Graduate, professional school
      # S1401	SCHOOL ENROLLMENT
      g111 <- get_acs(geography = 'county', variables = c("S1101_C01_001E",
                                                          "S1101_C01_002E",
                                                          "S1101_C01_005E",
                                                          "S1101_C01_010E",
                                                          "S1101_C01_011E"), year = 2020,)
      
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
      ## S1701_C01_025E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Some college, associate's degree
      ## S1701_C01_026E	Estimate!!Total!!Population for whom poverty status is determined!!EDUCATIONAL ATTAINMENT!!Population 25 years and over!!Bachelor's degree or higher
      # S1701	POVERTY STATUS IN THE PAST 12 MONTHS
      
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
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1301.html
      ## S1301_C01_001E	Estimate!!Total!!Women 15 to 50 years
      # S1301	FERTILITY
      
      ### https://api.census.gov/data/2017/acs/acs5/subject/groups/S1501.html
      ## S1501_C01_059E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings
      ## S1501_C01_060E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Less than high school graduate
      ## S1501_C01_061E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!High school graduate (includes equivalency)
      ## S1501_C01_062E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Some college or associate's degree
      ## S1501_C01_063E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Bachelor's degree
      ## S1501_C01_064E	Estimate!!Total!!MEDIAN EARNINGS IN THE PAST 12 MONTHS (IN 2017 INFLATION-ADJUSTED DOLLARS)!!Population 25 years and over with earnings!!Graduate or professional degree
      # S1501	EDUCATIONAL ATTAINMENT
      
      ### https://api.census.gov/data/2019/acs/acs1/subject/groups/S2501.html
      ## S2501_C01_001E	Estimate!!Occupied housing units!!Occupied housing units
      ## S2501_C01_032E	Estimate!!Occupied housing units!!Occupied housing units!!FAMILY TYPE AND PRESENCE OF OWN CHILDREN!!With related children of householder under 18 years
      # S2501	OCCUPANCY CHARACTERISTICS
      
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
      fin1 <- get_acs(geography = 'county', variables = c("S2503_C02_001E",
                                                          "S2503_C02_002E",
                                                          "S2503_C02_003E",
                                                          "S2503_C02_004E",
                                                          "S2503_C02_005E",
                                                          "S2503_C02_006E",
                                                          "S2503_C02_007E",
                                                          "S2503_C02_008E",
                                                          "S2503_C02_009E",
                                                          "S2503_C02_010E",
                                                          "S2503_C02_011E",
                                                          "S2503_C02_012E"), year = 2020,)
      
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
      
      ### https://api.census.gov/data/2018/acs/acs5/profile/variables.html
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP04.html
      ### https://data.census.gov/cedsci/table?q=DP04&y=2019
      ## DP04_0057E	Estimate!!VEHICLES AVAILABLE!!Occupied housing units
      ## DP04_0119E	Estimate!!SELECTED MONTHLY OWNER COSTS AS A PERCENTAGE OF HOUSEHOLD INCOME (SMOCAPI)!!Housing unit without a mortgage (excluding units where SMOCAPI cannot be computed)!!10.0 to 14.9 percent
      # DP04	SELECTED HOUSING CHARACTERISTICS # contains vehicle information
      
      ### https://api.census.gov/data/2019/acs/acs5/profile/groups/DP05.html
      ### https://data.census.gov/cedsci/table?q=DP05&y=2019
      ## DP05_0007PE	Percent!!SEX AND AGE!!Total population!!10 to 14 years
      ## DP05_0006PE	Percent!!SEX AND AGE!!Total population!!5 to 9 years
      # DP05	ACS DEMOGRAPHIC AND HOUSING ESTIMATES
      fin1 <- get_acs(geography = 'county', variables = c("DP05_0007PE",
                                                          "DP05_0006PE"), year = 2020,)
      
      
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
      
      
      
      countyDf <- get_acs(geography = 'county', variables = c("S2602_C01_006E"), year = 2020,)

      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04_0057E"), year = 2020,)
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01003_001"), year = 2020,)
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04_0057E"))
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop1238 = "B01001_001", 
                                                              hispanic ="B03003_003", 
                                                              notHispanic = "B03003_002",
                                                              totPop18 = "DP04_0057E"))
      
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
        df <- df[,c("GEOID", "NAME", "value")]
        colnames(df)  <- c("fips", "countyname", "population")
        
        write.csv(df,".\\get_county_vehicles.csv", row.names = FALSE)

        return(df)
    }
    else {
        df <- read.csv(".\\get_county_vehicles.csv", header=TRUE, stringsAsFactors=FALSE)
        return(df)
    }
}
