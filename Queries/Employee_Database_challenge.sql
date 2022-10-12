
--Creating a new table by joining employees and titles
--Filtering by birth_date and sorting by employee number
SELECT ep.emp_no,
ep.first_name,
ep.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as ep
LEFT JOIN titles as t
ON ep.emp_no = t.emp_no
WHERE ep.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ep.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

--Creating a new table with total number of titles for each department
SELECT COUNT(title) as number_of_titles,
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY number_of_titles DESC;


--Create a mentorship-eligibility table that holds the current employees born between 1965-01-01 and 1965-12-31.
SELECT DISTINCT ON (ep.emp_no) ep.emp_no,
ep.first_name,
ep.last_name,
ep.birth_date,
de.from_date,
de.to_date,
t.title
--Join employees, department employees and titles table
INTO Mentorship_Eligibility
FROM employees as ep
LEFT JOIN dept_emp as de
ON de.emp_no = ep.emp_no
LEFT JOIN titles as t
ON ep.emp_no = t.emp_no
--filter by current employees and their birth date
WHERE (de.to_date = '9999-01-01') AND
	   (ep.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY ep.emp_no; 