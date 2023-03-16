-- Question 1: Create a Stored Procedure that will insert a new film into the film table with the
-- following arguments: title, description, release_year, language_id, rental_duration,
-- rental_rate, length, replace_cost, rating

SELECT *
FROM film;

CREATE OR REPLACE PROCEDURE add_film(
	title VARCHAR, 
	description VARCHAR, 
	release_year INTEGER, 
	language_id INTEGER, 
	rental_duration INTEGER, 
	rental_rate NUMERIC(4,2), 
	length INTEGER, 
	replacement_cost NUMERIC(5,2), 
	rating mpaa_rating
)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(
	title, 
	description, 
	release_year, 
	language_id,
	rental_duration, 
	rental_rate, 
	length, 
	replacement_cost, 
	rating )
	VALUES(
	title, 
	description, 
	release_year, 
	language_id,
	rental_duration, 
	rental_rate, 
	length, 
	replacement_cost, 
	rating);
END;
$$;

CALL add_film(
	'The Raving Pajamas', 
	'These raving pajamas just have got to be stopped', 
	1998, 
	1,
	6, 
	4.99, 
	220, 
	4.99, 
	'R'
);

-- Question 2: Create a Stored Function that will take in a category_id and return the number of
-- films in that category

--CREATE OR REPLACE FUNCTION get_actor_count(letter VARCHAR(1)) 
--RETURNS INTEGER 
--LANGUAGE plpgsql 
--AS $$ 
--	DECLARE actor_count INTEGER;
--BEGIN 
--	SELECT COUNT(*) INTO actor_count 
--	FROM actor 
--	WHERE last_name LIKE CONCAT(letter, '%');
--	RETURN actor_count;
--END;
--$$;

SELECT *
FROM category;

SELECT*
FROM film_category

-- USING JOINS we can combine these tables together on a common field
-- SELECT column1, column2, etc. (can be from either table)
-- FROM table_name_1 (will be considered the LEFT table)
-- JOIN table_name_2 (will be considered the RIGHT table)
-- ON table_name_1.col_name = table_name_2.col_name (where col_name is a foreign key to other col_name)


--CREATE TABLE order_product(
--	order_id INTEGER NOT NULL, 
--	FOREIGN KEY(order_id) REFERENCES "order"(order_id),
--	product_id integer NOT NULL 

CREATE TABLE film_and_category 
category_id INTEGER NOT NULL, 
FOREIGN KEY (category_id) REFERENCES film_category 
category VARCHAR 
FOREIGN KEY (category) REFERENCES film_list


SELECT category, category_id 
FROM film_list 
JOIN film_category 
ON film_list.category = film_category.category_id 
GROUP BY category, COUNT(*)


CREATE OR REPLACE FUNCTION films_in_category(category_id INTEGER)
RETURNS INTEGER 
LANGUAGE plpgsql
AS $$
	DECLARE in_category INTEGER;
BEGIN
	SELECT category
	FROM film_list 
	GROUP BY category
	ORDER BY COUNT(*);
	RETURN in_category;
END;
$$;

SELECT films_in_category(8);

