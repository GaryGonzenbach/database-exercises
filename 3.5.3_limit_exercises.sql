USE employees;
-- 2  order by last_name
SELECT DISTINCT last_name FROM employess
	Order By last_name DESC
    Limit 10;
    
--  all employees hired in the 90s AND born on Christmas    (oldest employee hired last)
SELECT * FROM employees
	WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31'  
    AND birth_date LIKE '%-12-25')
    ORDER BY birth_date, hire_date DESC
    LIMIT 5;
 
  SELECT * FROM employees
	WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31'  
    AND birth_date LIKE '%-12-25')
    ORDER BY birth_date, hire_date DESC
    LIMIT 5 OFFSET 45;  
   
   --   page number equals  (offset / limit ) plus one
   --   offset equals  (page number minus one) times limit
    