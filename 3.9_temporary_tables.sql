USE ada_673;
-- Exercize 1
CREATE TEMPORARY TABLE employees_with_departments AS
	SELECT emp_no, first_name, last_name, dept_no, dept_name
	FROM employees.employees
	JOIN employees.dept_emp USING(emp_no)
	JOIN employees.departments USING(dept_no)
	LIMIT 100;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

UPDATE employees_with_departments
	SET full_name = CONCAT(first_name,' ', last_name);

ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

-- Exercize 2
CREATE TEMPORARY TABLE ada_673.my_payments AS
	SELECT * FROM sakila.payment
	LIMIT 100;
    
ALTER TABLE ada_673.my_payments ADD payments_pennies int;

UPDATE ada_673.my_payments
	SET payments_pennies = amount * 100;
    
-- Exercize 3,  Find out how the average pay in each department compares to the overall average pay. In order to make the comparison easier, 
-- you should use the Z-score for salaries. In terms of salary, what is the best department to work for? The worst?
--     Z =  (x - mean) / stddev,    Calculate Z for each employee, then average all the employee Zs in a department to make the comparison 
--      between departments
-- 	x = employee salary, ,mean is mean of all salaries of all departments, and stddev is all salaries for all departments

USE ada_673; 
--   first,   calculate the average current salary and the average standard deviation from ALL the employees in ALL the departments
--        and store it in a temporary table

CREATE TEMPORARY TABLE ada_673.agg
	SELECT AVG(salary) AS Ave_salary, STDDEV(salary) AS Stddev_salary
		FROM employees.salaries
		WHERE to_date > NOW();  
        
--    SELECT * FROM agg;
        
--  by inspection of the result,   a sanity check shows Ave salary = 72,012  salary Stddev = 17,310   
-- second, gather all the salaries, and add average and stddev to each record, and calculate the z-score
CREATE TEMPORARY TABLE ada_673.Z_salary
SELECT salaries.emp_no AS emp_no, salaries.salary AS Emp_salary, Ave_salary, StdDev_salary, Emp_Zscore 
	FROM employees.salary
		WHERE to_date > NOW() 
	JOIN
		aggregate 
--   resume here,   have not finished this temp table construction	     	
-- third, join the departments and average the Z score within each department




--  Exercize 4, What is the average salary for an employee based on the number of years they have been with the company? 
--   Express your answer in terms of the Z-score of salary.


