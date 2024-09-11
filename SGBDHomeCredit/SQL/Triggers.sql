--7.Debe construirse triggers en todas las tablas para verificar la validez de los valores ingresados al insertar. 5 pts

CREATE TRIGGER trg_application_train_insert
ON [application_train].[APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [WEEKDAY_APPR_PROCESS_START] NOT IN ('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY')
    )
    BEGIN
        RAISERROR('Invalid value in APPLICATION_TRAIN. Insert the name of the day correctly', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_customer_application_insert
ON [application_train].[CUSTOMER_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [CODE_GENDER] NOT IN ('M', 'F')
    )
    BEGIN
        RAISERROR('Invalid value in CUSTOMER_APPLICATION_TRAIN. Enter M for male and F for female in the gender code.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_properties_customers_insert
ON [application_train].[PROPERTIES_CUSTOMERS_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
   
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_OWN_CAR NOT IN ('Y', 'N')
    )
    BEGIN
        RAISERROR('Invalid value in PROPERTIES_CUSTOMERS_APPLICATION_TRAIN. Enter Y for Yes and N for No in FLAG_OWN_CAR.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_OWN_REALTY NOT IN ('Y', 'N')
    )
    BEGIN
        RAISERROR('Invalid value in PROPERTIES_CUSTOMERS_APPLICATION_TRAIN. Enter Y for Yes and N for No in FLAG_OWN_REALTY.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_contact_customer_insert
ON [application_train].[CONTACT_CUSTOMER_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
 
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_MOBIL NOT IN (0, 1)
    )
    BEGIN
        RAISERROR('Invalid value in CONTACT_CUSTOMER_APPLICATION_TRAIN. Enter 0 or 1 for FLAG_MOBIL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_MOBIL NOT IN (0, 1)
    )
    BEGIN
        RAISERROR('Invalid value in CONTACT_CUSTOMER_APPLICATION_TRAIN. Enter 0 or 1 for FLAG_MOBIL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_CONT_MOBILE NOT IN (0, 1)
    )
    BEGIN
        RAISERROR('Invalid value in CONTACT_CUSTOMER_APPLICATION_TRAIN. Enter 0 or 1 for FLAG_CONT_MOBILE.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_PHONE NOT IN (0, 1)
    )
    BEGIN
        RAISERROR('Invalid value in CONTACT_CUSTOMER_APPLICATION_TRAIN. Enter 0 or 1 for FLAG_PHONE.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE FLAG_EMAIL NOT IN (0, 1)
    )
    BEGIN
        RAISERROR('Invalid value in CONTACT_CUSTOMER_APPLICATION_TRAIN. Enter 0 or 1 for FLAG_EMAIL.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_requests_application_insert
ON [application_train].[AMT_REQUEST_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [AMT_REQ_CREDIT_BUREAU_HOUR] < 0
        OR [AMT_REQ_CREDIT_BUREAU_DAY] < 0
        OR [AMT_REQ_CREDIT_BUREAU_WEEK] < 0
        OR [AMT_REQ_CREDIT_BUREAU_MON] < 0
        OR [AMT_REQ_CREDIT_BUREAU_QRT] < 0
        OR [AMT_REQ_CREDIT_BUREAU_YEAR] < 0
    )
    BEGIN
        RAISERROR('Invalid values in AMT_REQUEST_APPLICATION_TRAIN. NEGATIVE.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_region_qualification_insert
ON [application_train].[REGION_QUALIFICATION_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    -- Verificar las columnas REG_REGION_NOT_LIVE_REGION a REG_CITY_NOT_WORK_CITY
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [REG_REGION_NOT_LIVE_REGION] < 0
            OR [REG_REGION_NOT_WORK_REGION] < 0
            OR [LIVE_REGION_NOT_WORK_REGION] < 0
            OR [REG_CITY_NOT_LIVE_CITY] < 0
            OR [REG_CITY_NOT_WORK_CITY] < 0
            OR [LIVE_CITY_NOT_WORK_CITY] < 0
    )
    BEGIN
        RAISERROR('Invalid values in REGION_QUALIFICATION_APPLICATION_TRAIN. NEGATIVE.', 16, 1);
        ROLLBACK TRANSACTION;
    END;

    -- Verificar las columnas REGION_POPULATION_RELATIVE, REGION_RATING_CLIENT, REGION_RATING_CLIENT_W_CITY
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [REGION_POPULATION_RELATIVE] < 0
            OR [REGION_RATING_CLIENT] < 0
            OR [REGION_RATING_CLIENT_W_CITY] < 0
    )
    BEGIN
        RAISERROR('Invalid values in REGION_QUALIFICATION_APPLICATION_TRAIN. NEGATIVE.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO
CREATE TRIGGER trg_build_AVG_insert
ON [application_train].[BUILD_COSTUMER_AVG_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE
        [APARTMENTS_AVG] < 0
        OR [BASEMENTAREA_AVG] < 0
        OR [YEARS_BEGINEXPLUATATION_AVG] < 0
        OR [YEARS_BUILD_AVG] < 0
        OR [COMMONAREA_AVG] < 0
        OR [ELEVATORS_AVG] < 0
        OR [ENTRANCES_AVG] < 0
        OR [FLOORSMAX_AVG] < 0
        OR [FLOORSMIN_AVG] < 0
        OR [LANDAREA_AVG] < 0
        OR [LIVINGAPARTMENTS_AVG] < 0
        OR [LIVINGAREA_AVG] < 0
        OR [NONLIVINGAPARTMENTS_AVG] < 0
        OR [NONLIVINGAREA_AVG] < 0
       
    )
    BEGIN
        RAISERROR('Invalid values in BUILD_COSTUMER_AVG_APPLICATION_TRAIN. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_buil_MODE_insert
ON [application_train].[BUILD_COSTUMER_MODE_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE
        [APARTMENTS_MODE] < 0
        OR [BASEMENTAREA_MODE] < 0
        OR [YEARS_BEGINEXPLUATATION_MODE] < 0
        OR [YEARS_BUILD_MODE] < 0
        OR [COMMONAREA_MODE] < 0
        OR [ELEVATORS_MODE] < 0
        OR [ENTRANCES_MODE] < 0
        OR [FLOORSMAX_MODE] < 0
        OR [FLOORSMIN_MODE] < 0
        OR [LANDAREA_MODE] < 0
        OR [LIVINGAPARTMENTS_MODE] < 0
        OR [LIVINGAREA_MODE] < 0
        OR [NONLIVINGAPARTMENTS_MODE] < 0
        OR [NONLIVINGAREA_MODE] < 0
       
    )
    BEGIN
        RAISERROR('Invalid values in BUILD_COSTUMER_MODE_APPLICATION_TRAIN. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_buil_MEDI_insert
ON [application_train].[BUILD_COSTUMER_MEDI_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE
        [APARTMENTS_MEDI] < 0
        OR [BASEMENTAREA_MEDI] < 0
        OR [YEARS_BEGINEXPLUATATION_MEDI] < 0
        OR [YEARS_BUILD_MEDI] < 0
        OR [COMMONAREA_MEDI] < 0
        OR [ELEVATORS_MEDI] < 0
        OR [ENTRANCES_MEDI] < 0
        OR [FLOORSMAX_MEDI] < 0
        OR [FLOORSMIN_MEDI] < 0
        OR [LANDAREA_MEDI] < 0
        OR [LIVINGAPARTMENTS_MEDI] < 0
        OR [LIVINGAREA_MEDI] < 0
        OR [NONLIVINGAPARTMENTS_MEDI] < 0
        OR [NONLIVINGAREA_MEDI] < 0
       
    )
    BEGIN
        RAISERROR('Invalid values in BUILD_COSTUMER_MEDI_APPLICATION_TRAIN. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_custumer_costumer_insert
ON [application_train].[CUSTUMER_CUSTOMER_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [OBS_30_CNT_SOCIAL_CIRCLE] < 0
        OR [DEF_30_CNT_SOCIAL_CIRCLE] < 0
        OR [OBS_60_CNT_SOCIAL_CIRCLE] < 0
        OR [DEF_60_CNT_SOCIAL_CIRCLE] < 0
    )
    BEGIN
        RAISERROR('Invalid values in CUSTUMER_CUSTOMER_APPLICATION_TRAIN. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_document_application_insert
ON [application_train].[DOCUMENT_APLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE
        [FLAG_DOCUMENT_2] IS NULL
        OR [FLAG_DOCUMENT_3] IS NULL
        OR [FLAG_DOCUMENT_4] IS NULL
        OR [FLAG_DOCUMENT_5] IS NULL
        OR [FLAG_DOCUMENT_6] IS NULL
        OR [FLAG_DOCUMENT_7] IS NULL
        OR [FLAG_DOCUMENT_8] IS NULL
        OR [FLAG_DOCUMENT_9] IS NULL
        OR [FLAG_DOCUMENT_10] IS NULL
        OR [FLAG_DOCUMENT_11] IS NULL
        OR [FLAG_DOCUMENT_12] IS NULL
        OR [FLAG_DOCUMENT_13] IS NULL
        OR [FLAG_DOCUMENT_14] IS NULL
        OR [FLAG_DOCUMENT_15] IS NULL
        OR [FLAG_DOCUMENT_16] IS NULL
        OR [FLAG_DOCUMENT_17] IS NULL
        OR [FLAG_DOCUMENT_18] IS NULL
        OR [FLAG_DOCUMENT_19] IS NULL
        OR [FLAG_DOCUMENT_20] IS NULL
        OR [FLAG_DOCUMENT_21] IS NULL
    )
    BEGIN
        RAISERROR('Invalid values in DOCUMENT_APLICATION_TRAIN. NULL values are not allowed in the specified columns.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_ext_sources_application_insert
ON [application_train].[EXT_SOURCES_APPLICATION_TRAIN]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [EXT_SOURCE_1] < 0
        OR [EXT_SOURCE_2] < 0
        OR [EXT_SOURCE_3] < 0
    )
    BEGIN
        RAISERROR('Invalid values in EXT_SOURCES_APPLICATION_TRAIN. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_bureau_insert
ON [bureau].[BUREAU]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [CREDIT_ACTIVE] NOT IN ('Closed', 'Active')
    )
    BEGIN
        RAISERROR('Invalid values in BUREAU. Only "Closed" or "Active" values are allowed in the [CREDIT_ACTIVE] column.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_credit_timeline_bureau_insert
ON [bureau].[CREDIT_TIMELINE_BUREAU]
AFTER INSERT
AS
BEGIN
    PRINT 'Successful insertion into CREDIT_TIMELINE_BUREAU.';
END;

GO

CREATE TRIGGER trg_credit_amounts_bureau_insert
ON [bureau].[CREDIT_AMOUNTS_BUREAU]
AFTER INSERT
AS
BEGIN
    PRINT 'Successful insertion into CREDIT_AMOUNTS_BUREAU.';
END;

GO

CREATE TRIGGER trg_bureau_balance_insert
ON [bureau].[BUREAU_BALANCE]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        LEFT JOIN [bureau].[BUREAU] b ON i.[SK_ID_BUREAU] = b.[SK_ID_BUREAU]
        WHERE b.[SK_ID_BUREAU] IS NULL
    )
    BEGIN
        RAISERROR('Invalid values in BUREAU_BALANCE. The SK_ID_BUREAU value does not exist in the BUREAU table.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_previous_application_insert
ON [previous].[PREVIOUS_APPLICATION]
AFTER INSERT
AS
BEGIN
    PRINT 'Successful insertion into PREVIOUS_APPLICATION.';
END;
GO


CREATE TRIGGER trg_interest_rates_insert
ON [previous].[INTEREST_RATES_PREVIOUS_APPLICATION]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [RATE_DOWN_PAYMENT] < 0
        OR [RATE_INTEREST_PRIMARY] < 0
        OR [RATE_INTEREST_PRIVILEGED] < 0
    )
    BEGIN
        RAISERROR('Invalid values in INTEREST_RATES_PREVIOUS_APPLICATION. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_amt_previous_application_insert
ON [previous].[AMT_PREVIOUS_APPLICATION]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [AMT_ANNUITY] < 0
        OR [AMT_APPLICATION] < 0
        OR [AMT_CREDIT] < 0
        OR [AMT_DOWN_PAYMENT] < 0
        OR [AMT_GOODS_PRICE] < 0
    )
    BEGIN
        RAISERROR('Invalid values in AMT_PREVIOUS_APPLICATION. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_loan_terms_insert
ON [previous].[LOAN_TERMS_PREVIOUS_APPLICATION]
AFTER INSERT
AS
BEGIN
    PRINT 'Successful insertion into LOAN_TERMS_PREVIOUS_APPLICATION.';
END;

GO


CREATE TRIGGER trg_credit_card_balance_insert
ON [previous].[CREDIT_CARD_BALANCED]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [MONTHS_BALANCE] < 0
    )
    BEGIN
        RAISERROR('Invalid values in CREDIT_CARD_BALANCED. Negative values are not allowed in the [MONTHS_BALANCE] column.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_credit_card_drawings_insert
ON [previous].[CREDIT_CARD_DRAWINGS]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [AMT_DRAWINGS_ATM_CURRENT] < 0
        OR [AMT_DRAWINGS_CURRENT] < 0
        OR [AMT_DRAWINGS_OTHER_CURRENT] < 0
        OR [AMT_DRAWINGS_POS_CURRENT] < 0
        OR [CNT_DRAWINGS_ATM_CURRENT] < 0
        OR [CNT_DRAWINGS_CURRENT] < 0
        OR [CNT_DRAWINGS_OTHER_CURRENT] < 0
        OR [CNT_DRAWINGS_POS_CURRENT] < 0
    )
    BEGIN
        RAISERROR('Invalid values in CREDIT_CARD_DRAWINGS. Negative values.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

CREATE TRIGGER trg_installments_payments_insert
ON [previous].[INSTALLMENTS_PAYMENT]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [DAYS_INSTALMENT] >= 0
        OR [DAYS_ENTRY_PAYMENT] >= 0
    )
    BEGIN
        RAISERROR('Invalid values in INSTALLMENTS_PAYMENT. Values must be negative in the [DAYS_INSTALMENT] and [DAYS_ENTRY_PAYMENT] columns.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO


CREATE TRIGGER trg_POS_CASH_balance_insert
ON [previous].[POS_CASH_BALANCE]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE [MONTHS_BALANCE] > 0
    )
    BEGIN
        RAISERROR('Invalid values in POS_CASH_BALANCE. Values in [MONTHS_BALANCE] must not exceed 0.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

