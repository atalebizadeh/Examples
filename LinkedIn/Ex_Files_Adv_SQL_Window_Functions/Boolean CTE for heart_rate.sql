SELECT	species, name, checkup_time, heart_rate,
		CAST(	AVG(heart_rate)
			 	OVER(PARTITION BY species)
			 	AS DECIMAL (5, 2)
			 )AS species_average_hear_rate
FROM	routine_checkups
ORDER BY	species, checkup_time;





WITH species_average_heart_rates AS
(SELECT	species, name, checkup_time, heart_rate,
		CAST(	AVG(heart_rate)
			 	OVER(PARTITION BY species)
			 	AS DECIMAL (5, 2)
			 )AS species_average_heart_rate
 FROM routine_checkups)
SELECT species, name, checkup_time, heart_rate,
		EVERY (heart_rate >= species_average_heart_rate)
		OVER (PARTITION BY species, name)AS consistently_at_or_above_average
FROM	species_average_heart_rates
ORDER BY	species, checkup_time;



SELECT 	species, name, checkup_time, heart_rate,
		CAST(AVG(heart_rate) OVER (PARTITION BY species) AS DECIMAL (5, 2))
FROM routine_checkups;


SELECT CAST(AVG(heart_rate) AS DECIMAL (5, 2))
FROM routine_checkups
WHERE species = 'Cat';

SELECT SUM(heart_rate) / COUNT(heart_rate)
FROM routine_checkups
WHERE species = 'Cat';