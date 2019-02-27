USE employees;
-- Problem 1, Find all the employees with the same hire date as employee 101010 using a sub-query.
-- 69 Rows
SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date IN (			--  could also use WHERE hire_date = (......), because there is only one hire_date we are looking for
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010)
LIMIT 100;

-- Problem 2, Find all the titles held by all employees with the first name Aamod.
SELECT DISTINCT title FROM titles
WHERE emp_no IN (			-- in this case, there are multiple employees with the first name 'Aamod',  can't use = 'equal', will return more than one row 
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod')
LIMIT 100;

-- Problem 3, How many people in the employees table are no longer working for the company
SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE emp_no NOT IN (
    SELECT emp_no
    FROM salaries
    WHERE to_date > NOW()); 
    
-- Problem 4,  Find all the current department managers that are female.
SELECT 
    emp_no, first_name, last_name, gender
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            to_date > NOW())
        AND gender = 'F'; 


-- Problem 5,  Find all the employees that currently have a 
--    higher than average salary
SELECT employees.first_name, employees.last_name, salaries.salary
FROM
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no    
WHERE
		salaries.salary > 
			(SELECT AVG(salaries.salary) FROM salaries)
	    AND to_date > NOW()     
   ;

-- Problem 6,  current salaries are within 1 standard deviation of the highest salary? 

SELECT employees.first_name, employees.last_name, salaries.salary
FROM
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no    
WHERE
		salaries.salary > 
			(SELECT MAX(salaries.salary) FROM salaries) - (SELECT STDDEV(salaries.salary) FROM salaries)
	--		(SELECT MAX(salaries.salary) - STDDEV(salaries.salary) FROM salaries)
			AND to_date > NOW()     
   ;
   
--  ------------------------------------------	
--   just miscellaneous data validation to make sure no typos on employee to_dates  
   SELECT * FROM dept_manager
		WHERE to_date > NOW()
		AND to_date != '9999-01-01';
        
        
--   Bonus

-- Find all the department names that currently have female managers

SELECT dept_name
	FROM departments
    WHERE dept_no IN (
		SELECT dept_no
        FROM dept_manager
        WHERE emp_no IN (
			SELECT emp_no
            FROM employees
            WHERE gender = 'F'
            AND to_date > NOW()
		)	)
	;

--  Find first and last name of employee with the highest salary

SELECT first_name, last_name
FROM employees
WHERE emp_no = (
	SELECT emp_no
    FROM salaries
    ORDER BY salary DESC
    LIMIT 1
    )
;

-- Find the department name that the employee with the highes salary works in.

SELECT dept_name
FROM departments
WHERE dept_no = (
	SELECT dept_no
	FROM dept_no
		WHERE emp_no = (
		SELECT emp_no
        FROM employees
		WHERE emp_no = (
			SELECT emp_no
            FROM salaries
            ORDER BY salary DESC
            LIMIT 1
	)	)	)
;	
    
        