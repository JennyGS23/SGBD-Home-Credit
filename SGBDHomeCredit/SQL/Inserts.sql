--6.	Deben construirse funciones para insertar los datos. 5 pts
USE ProyectoBases;
GO

--Insert de la tabla application_train.APPLICATION_TRAIN
CREATE PROCEDURE InsertApplicationTrain
(
    @SK_ID_CURR INT,
    @TARGET BIT,
    @NAME_CONTRACT_TYPE NVARCHAR(50),
    @DAYS_REGISTRATION INT, 
    @DAYS_PUBLISH INT, 
    @WEEKDAY_APPR_PROCESS_START NVARCHAR(50),
    @HOUR_APPR_PROCESS_START	INT,
    @AMT_INCOME_TOTAL FLOAT,
    @AMT_CREDIT FLOAT,
    @AMT_ANNUITY	FLOAT,
    @AMT_GOODS_PRICE	FLOAT,
    @ID_CURTOMER_APPLICATION	INT,
    @ID_REQUEST_APLICATIONS INT,
    @ID_BUILD_CUSTOMER_AVG INT,
    @ID_BUILD_CUSTOMER_MODE INT,
    @ID_BUILD_CUSTOMER_MEDI INT,
    @ID_EXT_SOURCE INT,
    @ID_DOCUMENT_APLICATION INT
)
AS
BEGIN
    INSERT INTO application_train.APPLICATION_TRAIN
    (
        SK_ID_CURR,
        TARGET,
        NAME_CONTRACT_TYPE,
		DAYS_REGISTRATION,
		DAYS_PUBLISH,
		WEEKDAY_APPR_PROCESS_START,
        HOUR_APPR_PROCESS_START,
        AMT_INCOME_TOTAL,
        AMT_CREDIT,
        AMT_ANNUITY,
        AMT_GOODS_PRICE,
		ID_CURTOMER_APPLICATION,
		ID_REQUEST_APLICATIONS, 
		ID_BUILD_CUSTOMER_AVG, 
		ID_BUILD_CUSTOMER_MODE, 
		ID_BUILD_CUSTOMER_MEDI, 
		ID_EXT_SOURCE, 
		ID_DOCUMENT_APLICATION 
    )
    VALUES
    (
        @SK_ID_CURR,
        @TARGET,
        @NAME_CONTRACT_TYPE,
		@DAYS_REGISTRATION,
		@DAYS_PUBLISH,
		@WEEKDAY_APPR_PROCESS_START,
        @HOUR_APPR_PROCESS_START,
        @AMT_INCOME_TOTAL,
        @AMT_CREDIT,
        @AMT_ANNUITY,
        @AMT_GOODS_PRICE,
		@ID_CURTOMER_APPLICATION,
		@ID_REQUEST_APLICATIONS, 
		@ID_BUILD_CUSTOMER_AVG, 
		@ID_BUILD_CUSTOMER_MODE, 
		@ID_BUILD_CUSTOMER_MEDI, 
		@ID_EXT_SOURCE, 
		@ID_DOCUMENT_APLICATION 
    )
END;

EXEC InsertApplicationTrain 100000000, 1,'Loan',50000,200000,'Monday',15000,180000.0,100.0,30.0,9.0,10000000,123,4,5,6,70,999;
EXEC InsertApplicationTrain 100000001, 1,'Loan',50000,200000,'Monday',15000,180000.0,100.0,30.0,9.0,10000001,123,4,5,6,70,999;
GO

--Insert de la tabla application_train.CUSTOMER_APPLICATION_TRAIN
CREATE PROCEDURE InsertCustomerApplication
(
    @ID INT,
    @CODE_GENDER char(1),
    @CNT_CHILDREN TINYINT,
    @NAME_TYPE_SUITE NVARCHAR(50),
    @NAME_INCOME_TYPE NVARCHAR(50),
    @NAME_EDUCATION_TYPE NVARCHAR(50),
    @NAME_FAMILY_STATUS NVARCHAR(50),
    @NAME_HOUSING_TYPE NVARCHAR(50),
    @DAYS_BIRTH	INT,
    @DAYS_EMPLOYED INT,
    @OCCUPATION_TYPE NVARCHAR(50),
    @CNT_FAM_MEMBERS INT,
    @ORGANIZATION_TYPE NVARCHAR(50),
    @ID_PERSONAL_CONTACT INT,
    @ID_PERSONAL_PROPERTIES INT,
    @ID_REGION_QUALIFICATION_CUSTOMERS INT,
    @ID_CUSTUMER_CUSTOMER INT
)
AS
BEGIN
    INSERT INTO application_train.CUSTOMER_APPLICATION_TRAIN
    (
        ID,
		CODE_GENDER,
		CNT_CHILDREN,
		NAME_TYPE_SUITE,
		NAME_INCOME_TYPE,
		NAME_EDUCATION_TYPE,
		NAME_FAMILY_STATUS,
		NAME_HOUSING_TYPE,
		DAYS_BIRTH,
		DAYS_EMPLOYED,
		OCCUPATION_TYPE,
		CNT_FAM_MEMBERS,
		ORGANIZATION_TYPE,
		ID_PERSONAL_CONTACT,
		ID_PERSONAL_PROPERTIES,
		ID_REGION_QUALIFICATION_CUSTOMERS,
		ID_CUSTUMER_CUSTOMER
    )
    VALUES
    (
        @ID,
		@CODE_GENDER,
		@CNT_CHILDREN,
		@NAME_TYPE_SUITE,
		@NAME_INCOME_TYPE,
		@NAME_EDUCATION_TYPE,
		@NAME_FAMILY_STATUS,
		@NAME_HOUSING_TYPE,
		@DAYS_BIRTH,
		@DAYS_EMPLOYED,
		@OCCUPATION_TYPE,
		@CNT_FAM_MEMBERS,
		@ORGANIZATION_TYPE,
		@ID_PERSONAL_CONTACT,
		@ID_PERSONAL_PROPERTIES,
		@ID_REGION_QUALIFICATION_CUSTOMERS,
		@ID_CUSTUMER_CUSTOMER
    )
END;

EXEC InsertCustomerApplication 10000000,'F',2,'Family','Salary','Doctorate','Single','House',-10000,5000,'Engineer',5.3,'Public',100000,100000,100000,100000;
EXEC InsertCustomerApplication 10000001,'F',2,'Family','Salary','Doctorate','Single','House',-10000,5000,'Engineer',5.3,'Public',100001,100001,100001,100001;


-- Insert de la tabla application_train.PROPERTIES_CUSTOMERS_APPLICATION_TRAIN
CREATE PROCEDURE InsertPropertiesCustomersApplication
(
    @ID INT,
    @FLAG_OWN_CAR CHAR(1),
    @FLAG_OWN_REALTY CHAR(1),
    @OWN_CAR_AGE INT
)
AS
BEGIN
    INSERT INTO application_train.PROPERTIES_CUSTOMERS_APPLICATION_TRAIN
    (
        ID,
        FLAG_OWN_CAR,
        FLAG_OWN_REALTY,
        OWN_CAR_AGE
    )
    VALUES
    (
        @ID,
        @FLAG_OWN_CAR,
        @FLAG_OWN_REALTY,
        @OWN_CAR_AGE
    )
END;
EXEC InsertPropertiesCustomersApplication 10000000,'Y','N',25.0;
EXEC InsertPropertiesCustomersApplication 10000001,'Y','N',25.0;

GO
--InserT de la tabla application_train.CONTACT_CUSTOMER_APPLICATION_TRAIN
CREATE PROCEDURE InsertContactCustomer
(
    
    @ID INT,
    @FLAG_MOBIL BIT,
    @FlAG_EMP_PHONE BIT,
    @FLAG_CONT_MOBILE BIT,
    @FLAG_PHONE BIT,
    @FLAG_EMAIL BIT,
    @DAYS_LAST_PHONE_CHANGE INT
    
)
AS
BEGIN
    INSERT INTO application_train.CONTACT_CUSTOMER_APPLICATION_TRAIN
    (
        ID,
        FLAG_MOBIL,
        FLAG_EMP_PHONE,
        FLAG_CONT_MOBILE,
        FLAG_PHONE,
        FLAG_EMAIL,
        DAYS_LAST_PHONE_CHANGE
    )
    VALUES
    (
        @ID,
        @FLAG_MOBIL,
        @FLAG_EMP_PHONE,
        @FLAG_CONT_MOBILE,
        @FLAG_PHONE,
        @FLAG_EMAIL,
        @DAYS_LAST_PHONE_CHANGE
    )
END;

EXEC InsertContactCustomer 10000000, 1, 0, 1, 1, 1, -1125.0;
EXEC InsertContactCustomer 10000001, 1, 0, 1, 1, 1, -1125.0;
GO

--Insert de la tabla application_train.AMT_REQUEST_APPLICATION_TRAIN
CREATE PROCEDURE InsertRequestsApplication
(
    @ID INT,
    @AMT_REQ_CREDIT_BUREAU_HOUR FLOAT,
    @AMT_REQ_CREDIT_BUREAU_DAY FLOAT,
    @AMT_REQ_CREDIT_BUREAU_WEEK FLOAT,
    @AMT_REQ_CREDIT_BUREAU_MON FLOAT,
    @AMT_REQ_CREDIT_BUREAU_QRT FLOAT,
    @AMT_REQ_CREDIT_BUREAU_YEAR FLOAT
)
AS
BEGIN
    INSERT INTO application_train.AMT_REQUEST_APPLICATION_TRAIN
    (
        ID,
        AMT_REQ_CREDIT_BUREAU_HOUR,
        AMT_REQ_CREDIT_BUREAU_DAY,
        AMT_REQ_CREDIT_BUREAU_WEEK,
        AMT_REQ_CREDIT_BUREAU_MON,
        AMT_REQ_CREDIT_BUREAU_QRT,
        AMT_REQ_CREDIT_BUREAU_YEAR
    )
    VALUES
    (
        @ID,
        @AMT_REQ_CREDIT_BUREAU_HOUR,
        @AMT_REQ_CREDIT_BUREAU_DAY,
        @AMT_REQ_CREDIT_BUREAU_WEEK,
        @AMT_REQ_CREDIT_BUREAU_MON,
        @AMT_REQ_CREDIT_BUREAU_QRT,
        @AMT_REQ_CREDIT_BUREAU_YEAR
    )
END;

EXEC InsertRequestsApplication 10000000,0.5,1.0,1.5,2.0,2.5,3.0;
EXEC InsertRequestsApplication 10000001,0.5,1.0,1.5,2.0,2.5,3.0;

--Insert de la tabla application_train.REGION_QUALIFICATION_APPLICATION_TRAIN
GO
CREATE PROCEDURE InsertRegionQualification
(
    @ID INT,
	@REGION_POPULATION_RELATIVE FLOAT,
	@REGION_RATING_CLIENT INT,
    @REGION_RATING_CLIENT_W_CITY INT,
    @REG_REGION_NOT_LIVE_REGION INT,
    @REG_REGION_NOT_WORK_REGION INT,
    @LIVE_REGION_NOT_WORK_REGION INT,
    @REG_CITY_NOT_LIVE_CITY INT,
    @REG_CITY_NOT_WORK_CITY INT,
    @LIVE_CITY_NOT_WORK_CITY INT
    
    
)
AS
BEGIN
    INSERT INTO application_train.REGION_QUALIFICATION_APPLICATION_TRAIN
    (
        ID,
		REGION_POPULATION_RELATIVE,
        REGION_RATING_CLIENT,
        REGION_RATING_CLIENT_W_CITY,
        REG_REGION_NOT_LIVE_REGION,
        REG_REGION_NOT_WORK_REGION,
        LIVE_REGION_NOT_WORK_REGION,
        REG_CITY_NOT_LIVE_CITY,
        REG_CITY_NOT_WORK_CITY,
        LIVE_CITY_NOT_WORK_CITY
        
    )
    VALUES
    (
        @ID,
		@REGION_POPULATION_RELATIVE,
        @REGION_RATING_CLIENT,
        @REGION_RATING_CLIENT_W_CITY,
        @REG_REGION_NOT_LIVE_REGION,
        @REG_REGION_NOT_WORK_REGION,
        @LIVE_REGION_NOT_WORK_REGION,
        @REG_CITY_NOT_LIVE_CITY,
        @REG_CITY_NOT_WORK_CITY,
        @LIVE_CITY_NOT_WORK_CITY
        
    )
END;

EXEC InsertRegionQualification 10000000,0.2,2,2,5,7,8,3,2,3;
EXEC InsertRegionQualification 10000001,0.2,2,2,5,7,8,3,2,3;
GO
-- Insert de la tabla application_train.BUILD_COSTUMER_AVG_APPLICATION_TRAIN
CREATE PROCEDURE InsertBuildCustomerAvgApplication
(
    @ID INT,
    @APARTMENTS_AVG FLOAT,
    @BASEMENTAREA_AVG FLOAT,
    @YEARS_BEGINEXPLUATATION_AVG FLOAT,
    @YEARS_BUILD_AVG FLOAT,
    @COMMONAREA_AVG FLOAT,
    @ELEVATORS_AVG FLOAT,
    @ENTRANCES_AVG FLOAT,
    @FLOORSMAX_AVG FLOAT,
    @FLOORSMIN_AVG FLOAT,
    @LANDAREA_AVG FLOAT,
    @LIVINGAPARTMENTS_AVG FLOAT,
    @LIVINGAREA_AVG FLOAT,
    @NONLIVINGAPARTMENTS_AVG FLOAT,
    @NONLIVINGAREA_AVG FLOAT
)
AS
BEGIN
    INSERT INTO application_train.BUILD_COSTUMER_AVG_APPLICATION_TRAIN
    (
        ID,
        APARTMENTS_AVG,
        BASEMENTAREA_AVG,
        YEARS_BEGINEXPLUATATION_AVG,
        YEARS_BUILD_AVG,
        COMMONAREA_AVG,
        ELEVATORS_AVG,
        ENTRANCES_AVG,
        FLOORSMAX_AVG,
        FLOORSMIN_AVG,
        LANDAREA_AVG,
        LIVINGAPARTMENTS_AVG,
        LIVINGAREA_AVG,
        NONLIVINGAPARTMENTS_AVG,
        NONLIVINGAREA_AVG
    )
    VALUES
    (
        @ID,
        @APARTMENTS_AVG,
        @BASEMENTAREA_AVG,
        @YEARS_BEGINEXPLUATATION_AVG,
        @YEARS_BUILD_AVG,
        @COMMONAREA_AVG,
        @ELEVATORS_AVG,
        @ENTRANCES_AVG,
        @FLOORSMAX_AVG,
        @FLOORSMIN_AVG,
        @LANDAREA_AVG,
        @LIVINGAPARTMENTS_AVG,
        @LIVINGAREA_AVG,
        @NONLIVINGAPARTMENTS_AVG,
        @NONLIVINGAREA_AVG
    )
END;

EXEC InsertBuildCustomerAvgApplication 10000000,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6;
EXEC InsertBuildCustomerAvgApplication 10000001,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6;
GO

-- Insert de la tabla application_trainBUILD_COSTUMER_MODE_APPLICATION_TRAIN
CREATE PROCEDURE InsertBuildCustomerModeApplication
(
    @ID INT,
    @APARTMENTS_MODE FLOAT,
    @BASEMENTAREA_MODE FLOAT,
    @YEARS_BEGINEXPLUATATION_MODE FLOAT,
    @YEARS_BUILD_MODE FLOAT,
    @COMMONAREA_MODE FLOAT,
    @ELEVATORS_MODE FLOAT,
    @ENTRANCES_MODE FLOAT,
    @FLOORSMAX_MODE FLOAT,
    @FLOORSMIN_MODE FLOAT,
    @LANDAREA_MODE FLOAT,
    @LIVINGAPARTMENTS_MODE FLOAT,
    @LIVINGAREA_MODE FLOAT,
    @NONLIVINGAPARTMENTS_MODE FLOAT,
    @NONLIVINGAREA_MODE FLOAT,
    @FONDKAPREMONT_MODE NVARCHAR(50),
    @HOUSETYPE_MODE NVARCHAR(50),
    @TOTALAREA_MODE FLOAT,   
    @WALLSMATERIAL_MODE NVARCHAR(50),
    @EMERGENCYSTATE_MODE NVARCHAR(50)
)
AS
BEGIN
    INSERT INTO application_train.BUILD_COSTUMER_MODE_APPLICATION_TRAIN
    (
        ID,
        APARTMENTS_MODE,
        BASEMENTAREA_MODE,
        YEARS_BEGINEXPLUATATION_MODE,
        YEARS_BUILD_MODE,
        COMMONAREA_MODE,
        ELEVATORS_MODE,
        ENTRANCES_MODE,
        FLOORSMAX_MODE,
        FLOORSMIN_MODE,
        LANDAREA_MODE,
        LIVINGAPARTMENTS_MODE,
        LIVINGAREA_MODE,
        NONLIVINGAPARTMENTS_MODE,
        NONLIVINGAREA_MODE,
        FONDKAPREMONT_MODE,
        HOUSETYPE_MODE,
        TOTALAREA_MODE,
        WALLSMATERIAL_MODE,
        EMERGENCYSTATE_MODE
    )
    VALUES
    (
        @ID,
        @APARTMENTS_MODE,
        @BASEMENTAREA_MODE,
        @YEARS_BEGINEXPLUATATION_MODE,
        @YEARS_BUILD_MODE,
        @COMMONAREA_MODE,
        @ELEVATORS_MODE,
        @ENTRANCES_MODE,
        @FLOORSMAX_MODE,
        @FLOORSMIN_MODE,
        @LANDAREA_MODE,
        @LIVINGAPARTMENTS_MODE,
        @LIVINGAREA_MODE,
        @NONLIVINGAPARTMENTS_MODE,
        @NONLIVINGAREA_MODE,
        @FONDKAPREMONT_MODE,
        @HOUSETYPE_MODE,
        @TOTALAREA_MODE,
        @WALLSMATERIAL_MODE,
        @EMERGENCYSTATE_MODE
    )
END;

EXEC InsertBuildCustomerModeApplication 10000000,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6,0.2,0.5,0.1,0.6,0.2;
EXEC InsertBuildCustomerModeApplication 10000001,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6,0.2,0.5,0.1,0.6,0.2;
GO

-- Insert de la tabla application_train.BUILD_COSTUMER_MEDI_APPLICATION_TRAIN
CREATE PROCEDURE InsertBuildCustomerMediApplication
(
    @ID INT,
    @APARTMENTS_MEDI FLOAT,
    @BASEMENTAREA_MEDI FLOAT,
    @YEARS_BEGINEXPLUATATION_MEDI FLOAT,
    @YEARS_BUILD_MEDI FLOAT,
    @COMMONAREA_MEDI FLOAT,
    @ELEVATORS_MEDI FLOAT,
    @ENTRANCES_MEDI FLOAT,
    @FLOORSMAX_MEDI FLOAT,
    @FLOORSMIN_MEDI FLOAT,
    @LANDAREA_MEDI FLOAT,
    @LIVINGAPARTMENTS_MEDI FLOAT,
    @LIVINGAREA_MEDI FLOAT,
    @NONLIVINGAPARTMENTS_MEDI FLOAT,
    @NONLIVINGAREA_MEDI FLOAT
)
AS
BEGIN
    INSERT INTO application_train.BUILD_COSTUMER_MEDI_APPLICATION_TRAIN
    (
        ID,
        APARTMENTS_MEDI,
        BASEMENTAREA_MEDI,
        YEARS_BEGINEXPLUATATION_MEDI,
        YEARS_BUILD_MEDI,
        COMMONAREA_MEDI,
        ELEVATORS_MEDI,
        ENTRANCES_MEDI,
        FLOORSMAX_MEDI,
        FLOORSMIN_MEDI,
        LANDAREA_MEDI,
        LIVINGAPARTMENTS_MEDI,
        LIVINGAREA_MEDI,
        NONLIVINGAPARTMENTS_MEDI,
        NONLIVINGAREA_MEDI
    )
    VALUES
    (
        @ID,
        @APARTMENTS_MEDI,
        @BASEMENTAREA_MEDI,
        @YEARS_BEGINEXPLUATATION_MEDI,
        @YEARS_BUILD_MEDI,
        @COMMONAREA_MEDI,
        @ELEVATORS_MEDI,
        @ENTRANCES_MEDI,
        @FLOORSMAX_MEDI,
        @FLOORSMIN_MEDI,
        @LANDAREA_MEDI,
        @LIVINGAPARTMENTS_MEDI,
        @LIVINGAREA_MEDI,
        @NONLIVINGAPARTMENTS_MEDI,
        @NONLIVINGAREA_MEDI
    )
END;

EXEC InsertBuildCustomerMediApplication 10000000,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6;
EXEC InsertBuildCustomerMediApplication 10000001,0.2,0.5,0.7,0.2,0.5,0.6,0.5,0.8,0.1,0.3,0.4,0.2,0.1,0.6;
GO

--Insert de la tabla application_train.CUSTUMER_CUSTOMER_APPLICATION_TRAIN
CREATE PROCEDURE InsertCustumerCustomer
(
    @ID INT,
    @OBS_30_CNT_SOCIAL_CIRCLE FLOAT,
    @DEF_30_CNT_SOCIAL_CIRCLE FLOAT,
    @OBS_60_CNT_SOCIAL_CIRCLE FLOAT,
    @DEF_60_CNT_SOCIAL_CIRCLE FLOAT
)
AS
BEGIN
    INSERT INTO application_train.CUSTUMER_CUSTOMER_APPLICATION_TRAIN
    (
        ID,
        OBS_30_CNT_SOCIAL_CIRCLE,
        DEF_30_CNT_SOCIAL_CIRCLE,
        OBS_60_CNT_SOCIAL_CIRCLE,
        DEF_60_CNT_SOCIAL_CIRCLE
    )
    VALUES
    (
        @ID,
        @OBS_30_CNT_SOCIAL_CIRCLE,
        @DEF_30_CNT_SOCIAL_CIRCLE,
        @OBS_60_CNT_SOCIAL_CIRCLE,
        @DEF_60_CNT_SOCIAL_CIRCLE
    )
END;

EXEC InsertCustumerCustomer 10000000, 2.0, 3.5, 1.0, 6.0;
EXEC InsertCustumerCustomer 10000001, 2.0, 3.5, 1.0, 6.0;
GO

--Insert de la tabla applicaction_train.DOCUMENT_APLICATION_TRAIN
CREATE PROCEDURE InsertDocumentApplication
(
    @ID INT,
    @FLAG_DOCUMENT_2 INT,
    @FLAG_DOCUMENT_3 INT,
    @FLAG_DOCUMENT_4 INT,
    @FLAG_DOCUMENT_5 INT,
    @FLAG_DOCUMENT_6 INT,
    @FLAG_DOCUMENT_7 INT,
    @FLAG_DOCUMENT_8 INT,
    @FLAG_DOCUMENT_9 INT,
    @FLAG_DOCUMENT_10 INT,
    @FLAG_DOCUMENT_11 INT,
    @FLAG_DOCUMENT_12 INT,
    @FLAG_DOCUMENT_13 INT,
    @FLAG_DOCUMENT_14 INT,
    @FLAG_DOCUMENT_15 INT,
    @FLAG_DOCUMENT_16 INT,
    @FLAG_DOCUMENT_17 INT,
    @FLAG_DOCUMENT_18 INT,
    @FLAG_DOCUMENT_19 INT,
    @FLAG_DOCUMENT_20 INT,
    @FLAG_DOCUMENT_21 INT
)
AS
BEGIN
    INSERT INTO application_train.DOCUMENT_APLICATION_TRAIN
    (
        ID,
        FLAG_DOCUMENT_2,
        FLAG_DOCUMENT_3,
        FLAG_DOCUMENT_4,
        FLAG_DOCUMENT_5,
        FLAG_DOCUMENT_6,
        FLAG_DOCUMENT_7,
        FLAG_DOCUMENT_8,
        FLAG_DOCUMENT_9,
        FLAG_DOCUMENT_10,
        FLAG_DOCUMENT_11,
        FLAG_DOCUMENT_12,
        FLAG_DOCUMENT_13,
        FLAG_DOCUMENT_14,
        FLAG_DOCUMENT_15,
        FLAG_DOCUMENT_16,
        FLAG_DOCUMENT_17,
        FLAG_DOCUMENT_18,
        FLAG_DOCUMENT_19,
        FLAG_DOCUMENT_20,
        FLAG_DOCUMENT_21
    )
    VALUES
    (
        @ID,
        @FLAG_DOCUMENT_2,
        @FLAG_DOCUMENT_3,
        @FLAG_DOCUMENT_4,
        @FLAG_DOCUMENT_5,
        @FLAG_DOCUMENT_6,
        @FLAG_DOCUMENT_7,
        @FLAG_DOCUMENT_8,
        @FLAG_DOCUMENT_9,
        @FLAG_DOCUMENT_10,
        @FLAG_DOCUMENT_11,
        @FLAG_DOCUMENT_12,
        @FLAG_DOCUMENT_13,
        @FLAG_DOCUMENT_14,
        @FLAG_DOCUMENT_15,
        @FLAG_DOCUMENT_16,
        @FLAG_DOCUMENT_17,
        @FLAG_DOCUMENT_18,
        @FLAG_DOCUMENT_19,
        @FLAG_DOCUMENT_20,
        @FLAG_DOCUMENT_21
    )
END;

EXEC InsertDocumentApplication 10000000, 0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,0,0,1;
EXEC InsertDocumentApplication 10000001, 0,1,0,1,0,1,0,1,1,1,0,1,0,1,0,1,0,0,0,1;
GO

--Insert pata la tabla application_train.EXT_SOURCES_APPLICATION_TRAIN
CREATE PROCEDURE InsertExtSourcesApplication
(
    @ID INT,
    @EXT_SOURCE_1 FLOAT,
    @EXT_SOURCE_2 FLOAT,
    @EXT_SOURCE_3 FLOAT
)
AS
BEGIN
    INSERT INTO application_train.EXT_SOURCES_APPLICATION_TRAIN
    (
        ID,
        EXT_SOURCE_1,
        EXT_SOURCE_2,
        EXT_SOURCE_3
    )
    VALUES
    (
        @ID,
        @EXT_SOURCE_1,
        @EXT_SOURCE_2,
        @EXT_SOURCE_3
    )
END;

EXEC InsertExtSourcesApplication 10000000, 0.852, 0.365, 0.254;
EXEC InsertExtSourcesApplication 10000001, 0.852, 0.365, 0.254;

GO

--Insertar de la tabla bureau.BUREAU
CREATE PROCEDURE InsertBureau
(
    @SK_ID_BUREAU INT,
    @CREDIT_ACTIVE CHAR(20),
    @CREDIT_CURRENCY CHAR(20),
    @CNT_CREDIT_PROLONG INT,
    @CREDIT_TYPE CHAR(50),
    @SK_ID_CURR INT,
    @ID_CREDIT_TIMELINE INT,
    @ID_CREDIT_AMOUNTS INT
)
AS
BEGIN
    INSERT INTO bureau.BUREAU
    (
		SK_ID_BUREAU,
		CREDIT_ACTIVE,
		CREDIT_CURRENCY,
		CNT_CREDIT_PROLONG,
		CREDIT_TYPE,
		SK_ID_CURR,
		ID_CREDIT_TIMELINE,
		ID_CREDIT_AMOUNTS
    )
    VALUES
    (
        @SK_ID_BUREAU,
		@CREDIT_ACTIVE,
		@CREDIT_CURRENCY,
		@CNT_CREDIT_PROLONG,
		@CREDIT_TYPE,
		@SK_ID_CURR,
		@ID_CREDIT_TIMELINE,
		@ID_CREDIT_AMOUNTS
    )
END;

EXEC InsertBureau 10000000, 'Active', 'currency 1', 0, 'Credit Card', 100000000, 10000000, 10000000;
EXEC InsertBureau 10000001, 'Active', 'currency 1', 0, 'Credit Card', 100000001, 10000001, 10000001;
GO
-- Insert de la tabla bureau.CREDIT_TIMELINE_BUREAU
CREATE PROCEDURE InsertCreditTimelineBureau
(
    @ID INT,
    @DAYS_CREDIT INT,
    @CREDIT_DAY_OVERDUE INT,
    @DAYS_CREDIT_ENDDATE FLOAT,
    @DAYS_ENDDATE_FACT FLOAT,
    @DAYS_CREDIT_UPDATE INT
)
AS
BEGIN
    INSERT INTO bureau.CREDIT_TIMELINE_BUREAU
    (
        ID,
        DAYS_CREDIT,
        CREDIT_DAY_OVERDUE,
        DAYS_CREDIT_ENDDATE,
        DAYS_ENDDATE_FACT,
        DAYS_CREDIT_UPDATE
    )
    VALUES
    (
        @ID,
        @DAYS_CREDIT,
        @CREDIT_DAY_OVERDUE,
        @DAYS_CREDIT_ENDDATE,
        @DAYS_ENDDATE_FACT,
        @DAYS_CREDIT_UPDATE
    )
END;

EXEC InsertCreditTimelineBureau 10000000, -495, 0,-254.0, -254.0, -125;
EXEC InsertCreditTimelineBureau 10000001, -495, 0,-254.0, -254.0, -125;
GO
-- Insert de la tabla bureau.CREDIT_AMOUNTS_BUREAU
CREATE PROCEDURE InsertCreditAmountsBureau
(
    @ID INT,
    @AMT_CREDIT_MAX_OVERDUE FLOAT,
    @AMT_CREDIT_SUM FLOAT,
    @AMT_CREDIT_SUM_DEBT FLOAT,
    @AMT_CREDIT_SUM_LIMIT FLOAT,
    @AMT_CREDIT_SUM_OVERDUE FLOAT,
    @AMT_ANUALITY FLOAT
)
AS
BEGIN
    INSERT INTO bureau.CREDIT_AMOUNTS_BUREAU
    (
        ID,
        AMT_CREDIT_MAX_OVERDUE,
        AMT_CREDIT_SUM,
        AMT_CREDIT_SUM_DEBT,
        AMT_CREDIT_SUM_LIMIT,
        AMT_CREDIT_SUM_OVERDUE,
        AMT_ANUALITY
    )
    VALUES
    (
        @ID,
        @AMT_CREDIT_MAX_OVERDUE,
        @AMT_CREDIT_SUM,
        @AMT_CREDIT_SUM_DEBT,
        @AMT_CREDIT_SUM_LIMIT,
        @AMT_CREDIT_SUM_OVERDUE,
        @AMT_ANUALITY
    )
END;

EXEC InsertCreditAmountsBureau 10000000, 2354.4, 24555.0, 0.0, 12.2, 885433.0, 0.0;
EXEC InsertCreditAmountsBureau 10000001, 2354.4, 24555.0, 0.0, 12.2, 885433.0, 0.0;
GO
--Insertar de la tabla bureau.BUREAU_BALANCE
CREATE PROCEDURE InsertBureauBalance
(
    @ID INT,
    @SK_ID_BUREAU INT,
    @MONTHS_BALANCE INT,
    @STATUS CHAR(1)
)

AS
BEGIN
    INSERT INTO bureau.BUREAU_BALANCE
    (
        ID,
        SK_ID_BUREAU,
        MONTHS_BALANCE,
        STATUS
    )
    VALUES
    (
        @ID,
        @SK_ID_BUREAU,
        @MONTHS_BALANCE,
        @STATUS
    )
END;

EXEC InsertBureauBalance 10000000, 10000000, -4, 'C';
EXEC InsertBureauBalance 10000001, 10000001, -4, 'C';

GO

--Insertar de la tabla previous.previous_application

CREATE PROCEDURE InsertPreviousApplication
(
    @SK_ID_PREV INT,
    @NAME_CONTRACT_TYPE NVARCHAR(50),
    @WEEKDAY_APPR_PROCESS_START NVARCHAR(50),
    @HOUR_APPR_PROCESS_START INT,
    @FLAG_LAST_APPL_PER_CONTRACT CHAR(1),
    @NFLAG_LAST_APPL_IN_DAY INT,
    @NAME_CASH_LOAN_PURPOSE CHAR(50),
    @NAME_CONTRACT_STATUS NVARCHAR(50),
    @DAYS_DECISION INT,
    @NAME_PAYMENT_TYPE NVARCHAR(50),
    @CODE_REJECT_REASON CHAR(50),
    @NAME_TYPE_SUITE NVARCHAR(50),
    @NAME_CLIENT_TYPE NVARCHAR(50),
    @NAME_GOODS_CATEGORY	CHAR(50),
    @NAME_PORTFOLIO CHAR(50),
    @NAME_PRODUCT_TYPE CHAR(20),
    @CHANNEL_TYPE NVARCHAR(50),
    @SELLERPLACE_AREA INT,
    @NAME_SELLER_INDUSTRY NVARCHAR(50),
    @CNT_PAYMENT FLOAT,
    @NAME_YIELD_GROUP NVARCHAR(50),
    @PRODUCT_COMBINATION	NVARCHAR(50),
    @ID_INTEREST_RATES INT,
    @ID_AMT_PREVIOUS INT,
    @ID_LOAN_TERMS INT,
    @SK_ID_CURR INT
    
)
AS
BEGIN
    INSERT INTO previous.PREVIOUS_APPLICATION
    (
        SK_ID_PREV,
		NAME_CONTRACT_TYPE,
		WEEKDAY_APPR_PROCESS_START,
		HOUR_APPR_PROCESS_START,
		FLAG_LAST_APPL_PER_CONTRACT,
		NFLAG_LAST_APPL_IN_DAY,
		NAME_CASH_LOAN_PURPOSE,
		NAME_CONTRACT_STATUS,
		DAYS_DECISION,
		NAME_PAYMENT_TYPE,
		CODE_REJECT_REASON,
		NAME_TYPE_SUITE,
		NAME_CLIENT_TYPE,
		NAME_GOODS_CATEGORY,
		NAME_PORTFOLIO,
		NAME_PRODUCT_TYPE,
		CHANNEL_TYPE,
		SELLERPLACE_AREA,
		NAME_SELLER_INDUSTRY,
		CNT_PAYMENT,
		NAME_YIELD_GROUP,
		PRODUCT_COMBINATION,
		ID_INTEREST_RATES,
		ID_AMT_PREVIOUS,
		ID_LOAN_TERMS,
		SK_ID_CURR
    )
    VALUES
    (
        @SK_ID_PREV,
		@NAME_CONTRACT_TYPE,
		@WEEKDAY_APPR_PROCESS_START,
		@HOUR_APPR_PROCESS_START,
		@FLAG_LAST_APPL_PER_CONTRACT,
		@NFLAG_LAST_APPL_IN_DAY,
		@NAME_CASH_LOAN_PURPOSE,
		@NAME_CONTRACT_STATUS,
		@DAYS_DECISION,
		@NAME_PAYMENT_TYPE,
		@CODE_REJECT_REASON,
		@NAME_TYPE_SUITE,
		@NAME_CLIENT_TYPE,
		@NAME_GOODS_CATEGORY,
		@NAME_PORTFOLIO,
		@NAME_PRODUCT_TYPE,
		@CHANNEL_TYPE,
		@SELLERPLACE_AREA,
		@NAME_SELLER_INDUSTRY,
		@CNT_PAYMENT,
		@NAME_YIELD_GROUP,
		@PRODUCT_COMBINATION,
		@ID_INTEREST_RATES,
		@ID_AMT_PREVIOUS,
		@ID_LOAN_TERMS,
		@SK_ID_CURR
    )
END;

EXEC InsertPreviousApplication 10000000,'Loan','MONDAY',2,'Y', 3,'XAP','Approved',-24,'Cash through the bank',NULL,'Unaccompanied','New','Mobile','POS','X-Sell','Credit and cash offices',100,'Furniture',12.0,'Low action','POS mobile with interest',10000000,10000000,10000000,100000000;
EXEC InsertPreviousApplication 10000001,'Loan','MONDAY',2,'Y', 3,'XAP','Approved',-24,'Cash through the bank',NULL,'Unaccompanied','New','Mobile','POS','X-Sell','Credit and cash offices',100,'Furniture',12.0,'Low action','POS mobile with interest',10000001,10000001,10000001,100000001;
GO

--Insert para la tabla previous.INTEREST_RATES_PREVIOUS_APPLICATION

CREATE PROCEDURE InsertInterestRates
(
    @ID INT,
    @RATE_DOWN_PAYMENT FLOAT,
    @RATE_INTEREST_PRIMARY FLOAT,
    @RATE_INTEREST_PRIVILEGED FLOAT
)
AS
BEGIN
    INSERT INTO previous.INTEREST_RATES_PREVIOUS_APPLICATION
    (
        ID,
        RATE_DOWN_PAYMENT,
        RATE_INTEREST_PRIMARY,
        RATE_INTEREST_PRIVILEGED
    )
    VALUES
    (
        @ID,
        @RATE_DOWN_PAYMENT,
        @RATE_INTEREST_PRIMARY,
        @RATE_INTEREST_PRIVILEGED
    )
END;

EXEC InsertInterestRates  10000000, 0.2635, 0.574534, 0.6456;
EXEC InsertInterestRates  10000001, 0.2635, 0.574534, 0.6456;
GO

--Insertar de la tabla previous.AMT_PREVIOUS_APPLICATION
CREATE PROCEDURE InsertAmtPreviousApplication
(
    @ID INT,
    @AMT_ANNUITY FLOAT,
    @AMT_APPLICATION FLOAT,
    @AMT_CREDIT FLOAT,
    @AMT_DOWN_PAYMENT FLOAT,
    @AMT_GOODS_PRICE FLOAT
)
AS
BEGIN
    INSERT INTO previous.AMT_PREVIOUS_APPLICATION
    (
        ID,
        AMT_ANNUITY,
        AMT_APPLICATION,
        AMT_CREDIT,
        AMT_DOWN_PAYMENT,
        AMT_GOODS_PRICE
    )
    VALUES
    (
        @ID,
        @AMT_ANNUITY,
        @AMT_APPLICATION,
        @AMT_CREDIT,
        @AMT_DOWN_PAYMENT,
        @AMT_GOODS_PRICE
    )
END;
EXEC InsertAmtPreviousApplication  10000000, 17852.45, 1236587.654, 0.0, 0.0, 123546.0 ;
EXEC InsertAmtPreviousApplication  10000001, 17852.45, 1236587.654, 0.0, 0.0, 123546.0 ;
GO
--Insertar de la tabla previous.LOAN_TERMS_PREVIOUS_APPLICATION
CREATE PROCEDURE InsertLoanTerms
(
    @ID INT,
    @DAYS_FIRST_DRAWING FLOAT,
    @DAYS_FIRST_DUE FLOAT,
    @DAYS_LAST_DUE_1ST_VERSION FLOAT,
    @DAYS_LAST_DUE FLOAT,
    @DAYS_TERMINATION FLOAT,
    @NFLAG_INSURED_ON_APPROVAL FLOAT
)
AS
BEGIN
    INSERT INTO previous.LOAN_TERMS_PREVIOUS_APPLICATION
    (
        ID,
        DAYS_FIRST_DRAWING,
        DAYS_FIRST_DUE,
        DAYS_LAST_DUE_1ST_VERSION,
        DAYS_LAST_DUE,
        DAYS_TERMINATION,
        NFLAG_INSURED_ON_APPROVAL
    )
    VALUES
    (
        @ID,
        @DAYS_FIRST_DRAWING,
        @DAYS_FIRST_DUE,
        @DAYS_LAST_DUE_1ST_VERSION,
        @DAYS_LAST_DUE,
        @DAYS_TERMINATION,
        @NFLAG_INSURED_ON_APPROVAL
    )
END;

EXEC InsertLoanTerms  10000000, 32548.0, -52.0, 300.2, -46.0, -264.0 ,0.0;
EXEC InsertLoanTerms  10000001, 32548.0, -52.0, 300.2, -46.0, -264.0 ,0.0;
GO

--Insertar de la tabla previous.CREDIT_CARD_BALANCED
CREATE PROCEDURE InsertCreditCardBalance
(
    @SK_ID_CURR INT,
    @MONTHS_BALANCE INT,
    @AMT_BALANCE FLOAT,
    @AMT_CREDIT_LIMIT_ACTUAL INT,
    @AMT_INST_MIN_REGULARITY FLOAT,
    @AMT_PAYMENT_CURRENT FLOAT,
    @AMT_PAYMENT_TOTAL_CURRENT FLOAT,
    @AMT_RECEIVABLE_PRINCIPAL FLOAT,
    @AMT_RECIVABLE FLOAT,
    @AMT_TOTAL_RECEIVABLE FLOAT,
    @CNT_INSTALMENT_MATURE_CUM FLOAT,
    @NAME_CONTRACT_STATUS VARCHAR(50),
    @SK_DPD INT,
    @SK_DPD_DEF INT,
    @SK_ID_PREV INT,
    @ID_CREDIT_CARD_DRAWINGS INT
)
AS
BEGIN
    INSERT INTO previous.CREDIT_CARD_BALANCED
    (
        SK_ID_CURR,
        MONTHS_BALANCE,
        AMT_BALANCE,
        AMT_CREDIT_LIMIT_ACTUAL,
        AMT_INST_MIN_REGULARITY,
        AMT_PAYMENT_CURRENT,
        AMT_PAYMENT_TOTAL_CURRENT,
        AMT_RECEIVABLE_PRINCIPAL,
        AMT_RECIVABLE,
        AMT_TOTAL_RECEIVABLE,
        CNT_INSTALMENT_MATURE_CUM,
        NAME_CONTRACT_STATUS,
        SK_DPD,
        SK_DPD_DEF,
        SK_ID_PREV,
        ID_CREDIT_CARD_DRAWINGS
    )
    VALUES
    (
        @SK_ID_CURR,
        @MONTHS_BALANCE,
        @AMT_BALANCE,
        @AMT_CREDIT_LIMIT_ACTUAL,
        @AMT_INST_MIN_REGULARITY,
        @AMT_PAYMENT_CURRENT,
        @AMT_PAYMENT_TOTAL_CURRENT,
        @AMT_RECEIVABLE_PRINCIPAL,
        @AMT_RECIVABLE,
        @AMT_TOTAL_RECEIVABLE,
        @CNT_INSTALMENT_MATURE_CUM,
        @NAME_CONTRACT_STATUS,
        @SK_DPD,
        @SK_DPD_DEF,
        @SK_ID_PREV,
        @ID_CREDIT_CARD_DRAWINGS
    )
END;

EXEC InsertCreditCardBalance 10000000, 5, 56.87, 4, 12600.0, 1200.36, 1900.0, 1900.0, 0.0, 0.2,0.0,'Active',10000000, 10000000,10000000,10000000;  

GO

--Insert de la tabla previous.CREDIT_CARD_DRAWINGS

CREATE PROCEDURE InsertCreditCardDrawings
(
    @ID INT,
    @AMT_DRAWINGS_ATM_CURRENT FLOAT,
    @AMT_DRAWINGS_CURRENT FLOAT,
    @AMT_DRAWINGS_OTHER_CURRENT FLOAT,
    @AMT_DRAWINGS_POS_CURRENT FLOAT,
    @CNT_DRAWINGS_ATM_CURRENT FLOAT,
    @CNT_DRAWINGS_CURRENT FLOAT,
    @CNT_DRAWINGS_OTHER_CURRENT FLOAT,
    @CNT_DRAWINGS_POS_CURRENT FLOAT
)
AS
BEGIN
    INSERT INTO previous.CREDIT_CARD_DRAWINGS
    (
        ID,
        AMT_DRAWINGS_ATM_CURRENT,
        AMT_DRAWINGS_CURRENT,
        AMT_DRAWINGS_OTHER_CURRENT,
        AMT_DRAWINGS_POS_CURRENT,
        CNT_DRAWINGS_ATM_CURRENT,
        CNT_DRAWINGS_CURRENT,
        CNT_DRAWINGS_OTHER_CURRENT,
        CNT_DRAWINGS_POS_CURRENT
    )
    VALUES
    (
        @ID,
        @AMT_DRAWINGS_ATM_CURRENT,
        @AMT_DRAWINGS_CURRENT,
        @AMT_DRAWINGS_OTHER_CURRENT,
        @AMT_DRAWINGS_POS_CURRENT,
        @CNT_DRAWINGS_ATM_CURRENT,
        @CNT_DRAWINGS_CURRENT,
        @CNT_DRAWINGS_OTHER_CURRENT,
        @CNT_DRAWINGS_POS_CURRENT
    )
END;

EXEC InsertCreditCardDrawings 10000000, 0.0, 854.0, 2.0, 0.0, 0.0, 1.0, 3.25,1.0;
EXEC InsertCreditCardDrawings 10000001, 0.0, 854.0, 2.0, 0.0, 0.0, 1.0, 3.25,1.0;
GO

--Insert de la tabla previous.INSTALLMENTS_PAYMENT

CREATE PROCEDURE InsertInstallmentsPayments
(
    @SK_ID_CURR INT,
    @NUM_INSTALMENT_VERSION FLOAT,
    @NUM_INSTALMENT_NUMBER INT,
    @DAYS_INSTALMENT FLOAT,
    @DAYS_ENTRY_PAYMENT FLOAT,
    @AMT_INSTALMENT FLOAT,
    @AMT_PAYMENT FLOAT,
    @SK_ID_PREV INT
)
AS
BEGIN
    INSERT INTO previous.INSTALLMENTS_PAYMENT
    (
        SK_ID_CURR,
        NUM_INSTALMENT_VERSION,
        NUM_INSTALMENT_NUMBER,
        DAYS_INSTALMENT,
        DAYS_ENTRY_PAYMENT,
        AMT_INSTALMENT,
        AMT_PAYMENT,
        SK_ID_PREV
    )
    VALUES
    (
        @SK_ID_CURR,
        @NUM_INSTALMENT_VERSION,
        @NUM_INSTALMENT_NUMBER,
        @DAYS_INSTALMENT,
        @DAYS_ENTRY_PAYMENT,
        @AMT_INSTALMENT,
        @AMT_PAYMENT,
        @SK_ID_PREV
    )
END;

EXEC InsertInstallmentsPayments 10000000, 1.0, 5, -1180.0, -1187.0, 3654.32, 6548.0, 10000000;
EXEC InsertInstallmentsPayments 10000001, 1.0, 5, -1180.0, -1187.0, 3654.32, 6548.0, 10000000;
GO

--Insert de la tabla previous.POS_CASH_BALANCE
CREATE PROCEDURE InsertPOSCashBalance
(
    @SK_ID_PREV INT,
    @MONTHS_BALANCE INT,
    @CNT_INSTALMENT FLOAT,
    @CNT_INSTALMENT_FUTURE FLOAT,
    @NAME_CONTRACT_STATUS NVARCHAR(50),
    @SK_DPD INT,
    @SK_DPD_DEF INT,
    @SK_ID_CURR INT
)
AS
BEGIN
    INSERT INTO previous.POS_CASH_BALANCE
    (
        SK_ID_PREV,
		MONTHS_BALANCE,
		CNT_INSTALMENT,
		CNT_INSTALMENT_FUTURE,
		NAME_CONTRACT_STATUS,
		SK_DPD,
		SK_DPD_DEF,
		SK_ID_CURR 
    )
    VALUES
    (
        @SK_ID_PREV,
		@MONTHS_BALANCE,
		@CNT_INSTALMENT,
		@CNT_INSTALMENT_FUTURE,
		@NAME_CONTRACT_STATUS,
		@SK_DPD,
		@SK_DPD_DEF,
		@SK_ID_CURR 
    )
END;

EXEC InsertPOSCashBalance 10000000, -22, 56.0, 42.0, 'Active', 10000000,10000000, 10000000;
EXEC InsertPOSCashBalance 10000001, -22, 56.0, 42.0, 'Active', 10000001,10000001, 10000001;