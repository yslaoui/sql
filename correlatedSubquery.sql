--  * Q. Create twp tables employee and department.
--         - employee table has columns name, salary and department_id foreign key
--         - department table has column department_name
--         - refre to google doc file to see that table


CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    department VARCHAR(50)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    CONSTRAINT fx_department FOREIGN KEY (department_id)
    REFERENCES departments (id)
    ON DELETE CASCADE
);

INSERT INTO departments (department)
VALUES ('HR'), ('Engineering'), ('Sales');

INSERT INTO employees (name,department_id, salary)
VALUES ('Alice', 1, 5000), ('Bob', 1, 6000), ('Charlie', 2, 7000),
       ('David', 2, 8000),('Eva', 3, 5500); 



-- * Q.Fetch the employees who earn more than the overall average salary
--  across all departments. WHich type of query will you use ?

SELECT * 
FROM employees 
WHERE salary > (
    6000
    );

SELECT AVG(salary) FROM employees;

SELECT * 
FROM employees 
WHERE salary > (
    SELECT AVG(salary) FROM employees
    );

-- Q. fetch the employees who earn more than the average salary of their own department.
--  WHat type of query do you use ?

-- end result employee, average salary of the employee's deartment
-- First produce the average salary of each department AS average_salary_per_department
-- then I left join employee and average_salary_per_department
-- finally I filter foe employees whose salary is > average salary of department

--  FIrst  produce the evarge salary of each department Average salary of each department
SELECT d.id, AVG(e.salary)
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.id
GROUP BY d.id;

-- then I left join employee and average_salary_per_department
SELECT * FROM employees AS e
LEFT JOIN (
    SELECT d.id, AVG(e.salary)
    FROM departments AS d
    LEFT JOIN employees AS e
    ON e.department_id = d.id
    GROUP BY d.id
) AS a
ON a.id = e.department_id;


-- TODO
-- Finally I filter #todo


--  Then I find the average  salary of a specific department
SELECT  AVG(e.salary)
FROM departments AS d
LEFT JOIN employees AS e
ON e.department_id = d.id
WHERE d.id = 3;

-- Then for each employee I find his departemmnt

SELECT e.employee





