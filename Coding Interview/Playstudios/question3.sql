SELECT "Player ID", MIN(Date) AS "First Date"
FROM table_bs
GROUP BY "Player ID";