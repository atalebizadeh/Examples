SELECT	EXTRACT(YEAR FROM adoption_date) AS year,
		EXTRACT(MONTH FROM adoption_date) AS month,
		SUM(adoption_fee) AS month_total,
		CAST(100 * SUM(adoption_fee) / SUM(SUM(adoption_fee))
		OVER(PARTITION BY EXTRACT(YEAR FROM adoption_date)) AS DECIMAL(5, 2)
		)AS annual_percent
FROM	adoptions
GROUP BY	EXTRACT(YEAR FROM adoption_date),
			EXTRACT(MONTH FROM adoption_date)
ORDER BY	year, month;




WITH monthly_grouped_adoptions AS
(	SELECT	EXTRACT(YEAR FROM adoption_date) AS year,
			EXTRACT(MONTH FROM adoption_date) AS month,
			SUM(adoption_fee) AS month_total
	FROM 	adoptions
	GROUP BY	EXTRACT(YEAR FROM adoption_date),
				EXTRACT(MONTH FROM adoption_date))
SELECT	*,
		CAST(100 * month_total / SUM(month_total)
		OVER(PARTITION BY year) AS DECIMAL(5, 2)
		)AS annual_percent
FROM 	monthly_grouped_adoptions
ORDER BY year, month;