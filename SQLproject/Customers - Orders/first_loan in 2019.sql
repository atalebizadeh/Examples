SELECT customer_id, MIN(loan_id) as first_loan
FROM loans
WHERE EXTRACT(YEAR FROM created_at) = '2019'
GROUP BY customer_id;