SELECT cd.name, cd.phone_number, SUM(cr.duration) AS call_units
FROM customer_detail AS cd
JOIN call_record AS cr
ON cd.phone_number = cr.incoming_number
WHERE cr.dialed_on BETWEEN TO_DATE('20180501','YYYYMMDD')
AND TO_DATE('20180530','YYYYMMDD') 
GROUP BY cd.id
;