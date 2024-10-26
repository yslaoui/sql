-- You start from an orders tables that has two colums customers and amounts
-- (Alice, 100)
-- (Bob, 200)
-- (Alice, 300)
-- (Bob, 400)

-- Q0 Create the table above

-- CREATE TABLE orders (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(50),
--     amount INT
-- );

-- INSERT INTO orders (name, amount) VALUES 
--         ('Alice', 100), 
--         ('Bob' , 200),
--         ('Alice' , 300),
--         ('Bob' , 400);
        

-- Q1. For each customer, show the total amount.  Do not consider orders 
-- where the amount is <= 100 when computing the total amount.

-- Expected OUTPUT
--  name  | total 
-- -------+-------
--  Alice |   300
--  Bob   |   600
-- (2 rows)


-- SELECT name, SUM(amount) AS total
-- FROM orders
-- WHERE amount > 100
-- GROUP BY name;



-- Q. For each customer, show the total amount.  
-- Remove customers for which the total amount is less than 100


-- Expected output

--  name  | total 
-- -------+-------
--  Alice |   400
--  Bob   |   600
-- (2 rows)



SELECT name, SUM(amount) AS total
FROM orders
GROUP BY name
HAVING SUM(amount) > 100;

















