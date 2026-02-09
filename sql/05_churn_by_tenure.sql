SELECT 
	CASE 
		WHEN tenure BETWEEN 0 AND 12 THEN '0-12'
		WHEN tenure BETWEEN 13 AND 24 THEN '13-24'
		WHEN tenure BETWEEN 25 AND 48 THEN '25-48'
		WHEN tenure >= 49 THEN '49+'
	END AS tenure_range, COUNT(*) AS total_customers,
	SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
	ROUND( SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS churn_rate_percent
FROM "Telco-Customer-Churn" GROUP BY tenure_range;
