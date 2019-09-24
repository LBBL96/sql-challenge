-- Query 1: List employee number, last name, first name, gender, and salary

SELECT Employees.emp_no, 
	Employees.last_name, 
	Employees.first_name, 
	Employees.gender,
	Salaries.salary
FROM public."Employees" as Employees
INNER JOIN public."Salaries" as Salaries
ON Salaries.emp_no = Employees.emp_no;

-- Query 2: List employees who were hired in 1986

SELECT * 
FROM public."Employees" as Employees
WHERE hire_date LIKE '1986%';

-- Query 3: List the manager of each dept with:
--  dept no, dept name, mgr employee no, last name, first name, start and end employment date

SELECT Mgr.dept_no,
	D.dept_name,
	Mgr.emp_no, 
	Emp.last_name, 
	Emp.first_name,
	DE.from_date,
	DE.to_date
FROM public."DeptManager" as Mgr
JOIN public."Employees" as Emp
ON Mgr.emp_no = Emp.emp_no
JOIN public."Departments" as D
ON Mgr.dept_no = D.dept_no
JOIN public."DeptEmployees" as DE
on Mgr.emp_no = DE.emp_no;

-- Query 4: List the department of each employee with: employee number, last name, first name, dept name

SELECT
	Emp.emp_no, 
	Emp.last_name, 
	Emp.first_name,
	D.dept_name
FROM public."Employees" as Emp 
JOIN public."DeptEmployees" as DE
ON Emp.emp_no = DE.emp_no
JOIN public."Departments" as D
ON DE.dept_no = D.dept_no;

-- Query 5: List all employees whose first name is Hercules and last name begins with B.

SELECT * 
FROM public."Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Query 6: List all employees in the sales dept, including their employee numbr, last name, first
-- name, and department name

SELECT 
	E.emp_no,
	E.last_name,
	E.first_name, 
	D.dept_name
FROM public."DeptEmployees" as DE
JOIN public."Employees" as E
ON E.emp_no = DE.emp_no
JOIN public."Departments" as D
ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

-- Query 7: List all employees in the sales and development departments, including their employee no.
-- last name, first name, and dept name

SELECT 
	E.emp_no,
	E.last_name,
	E.first_name, 
	D.dept_name
FROM public."DeptEmployees" as DE
JOIN public."Employees" as E
ON E.emp_no = DE.emp_no
JOIN public."Departments" as D
ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' or D.dept_name = 'Development';

-- Query 8: In descending order, list the frequency count of employee last names

SELECT last_name, COUNT(last_name)
FROM public."Employees"
GROUP BY last_name
ORDER BY last_name desc;