Use employees;

-- 2 find the unique titles in the titles table
SELECT DISTINCT title FROM titles;

-- or SELECT title FROM tiles GROUP BY title;

-- 3  unique last name starting AND ending with e using GROUP BY   
SELECT last_name
	FROM employees
    WHERE last_name LIKE 'E%e'
	GROUP BY last_name;
    
-- just for compare to 3    
SELECT DISTINCT last_name
	FROM employees
    WHERE last_name LIKE 'E%e';    
    
 -- 4 find unique combinations first and last name where the last name starts and ends with 'E'. 846 rows      
   
SELECT CONCAT(first_name,' ',last_name)
	FROM employees
    WHERE last_name LIKE 'E%e'
	GROUP BY CONCAT(first_name,' ',last_name);
    
-- 5  unique last names with 'q' but not 'qu'
SELECT last_name FROM employees
	WHERE last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%'
    GROUP BY last_name;
    
-- 6 Which (across all employees) name is the most common, the least common? Find this for both first name, last name, and the combination of the two.
--  most common combination of first and last name,   Rosalyn Baalen
USE employees;
SELECT CONCAT(first_name,' ', last_name), COUNT(*)
	FROM employees
    GROUP BY CONCAT(first_name,' ',last_name)
    ORDER BY COUNT(*) DESC; 
     -- LIMIT 100;
 
--  most common first name,   Shabab
SELECT first_name, COUNT(*)
	FROM employees
    GROUP BY first_name
    ORDER BY COUNT(*) DESC;
    
--  most common last name,   Baba
SELECT last_name, COUNT(*)
	FROM employees
    GROUP BY last_name
    ORDER BY COUNT(*) DESC;
    
  -- 7 Update your query for 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names. 
SELECT gender, COUNT(*) 
	FROM employees
	WHERE first_name IN ('Irena','Vidya','Maya')
    GROUP BY gender;
    
--  Recall the query the generated usernames for the employees from the last lesson. Are there any duplicate usernames?
-- Bonus: how many duplicate usernames are there?
--   Yes ,  there are duplicated user names. (which I could only get totals by exporting the table to Excel and summing)   
SELECT 
    DISTINCT CONCAT(LOWER(LEFT(first_name, 1)),
            LOWER(LEFT(last_name, 4)),
            '_',
            MID(birth_date, 6, 2),
            MID(birth_date, 3, 2)) AS username
    , COUNT(*)        
    FROM employees 
    GROUP BY username
    ORDER BY COUNT(*) DESC;
   
    
    
	
   