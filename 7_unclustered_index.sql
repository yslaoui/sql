-- Q. Create an index on the employees table

CREATE INDEX idx_salary ON employees(salary);
SELECT * FROM pg_index;

-- Q. Verify that the index was
-- All you need to remember here is the table pg_indexes. 
-- You can inspect it for what you want from it 

SELECT * FROM pg_indexes;

SELECT indexname, tablename FROM pg_indexes WHERE tablename='employees';