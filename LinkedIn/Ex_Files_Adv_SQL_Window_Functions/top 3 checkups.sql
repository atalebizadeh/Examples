WITH animal_checkups
AS
(
SELECT 	s.species, 
		rc.name, -- For species with no checkups
		COUNT (checkup_time) AS number_of_checkups
FROM	reference.species AS s 
		LEFT OUTER JOIN 
		routine_checkups AS rc
		ON s.species = rc.species
GROUP BY 	s.species, 
			rc.name
)
, include_row_number_by_number_of_chekcups
AS 
(
SELECT 	*,
		ROW_NUMBER () 
		OVER (	PARTITION BY Species 
				ORDER BY 	number_of_checkups DESC, 
							name ASC
			 ) AS row_number
FROM	animal_checkups
)
-- SELECT * FROM include_row_number_by_number_of_chekcups ORDER BY species, number_of_checkups DESC;
SELECT 	species,
		name,
		number_of_checkups
FROM 	include_row_number_by_number_of_chekcups
WHERE 	row_number <= 3
ORDER BY 	species ASC, 
			number_of_checkups DESC;