SELECT DISTINCT(sub."First Date"), sub."Player ID"
FROM(
SELECT "Player ID",
FIRST_VALUE(Date) OVER(PARTITION BY "Player ID") AS "First Date"
FROM table_bs
GROUP BY "Player ID", Date) AS sub
ORDER BY sub."First Date";


