-- Q. Create a users table with a UNIQUE constrains on 
-- unsername

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50), 
    salary INT
    CONSTRAINT unique_username UNIQUE(username);
);

INSERT INTO users(username, salary)
VALUES ('yass', 10000), ('yass', 20000);