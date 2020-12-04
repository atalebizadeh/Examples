INSERT INTO
	Table1 ("2", "3")
VALUES
	(10, 'a'),
	(15, 'b'),
	(12, 'c'),
	(13, 'd'),
	(15, '');
	
SELECT * FROM Table1;


INSERT INTO
	Table2 ("2", "3")
VALUES
	(10, 'a'),
	(15, ''),
	(12, 'g'),
	(13, 'd'),
	(15, 'e'),
	(16, 'f');
	
SELECT * FROM Table2;
