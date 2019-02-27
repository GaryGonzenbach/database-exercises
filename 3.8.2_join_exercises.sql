USE join_example_db;
-- 1  Select all the records from both the users and roles tables
SELECT * FROM roles JOIN users ON users.role_id = roles.id;
SELECT * FROM roles LEFT JOIN users ON users.role_id = roles.id;
SELECT * FROM roles RIGHT JOIN users ON users.role_id = roles.id;

-- 3  Select all the records from both the users and roles tables
SELECT roles.name, roles.id, users.role_id , COUNT(users.role_id)
FROM roles 
LEFT JOIN users 
	ON roles.id = users.role_id  
	GROUP BY roles.name, roles.id, users.role_id;
    
    
--  Problem 2, show each department along with the name of the current manager for that department
USE employees;
-- SELECT employees.emp_no, employees.first_name, employees.last_name, dept_manager.emp_no, dept_manager.dept_no,
-- 	dept_manager.from_date, dept_manager.to_date, departments.dept_name
SELECT departments.dept_name, employees.first_name, employees.last_name 
	FROM employees
    JOIN dept_manager
		ON employees.emp_no = dept_manager.emp_no
    JOIN departments
		ON dept_manager.dept_no = departments.dept_no
    WHERE dept_manager.to_date LIKE '9999-%'       --   could also use      "to_date > NOW()"
    ORDER BY departments.dept_name;
--	LIMIT 50;

-- Problem 3 Find the name of all departments currently managed by women	
SELECT departments.dept_name, employees.first_name, employees.last_name, employees.gender 
	FROM employees
    JOIN dept_manager
		ON employees.emp_no = dept_manager.emp_no
    JOIN departments
		ON dept_manager.dept_no = departments.dept_no
    WHERE dept_manager.to_date LIKE '9999-%' AND employees.gender = 'F'      --   could also use      "to_date > NOW() instead of LIKE 9999-%"
    ORDER BY departments.dept_name;
--	LIMIT 50;
    
 --  Problem 4, Find the current titles of employees currently working in the Customer Service department.
 SELECT departments.dept_name, titles.title, employees.first_name, employees.last_name
	FROM employees
    JOIN titles
		ON employees.emp_no = titles.emp_no
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
    JOIN departments
        ON departments.dept_no = dept_emp.dept_no
    WHERE departments.dept_name LIKE 'Customer Service' AND dept_emp.to_date LIKE '9999-%' AND titles.to_date > NOW();      
  --  LIMIT 50;
    
 -- Problem 5, Find the current salary of all current managers.
 SELECT departments.dept_name, employees.first_name, employees.last_name, salaries.salary, dept_manager.from_date, dept_manager.to_date 
	FROM employees
    JOIN dept_manager
		ON employees.emp_no = dept_manager.emp_no
    JOIN departments
		ON dept_manager.dept_no = departments.dept_no
    JOIN salaries
		ON salaries.emp_no = employees.emp_no
    WHERE dept_manager.to_date LIKE '9999-%' AND salaries.to_date LIKE '9999-%'    
    ORDER BY departments.dept_name;
--	LIMIT 50;

-- Problem 6,   Find the number of employees in each department.
SELECT departments.dept_name, COUNT(*)
	FROM employees
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
    JOIN departments
		ON dept_emp.dept_no = departments.dept_no
    WHERE dept_emp.to_date LIKE '9999-%' 
    GROUP BY departments.dept_name
    ORDER BY departments.dept_name;
 --	LIMIT 50;
    
-- Problem 7,  Which department has the highest average salary?
-- come back to this and see if count can be added 
SELECT departments.dept_name, AVG(salaries.salary)    -- , COUNT(*)
	AS Ave_Salary		
	FROM departments
    JOIN dept_emp
		ON departments.dept_no = dept_emp.dept_no
    JOIN employees
		ON dept_emp.emp_no = employees.emp_no
    JOIN salaries
		ON salaries.emp_no = employees.emp_no
    WHERE dept_emp.to_date LIKE '9999-%' AND salaries.to_date LIKE '9999-%'    
    GROUP BY departments.dept_name
    ORDER BY AVE_Salary DESC
	LIMIT 1;
    
    -- Problem 8, Who is the highest paid employee in the Marketing department?
SELECT employees.first_name, employees.Last_name, salaries.salary   -- , AVG(salaries.salary)    -- , COUNT(*)
	AS Max_Salary_Emp		
	FROM employees
    JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
    JOIN departments
		ON dept_emp.dept_no = departments.dept_no
    JOIN salaries
		ON salaries.emp_no = employees.emp_no
    WHERE dept_emp.to_date like '9999-%' AND salaries.to_date like '9999-%' AND departments.dept_name LIKE 'Marketing'   
    ORDER BY Max_Salary_Emp DESC
	LIMIT 1;
    
   -- Problem 9,  Which current department manager has the highest salary?
SELECT departments.dept_name, employees.first_name, employees.last_name, salaries.salary 
    AS Manager_Salaries
	FROM employees
    JOIN dept_manager
		ON employees.emp_no = dept_manager.emp_no
    JOIN departments
		ON dept_manager.dept_no = departments.dept_no
    JOIN salaries
		ON employees.emp_no = salaries.emp_no
    WHERE dept_manager.to_date LIKE '9999-%' AND salaries.to_date LIKE '9999-%'    
    ORDER BY Manager_Salaries DESC
	LIMIT 1;
    
-- Problem 10,  Bonus Find the names of all current employees, their department name, and their current manager's name.
SELECT 
	CONCAT(e.first_name,' ',e.last_name) AS 'Employee Name',
		d.dept_name as 'Department Name'
    CONCAT(m.first_name,' ',m.last_name) AS 'Manager Name',
	FROM EMPLOYEES e
	JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
    JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN employees m ON dm.emp_no = m.emp_no	-- this is necessary beacuse we have to pull out the names of the managers
    WHERE de.to_date > NOW() AND dm.to_date > NOW()
    
	LIMIT 100;

