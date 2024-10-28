-- Q. how do you find duplicate roles in a table 
-- Q. Create a simple one column table of names with duplicates
CREATE TABLE names(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO names (name) 
    VALUES ('alice'),('bob'),('alice'),('bob'),('mike'),('anaelle'),('anaelle');

"id"	"name"
1	"alice"
2	"bob"
3	"alice"
4	"bob"
5	"mike"
6	"anaelle"
7	"anaelle"

-- Q. Produce a table with name and count

-- Remember that when the columns in the SELECT have one aggregated and one
-- non aggregated you must group by non aggregated

SELECT name, COUNT(*) FROM names
GROUP BY name;

"name"	"count"
"bob"	2
"anaelle"	2
"mike"	1
"alice"	2

-- Q. now show duplicate rows onlys

-- The key here is that you are filtering after aggregation so you should  use having 
SELECT name, COUNT(*) FROM names
GROUP By name
HAVING COUNT(*) > 1;

-- Q. Now let's tryto solve the same problem but with multiple columns.

CREATE TABLE employee_duplicates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employee_duplicates (name, salary)
   VALUES ('alice',3000),('bob', 2000),('alice', 5000),('bob', 2000),('alice', 3000),('bob', 5000);
