-- 1. List the employee number, last name, first name, sex, and salary of each employee
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from sql_challenge.employees as e
inner join sql_challenge.salaries as s on
s.emp_no=e.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select e.first_name, e.last_name, e.hire_date
from sql_challenge.employees as e
where EXTRACT(YEAR FROM e.hire_date) = 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name 
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM sql_challenge.employees AS e
JOIN sql_challenge.dept_manager AS dm ON e.emp_no = dm.emp_no
JOIN sql_challenge."Departments" AS d ON dm.dept_no = d.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
from sql_challenge.employees as e
join sql_challenge.dept_emp as de on de.emp_no = e.emp_no
join sql_challenge."Departments" as d on d.dept_no = de.dept_no
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select e.first_name, e.last_name, e.sex
from sql_challenge.employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'
;

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
select e.emp_no, e.last_name, e.first_name
from sql_challenge.employees as e
where e.emp_no in
(
	select de.emp_no
	from sql_challenge.dept_emp as de
	where de.dept_no in
	(
		select d.dept_no
		from sql_challenge."Departments" as d
		where d.dept_name = 'Sales'
	)
);

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from sql_challenge.employees as e
join sql_challenge.dept_emp as de on e.emp_no = de.emp_no
join sql_challenge."Departments" as d on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select e.last_name, COUNT(e.last_name) as "last counter"
from sql_challenge.employees as e
group by e.last_name
order by "last counter" DESC;