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
    # S0801	COMMUTING CHARACTERISTICS BY SEX
    # S2402	OCCUPATION BY SEX FOR THE FULL-TIME, YEAR-ROUND CIVILIAN EMPLOYED POPULATION 16 YEARS AND OVER  
    # B07001	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY AGE FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B07009	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY EDUCATIONAL ATTAINMENT FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B07010	GEOGRAPHICAL MOBILITY IN THE PAST YEAR BY INDIVIDUAL INCOME IN THE PAST 12 MONTHS (IN 2020 INFLATION-ADJUSTED DOLLARS) FOR CURRENT RESIDENCE IN THE UNITED STATES
    # B11001	HOUSEHOLD TYPE (INCLUDING LIVING ALONE)
    # B11011	HOUSEHOLD TYPE BY UNITS IN STRUCTURE

    # B08133	AGGREGATE TRAVEL TIME TO WORK (IN MINUTES) OF WORKERS BY TIME OF DEPARTURE TO GO TO WORK
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
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "DP04_0057E"),
                          year = 2020,)
      
      countyDf <- get_acs(geography = 'county', variables = c(totPop18 = "B01003_001"),
                          year = 2020,)
      
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
