SELECT 
	(CASE WHEN cd.phone_number = cr.incoming_number THEN 'incoming'
	ELSE 'outgoing' END) AS Call_Type,
	cd.name, cd.phone_number, 
	(CASE WHEN cd.phone_number = cr.incoming_number THEN SUM(cr.duration) 
	 ELSE (SUM(
	 CASE WHEN cr.duration <= 120 THEN 500
	 ELSE 500 + (cr.duration-120) *2 END))
	 END) AS call_units 
FROM customer_detail AS cd
JOIN call_record AS cr
ON cd.phone_number = cr.incoming_number
OR cd.phone_number = cr.outgoing_number
WHERE cr.dialed_on BETWEEN TO_DATE('20180901','YYYYMMDD')
AND TO_DATE('20180930','YYYYMMDD') 
GROUP BY cd.id, cd.phone_number, cr.duration
;