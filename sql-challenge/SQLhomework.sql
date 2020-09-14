-- 1.List the following details of each employee:
--employee number, last name, first name, sex, and salary.
SELECT 
e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information:
--department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, 
dept_manager.emp_no, 
employees.last_name, employees.first_name
	FROM departments JOIN dept_manager
	ON departments.dept_no = dept_manager.dept_no
	JOIN employees
	ON employees.emp_no = dept_manager.emp_no

-- 4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
on departments.dept_no = dept_emp.dept_no;

-- 5.List first name, last name, and sex
--for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees 
where (first_name = 'Hercules') AND (last_name LIKE 'B%');

-- 6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- 7.List all employees in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
JOIN departments
on departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e.,
--how many employees share each last name
SELECT last_name,(count( last_name)) AS share_name
FROM employees
GROUP BY last_name
ORDER BY share_name DESC LIMIT 10;
