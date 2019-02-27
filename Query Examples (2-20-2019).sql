SELECT * FROM albums_db.albums;
SELECT * FROM albums_db.albums WHERE name LIKE '%Pepper%';

-- Using LIKE
USE fruits_db;
SELECT * FROM fruits
	WHERE name LIKE '_pp%';
SELECT * FROM fruits
	WHERE name IN ('banana','dragonfruit','apple');
    
--    using BETWEEN
SELECT * FROM fruits
	WHERE id BETWEEN 1 and 3;
    
--      combining IN with and OR statement   
SELECT * FROM fruits
	WHERE name IN ('banana','dragonfruit','apple')
    OR id = 5;
--     combining IN with AND
SELECT * FROM fruits
	WHERE name IN ('banana','dragonfruit','apple')
    AND id = 5;
--  returns nothing,   it's the intersection where both criteria are true

--     using parenthesis.   just do this,  better coding practices
SELECT * FROM fruits
	WHERE (name IN ('banana','dragonfruit','apple') AND id = 5)
    OR quantity > 1;
--  




    