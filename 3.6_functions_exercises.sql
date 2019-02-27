USE employees;
-- 2 combine first and last names to full_name using CONCAT
SELECT CONCAT(first_name,' ',last_name) FROM employees
	AS full_name
	WHERE last_name LIKE 'E%e';
    
-- 3  concat first name and last name to full_name and make it uppercase
SELECT UPPER(CONCAT(first_name,' ',last_name)) FROM employees
	AS full_name
	WHERE last_name LIKE 'E%e';

-- 4     for all employees hired in the 90s AND born on Christmas  (oldest employee hired last)
-- find how many days they have been working at the company, add number of years and order by oldest tenure desc
-- Note:   cannot order by or datediff on aliases
SELECT
	first_name,
    last_name,
    hire_date,
	datediff(now(),hire_date) AS number_days_working, 
    (datediff(now(),hire_date))/365.25 AS number_years_working 
    FROM employees	   
	WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31'  
		AND birth_date LIKE '%-12-25')
    ORDER BY (datediff(now(),hire_date))/365.25 DESC
    LIMIT 10;
    
-- 5  find the largest and smallest salaries from the salaries table
SELECT MIN(salary), MAX(salary)
	from salaries;
     
-- 6 generate username from first_name, last_name, and birth_date 
SELECT 
    CONCAT(LOWER(LEFT(first_name, 1)),
            LOWER(LEFT(last_name, 4)),
            '_',
            MID(birth_date, 6, 2),
            MID(birth_date, 3, 2)) AS username,
    first_name,
    last_name,
    birth_date
FROM
    employees
LIMIT 10;  
   
   