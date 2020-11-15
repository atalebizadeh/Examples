DROP TABLE IF EXISTS loans;
CREATE TABLE loans(
	customer_id int,
	loan_id int,
    loan_amount decimal,
    balance decimal,
	created_at DATE NOT NULL
);
INSERT INTO loans (customer_id, loan_id, loan_amount, balance, created_at)
VALUES 
	(100, 1000, 50000.00, 38500.00, '20190101'),
	(101, 1500, 25000.00, 15000.00, '20190201'),
	(101, 2000, 10000.00, 7000.00, '20190301'),
	(102, 2500, 100000.00, 90000.00, '20190501');