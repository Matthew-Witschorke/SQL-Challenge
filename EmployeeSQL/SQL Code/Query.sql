--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT
	employees.emp_no, last_name, first_name, sex, salaries.salary, employees.last_updated
FROM
	employees
JOIN 
	salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	first_name, last_name, hire_date, employees.last_updated
FROM
	employees
WHERE
	(hire_date >= '1986-01-01') AND (hire_date <= '1986-12-31')
ORDER BY
	hire_date;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.last_updated
FROM 
	dept_manager
JOIN
	departments on departments.dept_no = dept_manager.dept_no
JOIN
	employees on employees.emp_no = dept_manager.emp_no
ORDER BY
	dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT 
	employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, employees.last_updated
FROM 
	employees
JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
ORDER BY 
	emp_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	first_name, last_name, sex, employees.last_updated
FROM 
	employees
WHERE 
	first_name = 'Hercules' and last_name LIKE 'B%'
ORDER BY
	last_name;

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, employees.last_updated
FROM
	employees
JOIN
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_no = 'd007'
ORDER BY
	emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
	employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, employees.last_updated
FROM 
	employees
JOIN 
	dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN 
	departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	departments.dept_no = 'd005' OR departments.dept_no = 'd007'
ORDER BY 
	emp_no

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	last_name, COUNT(last_name) AS "Last Name Frequency", employees.last_updated 
FROM 
	employees
GROUP BY 
	last_name, employees.last_updated
ORDER BY 
	"Last Name Frequency" DESC;