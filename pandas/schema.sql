CREATE TABLE FACT_OMNITURE_PAGE_VIEWS
(
      DAY_KEY INTEGER
    , CONTENT_METADATA_KEY BIGINT
    , CATEGORY_KEY INTEGER
    , SITE_KEY INTEGER
    , SEARCH_ENGINE_KEY INTEGER
    , GEOGRAPHY_KEY BIGINT
    , REFERRER_HOST_KEY INTEGER
    , STUDIO_KEY BIGINT
    , CONTENT_KEY BIGINT
    , SEARCH_PHRASE_KEY BIGINT
    , USER_AGENT_KEY BIGINT
    , PAGE_TYPE_KEY INTEGER
    , SUB_PAGE_TYPE_KEY INTEGER
    , QCD_PRIMARY_KEY BIGINT
    , VISIT_KEY BIGINT
    , EVENT_DTM TIMESTAMP
    , IP_ADDRESS CHARACTER VARYING(15)
    , IP_ADDRESS_NBR BIGINT
    , GOOGLE_RANK CHARACTER VARYING(10)
    , VISITORIZED BOOLEAN
    , VISITOR_ID CHARACTER VARYING(20)
    , VERSION_ID CHARACTER VARYING(10)
    , REFERRER NATIONAL CHARACTER VARYING(512)
    , FULL_URI NATIONAL CHARACTER VARYING(512)
    , UTM_SOURCE NATIONAL CHARACTER VARYING(25)
    , UTM_MEDIUM NATIONAL CHARACTER VARYING(20)
    , UTM_CAMPAIGN NATIONAL CHARACTER VARYING(20)
    , LTV_TAG CHARACTER VARYING(8000)
    , EDW_CREATED_DTM TIMESTAMP
    , SOURCE_FILE_TRACKING_ID INTEGER
    , ODS_OMD_WORK_INSTANCE_ID INTEGER
    , EDW_OMD_WORK_INSTANCE_ID INTEGER 
)
;

CREATE TABLE DIM_SITE
(
      SITE_KEY INTEGER PRIMARY KEY
    , SITE_ID CHARACTER VARYING(6)
    , PROPERTY_NAME CHARACTER VARYING(128)
    , PROPERTY_CODE CHARACTER VARYING(6)
    , BUSINESS_OWNER_NAME CHARACTER VARYING(50)
    , ACQUISITION_DATE TIMESTAMP
    , GENERAL_LEDGER_DIVISION_NBR INTEGER
    , OMNITURE_SITE_NAME CHARACTER VARYING(128)
    , SOURCE_SYSTEM_ID CHARACTER VARYING(50)
    , SITE_STATUS_CODE CHARACTER VARYING(50)
    , PROPERTY_TYPE CHARACTER VARYING(50)
    , EDW_CREATED_DTM TIMESTAMP
    , EDW_MODIFIED_DTM TIMESTAMP
    , SOURCE_FILE_TRACKING_ID INTEGER
    , ODS_OMD_WORK_INSTANCE_ID INTEGER
    , EDW_OMD_WORK_INSTANCE_ID INTEGER
    , GOOGLE_ANALYTICS_ID BIGINT 
)
;
