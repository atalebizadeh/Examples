SELECT customer_id
FROM loans
GROUP BY customer_id
HAVING count(*) > 1;