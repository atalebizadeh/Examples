SELECT c."Player ID", c.Date, b.Spins, b."Coin In", c.revenue, d.country
FROM table_cs AS c
LEFT JOIN table_bs AS b
ON c."Player ID" = b."Player ID"
AND c.Date = b.Date
LEFT JOIN table_ds AS d
ON c."Player ID" = d."Player ID"
GROUP BY c."Player ID", c.Date, b.Spins, b."Coin In", c.revenue, d.country;