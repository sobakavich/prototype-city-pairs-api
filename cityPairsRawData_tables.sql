create table cityPairsRawData (
    DATA_FILE VARCHAR(64),
    ITEM_NUM VARCHAR(10),
    AWARD_YEAR VARCHAR(10),
    ORIGIN_AIRPORT_ABBREV VARCHAR(10),
    DESTINATION_AIRPORT_ABBREV VARCHAR(10),
    ORIGIN_CITY_NAME VARCHAR(64),
    ORIGIN_STATE varchar(64),
    ORIGIN_COUNTRY varchar(64),
    DESTINATION_CITY_NAME varchar(64),
    DESTINATION_STATE varchar(64),
    DESTINATION_COUNTRY	varchar(64),
    AIRLINE_ABBREV varchar(10),
    AWARDED_SERV varchar(10),
    PAX_COUNT varchar(10),
    YCA_FARE VARCHAR(10),
    XCA_FARE VARCHAR(10),
    BUSINESS_FARE VARCHAR(10),
    ORIGIN_AIRPORT_LOCATION VARCHAR(64),
    DESTINATION_AIRPORT_LOCATION VARCHAR(64),
    ORIGIN_CITY_STATE_AIRPORT VARCHAR(64),
    DESTINATION_CITY_STATE_AIRPORT VARCHAR(64),
    EFFECTIVE_DATE VARCHAR(10),
    EXPIRATION_DATE VARCHAR(10)
);

create table cityPairsMaster (
    ID INT(10) PRIMARY KEY AUTO_INCREMENT,
    ITEM_NUM VARCHAR(10),
    AWARD_YEAR VARCHAR(10),
    ORIGIN_AIRPORT_ABBREV VARCHAR(10),
    DESTINATION_AIRPORT_ABBREV VARCHAR(10),
    ORIGIN_CITY_NAME VARCHAR(64),
    ORIGIN_STATE varchar(64),
    ORIGIN_COUNTRY varchar(64),
    DESTINATION_CITY_NAME varchar(64),
    DESTINATION_STATE varchar(64),
    DESTINATION_COUNTRY	varchar(64),
    AIRLINE_ABBREV varchar(10),
    AWARDED_SERV varchar(10),
    PAX_COUNT varchar(10),
    YCA_FARE INT(10),
    XCA_FARE INT(10),
    BUSINESS_FARE INT(10),
    ORIGIN_AIRPORT_LOCATION VARCHAR(64),
    DESTINATION_AIRPORT_LOCATION VARCHAR(64),
    ORIGIN_CITY_STATE_AIRPORT VARCHAR(64),
    DESTINATION_CITY_STATE_AIRPORT VARCHAR(64),
    EFFECTIVE_DATE DATE,
    EXPIRATION_DATE DATE,
    KEY ix_cityMaster_orig (ORIGIN_AIRPORT_ABBREV)
);

insert into cityPairsMaster (
    ITEM_NUM,
    AWARD_YEAR,
    ORIGIN_AIRPORT_ABBREV,
    DESTINATION_AIRPORT_ABBREV,
    ORIGIN_CITY_NAME,
    ORIGIN_STATE,
    ORIGIN_COUNTRY,
    DESTINATION_CITY_NAME,
    DESTINATION_STATE,
    DESTINATION_COUNTRY,
    AIRLINE_ABBREV,
    AWARDED_SERV,
    PAX_COUNT,
    YCA_FARE,
    XCA_FARE,
    BUSINESS_FARE,
    ORIGIN_AIRPORT_LOCATION,
    DESTINATION_AIRPORT_LOCATION,
    ORIGIN_CITY_STATE_AIRPORT,
    DESTINATION_CITY_STATE_AIRPORT,
    EFFECTIVE_DATE,
    EXPIRATION_DATE
)
select 
    ITEM_NUM,
    AWARD_YEAR,
    ORIGIN_AIRPORT_ABBREV,
    DESTINATION_AIRPORT_ABBREV,
    ORIGIN_CITY_NAME,
    ORIGIN_STATE,
    ORIGIN_COUNTRY,
    DESTINATION_CITY_NAME,
    DESTINATION_STATE,
    DESTINATION_COUNTRY,
    AIRLINE_ABBREV,
    AWARDED_SERV,
    PAX_COUNT,
    CAST(YCA_FARE as INT) YCA_FARE,
    CAST(XCA_FARE as INT) XCA_FARE,
    CAST(BUSINESS_FARE as INT) BUSINESS_FARE,
    ORIGIN_AIRPORT_LOCATION,
    DESTINATION_AIRPORT_LOCATION,
    ORIGIN_CITY_STATE_AIRPORT,
    DESTINATION_CITY_STATE_AIRPORT,
    STR_TO_DATE(EFFECTIVE_DATE, '%c/%e/%Y'),
    STR_TO_DATE(EXPIRATION_DATE, '%c/%e/%Y')
from cityPairsRawData
;