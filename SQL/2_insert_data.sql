-- Create a single table to temporarily hold all the data from the CSV
CREATE TABLE staging_table (
    customerID VARCHAR(255),
    gender VARCHAR(255),
    SeniorCitizen INT,
    Partner VARCHAR(255),
    Dependents VARCHAR(255),
    tenure INT,
    PhoneService VARCHAR(255),
    MultipleLines VARCHAR(255),
    InternetService VARCHAR(255),
    OnlineSecurity VARCHAR(255),
    OnlineBackup VARCHAR(255),
    DeviceProtection VARCHAR(255),
    TechSupport VARCHAR(255),
    StreamingTV VARCHAR(255),
    StreamingMovies VARCHAR(255),
    Contract VARCHAR(255),
    PaperlessBilling VARCHAR(255),
    PaymentMethod VARCHAR(255),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges VARCHAR(255), -- Load as VARCHAR first to handle empty strings
    Churn VARCHAR(255)
);

-- Load data to staging table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/WA_Fn-UseC_-Telco-Customer-Churn.csv' -- Change the path according to yours
INTO TABLE staging_table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS; -- This skips the header row of the CSV file

-- Populate the 'customers' table
INSERT INTO customers (customerID, gender, SeniorCitizen, Partner, Dependents)
SELECT customerID, gender, SeniorCitizen, Partner, Dependents
FROM staging_table;

-- Populate the 'account_info' table
-- We use NULLIF to convert empty strings in TotalCharges to NULL, then cast to DECIMAL
INSERT INTO account_info (customerID, tenure, Contract, PaperlessBilling, PaymentMethod, MonthlyCharges, TotalCharges)
SELECT
    customerID,
    tenure,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    -- This corrected line now handles values that are just spaces
    CAST(NULLIF(TRIM(TotalCharges), '') AS DECIMAL(10, 2))
FROM
    staging_table;

-- Populate the 'services' table
INSERT INTO services (customerID, PhoneService, MultipleLines, InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies)
SELECT customerID, PhoneService, MultipleLines, InternetService, OnlineSecurity, OnlineBackup, DeviceProtection, TechSupport, StreamingTV, StreamingMovies
FROM staging_table;

-- Populate the 'churn_data' table
INSERT INTO churn_data (customerID, Churn)
SELECT customerID, Churn
FROM staging_table;

-- Drop the staging table
-- DROP TABLE staging_table;
-- DROP TABLE account_info;
-- DROP TABLE churn_data;
-- DROP TABLE services;
-- DROP TABLE customers;