SELECT SUM(spins) AS Total_iOS_Spins
FROM table_as
WHERE EXTRACT(MONTH FROM date) = 5
AND platform = 'ios';