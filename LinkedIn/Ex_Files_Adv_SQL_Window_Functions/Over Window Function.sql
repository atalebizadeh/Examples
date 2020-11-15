SELECT	a1.species, a1.name,
		a1.primary_color, a1.admission_date,
		(	SELECT	COUNT(*)
			FROM	animals AS a2
		 	WHERE	a2.species = a1.species
		) AS number_of_species_animals
FROM animals AS a1
ORDER BY a1.species, a1.admission_date


/*
SELECT	species,
		name,
		primary_color,
		admission_date,
		COUNT(*) OVER(PARTITION BY species) AS number_of_species_animals
FROM	animals
ORDER BY	species,
			admission_date
			
*/	
			
			
			
