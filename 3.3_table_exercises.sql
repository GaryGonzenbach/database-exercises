USE employees;
SHOW TABLES;
---  list of tables  departments, dept_emp, dept_manager, employees, salaries, titles
DESCRIBE employees;
SHOW CREATE TABLE employees;
--  int,  date,  varchar, 
-- The following tables contain numerics,   dept_emp,  dept_manager,  employees,  salaries,  titles
-- The following tables contain strings,    departments, dept_name,  dept_manager, employees, titles
-- The following tables contains dates,   dept_emp,  dept_manager, employees, salaries, titles
--  employees are related to departments via dept_emp table,  which contains both employee IDs (emp_no) and departments dept_no
SHOW CREATE TABLE dept_manager;  
