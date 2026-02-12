/*
Ejercicio 2. Base de Datos Sakila
Para este ejercicio utilizaremos la bases de datos de Sakila. Es una base de datos de ejemplo que simula
una tienda de alquiler de películas. Contiene tablas como film (películas), actor (actores), customer
(clientes), rental (alquileres), category (categorías), entre otras. Estas tablas contienen información
sobre películas, actores, clientes, alquileres y más, y se utilizan para realizar consultas y análisis de datos
en el contexto de una tienda de alquiler de películas.
*/

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados.

USE sakila;

SELECT DISTINCT title FROM FILM;


-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title FROM FILM
WHERE rating = 'PG-13';


-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.

SELECT title, description FROM film
WHERE description LIKE '%amazing%';


-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.

SELECT title FROM film
WHERE length > 120;


-- 5. Recupera los nombres de todos los actores.

SELECT first_name, last_name FROM actor;


-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name, last_name FROM actor
WHERE last_name LIKE '%Gibson%';


-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT actor_id, first_name, last_name FROM actor
WHERE actor_id BETWEEN 10 AND 20;


-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.

SELECT title FROM film
WHERE rating NOT IN ('R', 'PG-13');


-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT rating, COUNT(*) AS total_peliculas FROM film
GROUP BY rating;


-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.

SELECT customer_id, first_name, last_name, COUNT(rental_id) AS total_alquileres
FROM customer 
INNER JOIN rental
USING(customer_id)
GROUP BY customer_id;


-- 11. Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.

SELECT c.name, COUNT(r.rental_id) AS total_alquileres  
FROM payment
INNER JOIN rental r
USING(rental_id)
INNER JOIN inventory
USING(inventory_id)
INNER JOIN film_category
USING(film_id)
INNER JOIN category c
USING(category_id)
GROUP BY c.name;


-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

SELECT rating, AVG(length) AS promedio_duracion FROM film
GROUP BY rating;


-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".

SELECT first_name, last_name 
FROM actor
INNER JOIN film_actor
USING(actor_id)
INNER JOIN film
USING(film_id)
WHERE title = "Indian Love";


-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.

SELECT title, description FROM film
WHERE description LIKE '%dog%' OR '%cat%';


-- 15. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.

SELECT title, release_year AS año_lanzamiento FROM film
WHERE release_year BETWEEN 2005 AND 2010


