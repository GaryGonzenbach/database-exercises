USE employees;
-- 2  order by first_name
SELECT * FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya')
    ORDER BY first_name;
    
-- 3  order by first name,  then last name
SELECT * FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya')
    ORDER BY first_name, last_name;
    
-- 4   order by last name, then first name
SELECT * FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya')
    ORDER BY last_name, first_name;    
    
 
-- 5 last name starts with E   
SELECT * FROM employees
	WHERE 
    last_name LIKE 'E%'
    ORDER BY emp_no;
    
 -- 6 reverse the queries
SELECT * FROM employees
	WHERE 
    last_name LIKE 'E%'
    ORDER BY emp_no DESC;   
    
-- 7 all employees hired in the 90s AND born on Christmas    (oldest employee hired last)
SELECT * FROM employees
	WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31'  
    AND birth_date LIKE '%-12-25')
    ORDER BY hire_date DESC, birth_date DESC;
 
    