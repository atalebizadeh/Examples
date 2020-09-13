WITH 
total_may_second AS( 
	SELECT SUM("total bet") AS sum_may_second
	FROM table_as
	WHERE date = '2020-05-02'),
total_may AS (
	SELECT SUM("total bet") AS sum_may
	FROM table_as
	WHERE EXTRACT(MONTH FROM date) = 5)
	
SELECT ROUND(CAST(total_may_second.sum_may_second AS DEC(12,2)) / CAST(total_may.sum_may AS DEC(12,2)) * 100, 2) AS "% total bet in May second"
FROM total_may_second, total_may;