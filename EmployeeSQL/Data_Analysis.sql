--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, to_char(s.salary, 'L999,999') "Salary"
from employees e
join salaries s on e.emp_no = s.emp_no;

--2. List employees who were hired in 1987.
select e.emp_no, e.last_name, e.first_name, de.from_date  
from employees e
join dept_emp de on e.emp_no = de.emp_no
where de.from_date > '12/31/1986'
and de.from_date < '1/1/1988';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from departments d
join dept_manager dm on d.dept_no = dm.dept_no
join employees e on dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name--, de.from_date, de.to_date
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no;

--5. List all employees whose first name is "Duangkaew" and last names begin with "P."
select *
from employees
where first_name = 'Duangkaew'
and last_name like 'P%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development';

--8. In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*) "Same Last Name Count"
from employees
group by last_name
order by "Same Last Name Count";
