-- Create a new database for our project
CREATE DATABASE telco_churn;

-- Select the newly created database to work with
USE telco_churn;

-- Create a table for basic customer demographic information
CREATE TABLE customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen TINYINT,
    Partner VARCHAR(3),
    Dependents VARCHAR(3)
);

-- Create a table for customer account information
CREATE TABLE account_info (
    customerID VARCHAR(20) PRIMARY KEY,
    tenure INT,
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(3),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges DECIMAL(10, 2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- Create a table for the services each customer has signed up for
CREATE TABLE services (
    customerID VARCHAR(20) PRIMARY KEY,
    PhoneService VARCHAR(3),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- Create a table for the final churn status
CREATE TABLE churn_data (
    customerID VARCHAR(20) PRIMARY KEY,
    Churn VARCHAR(3),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);