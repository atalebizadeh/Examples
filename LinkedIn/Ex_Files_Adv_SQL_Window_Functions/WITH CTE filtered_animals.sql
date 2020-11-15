/*
WITH filtered_animals AS
(	SELECT	*
 	FROM	animals
 	WHERE	species = 'Dog'
 	AND		admission_date > '2017-08-01')
SELECT	fa1.species, fa1.name,
		fa1.primary_color, fa1.admission_date,
		(	SELECT	COUNT(*)
			FROM	filtered_animals AS fa2
		 	WHERE	fa2.species = fa1.species
		 	AND		fa2.admission_date < fa1.admission_date
		) AS up_to_previous_day_species_animals
FROM	filtered_animals AS fa1
ORDER BY fa1.species, fa1.admission_date
*/



SELECT	species,
		name,
		primary_color,
		admission_date,
		COUNT(*) 
		OVER(	PARTITION BY	species
				ORDER BY		admission_date
				RANGE BETWEEN	UNBOUNDED PRECEDING
								AND
								'1 day'	PRECEDING
			) up_to_previous_day_species_animals
FROM	animals
WHERE	species = 'Dog'
AND		admission_date > '2017-08-01'
ORDER BY	species,
			admission_date
