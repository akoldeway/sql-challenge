--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.employee_id as "Employee Number", last_name AS "Last Name", first_name AS "First Name",
	gender as "Gender", s.salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
	ON e.employee_id = s.employee_id;


--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE DATE_PART('year', hire_date) = 1986;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- Note: some departments have had multiple managers. These departments will be repeated for each manager.
/*
-- See if any departments have had multiple managers
select department_id, count(*)
FROM department_manager
GROUP BY department_id
HAVING COUNT(*) >1
*/

SELECT d.department_id AS "Department Number", d.department_name AS "Department Name",
	dm.employee_id AS "Manager Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",
	dm.from_date AS "Start Date", dm.to_date "End Date"
FROM departments AS d
INNER JOIN department_manager AS dm
	ON d.department_id = dm.department_id
INNER JOIN employees  AS e
	ON dm.employee_id = e.employee_id
ORDER BY dm.department_id, dm.from_date; 


--List the department of each employee with the following information: employee number, last name, first name, and department name.
-- NOTE: some employees have been in multiple departments. These employees will be repeated for each dept.

/*
-- See if any employees have been in multiple departments
select employee_id, count(*)
FROM department_employee
GROUP BY employee_id
HAVING COUNT(*) >1
*/

SELECT e.employee_id AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",
	d.department_name AS "Department Name"
FROM employees AS e
INNER JOIN department_employee de
	ON e.employee_id = de.employee_id
INNER JOIN departments d
	ON de.department_id = d.department_id;


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.employee_id AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",
	d.department_name AS "Department Name"
FROM employees e
INNER JOIN department_employee de
	ON e.employee_id = de.employee_id
INNER JOIN departments d
	ON de.department_id = d.department_id
WHERE d.department_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.employee_id AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name",
	d.department_name AS "Department Name"
FROM employees e
INNER JOIN department_employee de
	ON e.employee_id = de.employee_id
INNER JOIN departments d
	ON de.department_id = d.department_id
WHERE d.department_name IN('Sales', 'Development');


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(employee_id) AS "Employee Count"
FROM employees
GROUP BY last_name
ORDER BY COUNT(employee_id) DESC, last_Name;

-- Look for "my" employee id
SELECT *
FROM employees
WHERE employee_id = 499942;

