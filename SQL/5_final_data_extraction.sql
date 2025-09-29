SELECT
    c.customerID,
    c.gender,
    c.SeniorCitizen,
    c.Partner,
    c.Dependents,
    a.tenure,
    a.Contract,
    a.PaperlessBilling,
    a.PaymentMethod,
    a.MonthlyCharges,
    a.TotalCharges,
    s.PhoneService,
    s.MultipleLines,
    s.InternetService,
    s.OnlineSecurity,
    s.OnlineBackup,
    s.DeviceProtection,
    s.TechSupport,
    s.StreamingTV,
    s.StreamingMovies,
    ch.Churn
FROM
    customers c
JOIN
    account_info a ON c.customerID = a.customerID
JOIN
    services s ON c.customerID = s.customerID
JOIN
    churn_data ch ON c.customerID = ch.customerID;