--Retrieve the emp_no, first_name and last_name columns from the Employees table.
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) title,
emp_no,
first_name,
last_name
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

SELECT title, COUNT(title)
FROM unique_titles
GROUP BY title
ORDER BY (count) DESC;

SELECT emp_no, first_name, last_name, title
INTO retiring_titles
FROM unique_titles
GROUP BY emp_no, first_name, last_name, title 
ORDER BY title DESC;

SELECT DISTINCT ON (emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility 
FROM employees AS e
LEFT JOIN dept_emp AS de
ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti 
ON e.emp_no = ti.emp_no
WHERE de.to_date = ('9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

SELECT COUNT (*)
FROM employees

SELECT AVG(salary)
FROM salaries

SELECT MIN(salary)
FROM salaries

SELECT MAX(salary)
FROM salaries

