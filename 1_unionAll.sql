-- Create two employee tables. 
-- Both tables have the same columns id and name 
-- print the colum name with all distinct values of the two tables
-- print the column name with all non distinct values

-- Q. Create the table above

CREATE TABLE employees1 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employees2 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);



INSERT INTO employees1 (name) VALUES ('Alice'), ('Bob');
INSERT INTO employees2 (name) VALUES ('Alice'), ('Ralph');


-- Q. Creqte the table above

-- UNION removes duplicates
SELECT name FROM employees1
UNION
SELECT name FROM employees2;

-- Expetced output: 3 rows ALice, bob, ralph

-- UNION ALL does not remove duplicates
SELECT name FROM employees1
UNION ALL 
SELECT name FROM employees2;

-- Expected output: 4 rows ALice, bob, ALice, ralph