-- Count the total number of customers.
SELECT COUNT(*) 
FROM customers;

-- Check for missing values in key columns.
SELECT
   SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS missing_customerID,
   SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
   SUM(CASE WHEN SeniorCitizen IS NULL THEN 1 ELSE 0 END) AS missing_SeniorCitizen,
   SUM(CASE WHEN Partner IS NULL THEN 1 ELSE 0 END) AS missing_Partner,
   SUM(CASE WHEN Dependents IS NULL THEN 1 ELSE 0 END) AS missing_Dependents
FROM
   customers;

-- Get a sense of the data distribution for categorical features like gender, InternetService, and Contract.
-- How many customers per contract type?
SELECT Contract, COUNT(*) AS number_of_customers
FROM account_info
GROUP BY Contract
ORDER BY number_of_customers DESC;

-- What is the distribution of internet services?
SELECT InternetService, COUNT(*) AS number_of_customers
FROM services
GROUP BY InternetService
ORDER BY number_of_customers DESC;

-- What is the gender distribution?
SELECT gender, COUNT(*) AS number_of_customers
FROM customers
GROUP BY gender;