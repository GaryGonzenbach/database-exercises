USE employees;
-- 2
SELECT * FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya');
    
-- 3 last name starts with E   
SELECT * FROM employees
	WHERE 
    last_name LIKE 'E%';
    
-- 4 employees hired in the 90s
SELECT * FROM employees
	WHERE hire_date LIKE '199%'; 
    
-- 5  born on Christmas
SELECT * FROM employees
	WHERE birth_date LIKE '%-12-25'; 

--  with a q in the last name    
 SELECT * FROM employees
	WHERE 
    last_name LIKE '%q%';       
   
-- 2.1  find first name using OR
SELECT * FROM employees
	WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya');
    
--  2.2 combine first name list with gender  
SELECT * FROM employees
	WHERE (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
    AND gender = 'M';
    
-- 2.3  last name starts with OR ends with e   
SELECT * FROM employees
	WHERE 
    last_name LIKE 'E%'
    OR last_name LIKE '%e';     
    
-- 2.4  last name starts AND ends with e   
SELECT * FROM employees
	WHERE 
    last_name LIKE 'E%e';
   
-- 2.5 all employees hired in the 90s AND born on Christmas    (explicit date range is easier to read for hire date)
SELECT * FROM employees
	WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'  
    AND birth_date LIKE '%-12-25';
 

    -- 2.6 all employees with q in their last name, but not qu
SELECT * FROM employees
	WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%';
    