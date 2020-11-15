SELECT	species,
		admission_date,
		COUNT(*)
FROM	animals
GROUP BY	species,
			admission_date
HAVING COUNT(*) > 1;


SELECT	*
FROM	animals
WHERE	admission_date = '2017-08-29';


