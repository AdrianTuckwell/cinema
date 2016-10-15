---------------------------------------------
-- create the DB and run this sql file
-- > createdb cinema
-- > psql -d cinema -f cinema.sql
---------------------------------------------

DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE tickets (
  id serial4 PRIMARY KEY,
  customer_id int4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id int4 REFERENCES films(id) ON DELETE CASCADE
);