-- Task: Analyze the churn rate by Contract type.
-- This helps us see if long-term contracts reduce churn.
SELECT
    a.Contract,
    COUNT(ch.customerID) AS total_customers,
    SUM(CASE WHEN ch.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    -- Calculate the churn rate as a percentage
    (SUM(CASE WHEN ch.Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(ch.customerID)) AS churn_rate_percent
FROM
    account_info a
JOIN
    churn_data ch ON a.customerID = ch.customerID
GROUP BY
    a.Contract
ORDER BY
    churn_rate_percent DESC;


-- Task: Investigate the average MonthlyCharges for customers who churned vs. those who didn't.
-- This helps us see if higher monthly bills are a factor in churn.
SELECT
    ch.Churn,
    AVG(a.MonthlyCharges) AS average_monthly_charges
FROM
    churn_data ch
JOIN
    account_info a ON ch.customerID = a.customerID
GROUP BY
    ch.Churn;


-- Task: Analyze the churn rate by Internet Service type.
-- This can reveal if customers with a certain service (like Fiber optic) are more likely to leave.
SELECT
    s.InternetService,
    COUNT(ch.customerID) AS total_customers,
    SUM(CASE WHEN ch.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN ch.Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(ch.customerID)) AS churn_rate_percent
FROM
    services s
JOIN
    churn_data ch ON s.customerID = ch.customerID
GROUP BY
    s.InternetService
ORDER BY
    churn_rate_percent DESC;