SELECT c."Player ID", c.Date, b.Spins, b."Coin In", c.revenue
FROM table_cs AS c
LEFT JOIN table_bs AS b
ON c."Player ID" = b."Player ID"
AND c.Date = b.Date
GROUP BY c."Player ID", c.Date, b.Spins, b."Coin In", c.revenue;