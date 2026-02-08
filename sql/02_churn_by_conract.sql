SELECT Contract, COUNT(*) AS total_customers,
SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND( SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_percent
FROM "Telco-Customer-Churn" GROUP BY Contract;
