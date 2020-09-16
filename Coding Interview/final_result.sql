SELECT cd.name, cd.phone_number, SUM(cr.duration) AS call_units
FROM customer_detail AS cd
JOIN call_record AS cr
ON cd.phone_number = cr.incoming_number
WHERE cr.dialed_on BETWEEN TO_DATE('20180901','YYYYMMDD')
AND TO_DATE('20180930','YYYYMMDD') 
GROUP BY cd.id
UNION
SELECT 
	cd.name, cd.phone_number, 
	SUM(
	 CASE WHEN cr.duration <= 120 THEN 500
	 ELSE 500 + (cr.duration-120) *2 END) AS call_units 
FROM customer_detail AS cd
JOIN call_record AS cr
ON cd.phone_number = cr.outgoing_number
WHERE cr.dialed_on BETWEEN TO_DATE('20180901','YYYYMMDD')
AND TO_DATE('20180930','YYYYMMDD') 
GROUP BY cd.id
;