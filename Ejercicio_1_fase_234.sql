-- ====================================
-- Fase 2: Creación de la Base de Datos
-- ====================================

CREATE SCHEMA IF NOT EXISTS peliculas;
USE peliculas;

CREATE TABLE IF NOT EXISTS movies (
	id_movie INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(50),
	año_lanzamiento YEAR,
	duracion INT,
	genero VARCHAR(20),
	contenido_adultos BOOLEAN
    );

CREATE TABLE IF NOT EXISTS subtitulos (
	id_subtitulo INT PRIMARY KEY AUTO_INCREMENT,
    id_movie INT,
	idioma VARCHAR(2),
    FOREIGN KEY (id_movie) REFERENCES movies(id_movie)
    );

-- DROP TABLE movies
-- CHAR(2) CHECK (contenido_adultos IN ('SI', 'NO'))


-- ==================================================
-- Fase 3: Inserción de los Datos en la Base de Datos
-- ==================================================

/*
INSERT INTO movies (id_movie, titulo, año_lanzamiento, duracion, genero, contenido_adultos) VALUES
(1, 'The Godfather', 1972, 175, 'Crimen', False),
 (2, 'The Godfather Part II', 1974, 202, 'Crimen', False),
 (3, 'Pulp Fiction', 1994, 154, 'Crimen', True),
 (4, 'Forrest Gump', 1994, 142, 'Drama', False),
 (5, 'The Dark Knight', 2008, 152, 'Acción', False),
 (6, 'Fight Club', 1999, 139, 'Drama', True),
 (7, 'Inception', 2010, 148, 'Ciencia ficción', False),
 (8, 'The Matrix', 1999, 136, 'Ciencia ficción', False),
 (9, 'The Shawshank Redemption', 1994, 142, 'Drama', False),
 (10, 'Interstellar', 2014, 169, 'Ciencia ficción', False),
 (11, 'Gladiator', 2000, 155, 'Acción', False),
 (12, 'Titanic', 1997, 195, 'Romance', False),
 (13, 'Avatar', 2009, 162, 'Ciencia ficción', False),
 (14, 'Saving Private Ryan', 1998, 169, 'Bélico', True),
 (15, 'The Silence of the Lambs', 1991, 118, 'Thriller', True),
 (16, 'Se7en', 1995, 127, 'Thriller', True),
 (17, 'Goodfellas', 1990, 146, 'Crimen', True),
 (18, 'The Departed', 2006, 151, 'Crimen', True),
 (19, 'Whiplash', 2014, 106, 'Drama', False),
 (20, 'La La Land', 2016, 128, 'Musical', False),
 (21,
  'The Lord of the Rings: The Fellowship of the Ring',
  2001,
  178,
  'Fantasía',
  False),
 (22, 'The Lord of the Rings: The Two Towers', 2002, 179, 'Fantasía', False),
 (23,
  'The Lord of the Rings: The Return of the King',
  2003,
  201,
  'Fantasía',
  False),
 (24, 'Star Wars: A New Hope', 1977, 121, 'Ciencia ficción', False),
 (25,
  'Star Wars: The Empire Strikes Back',
  1980,
  124,
  'Ciencia ficción',
  False),
 (26, 'Star Wars: Return of the Jedi', 1983, 131, 'Ciencia ficción', False),
 (27, 'Back to the Future', 1985, 116, 'Aventura', False),
 (28, 'Jurassic Park', 1993, 127, 'Aventura', False),
 (29, 'The Lion King', 1994, 88, 'Animación', False),
 (30, 'Toy Story', 1995, 81, 'Animación', False),
 (31, 'Finding Nemo', 2003, 100, 'Animación', False),
 (32, 'Shrek', 2001, 90, 'Animación', False),
 (33, 'The Incredibles', 2004, 115, 'Animación', False),
 (34, 'WALL·E', 2008, 98, 'Animación', False),
 (35, 'Up', 2009, 96, 'Animación', False),
 (36, 'Spirited Away', 2001, 125, 'Animación', False),
 (37, 'Princess Mononoke', 1997, 134, 'Animación', True),
 (38, 'The Green Mile', 1999, 189, 'Drama', True),
 (39, 'The Truman Show', 1998, 103, 'Drama', False),
 (40, 'The Social Network', 2010, 120, 'Drama', False),
 (41, 'Joker', 2019, 122, 'Drama', True),
 (42, 'Black Panther', 2018, 134, 'Acción', False),
 (43, 'Iron Man', 2008, 126, 'Acción', False),
 (44, 'The Avengers', 2012, 143, 'Acción', False),
 (45, 'Avengers: Endgame', 2019, 181, 'Acción', False),
 (46, 'Dune', 2021, 155, 'Ciencia ficción', False),
 (47, 'Mad Max: Fury Road', 2015, 120, 'Acción', True),
 (48, 'The Revenant', 2015, 156, 'Aventura', True),
 (49, 'Parasite', 2019, 132, 'Thriller', True),
 (50, 'Oldboy', 2003, 120, 'Thriller', True),
 (51, 'The Pianist', 2002, 150, 'Drama', True),
 (52, 'The Wolf of Wall Street', 2013, 180, 'Biografía', True),
 (53, 'Her', 2013, 126, 'Drama', False),
 (54, 'Gravity', 2013, 91, 'Ciencia ficción', False),
 (55, 'The Shape of Water', 2017, 123, 'Fantasía', True),
 (56, 'Get Out', 2017, 104, 'Terror', True),
 (57, 'It', 2017, 135, 'Terror', True),
 (58, 'The Conjuring', 2013, 112, 'Terror', True),
 (59, 'A Quiet Place', 2018, 90, 'Terror', False),
 (60, 'The Exorcist', 1973, 122, 'Terror', True),
 (61, 'The Shining', 1980, 144, 'Terror', True),
 (62, 'Blade Runner', 1982, 117, 'Ciencia ficción', True),
 (63, 'Blade Runner 2049', 2017, 164, 'Ciencia ficción', True),
 (64, 'Alien', 1979, 117, 'Ciencia ficción', True),
 (65, 'Aliens', 1986, 137, 'Ciencia ficción', True),
 (66, 'The Terminator', 1984, 107, 'Acción', True),
 (67, 'Terminator 2: Judgment Day', 1991, 137, 'Acción', False),
 (68, 'Rocky', 1976, 120, 'Drama', False),
 (69, 'Raging Bull', 1980, 129, 'Biografía', True),
 (70, 'Taxi Driver', 1976, 113, 'Drama', True),
 (71, 'Casablanca', 1942, 102, 'Romance', False),
 (72, 'Citizen Kane', 1941, 119, 'Drama', False),
 (73, 'Psycho', 1960, 109, 'Terror', True),
 (74, 'Vertigo', 1958, 128, 'Suspense', False),
 (75, 'Rear Window', 1954, 112, 'Suspense', False),
 (76, '12 Angry Men', 1957, 96, 'Drama', False),
 (77, "Schindler's List", 1993, 195, 'Drama', True),
 (78, 'American Beauty', 1999, 122, 'Drama', True),
 (79, 'No Country for Old Men', 2007, 122, 'Crimen', True),
 (80, 'The Big Lebowski', 1998, 117, 'Comedia', True),
 (81, 'Amélie', 2001, 122, 'Romance', False),
 (82, 'The Intouchables', 2011, 112, 'Drama', False),
 (83, 'City of God', 2002, 130, 'Crimen', True),
 (84, "Pan's Labyrinth", 2006, 118, 'Fantasía', True),
 (85, 'Roma', 2018, 135, 'Drama', True),
 (86, 'Slumdog Millionaire', 2008, 120, 'Drama', False),
 (87, 'Million Dollar Baby', 2004, 132, 'Drama', True),
 (88, "The King's Speech", 2010, 118, 'Biografía', False),
 (89, 'Argo', 2012, 120, 'Thriller', False),
 (90, 'Moonlight', 2016, 111, 'Drama', True),
 (91, 'Manchester by the Sea', 2016, 137, 'Drama', True),
 (92, 'Birdman', 2014, 119, 'Drama', True),
 (93, 'Django Unchained', 2012, 165, 'Western', True),
 (94, 'Inglourious Basterds', 2009, 153, 'Bélico', True),
 (95, 'The Hateful Eight', 2015, 168, 'Western', True),
 (96, 'La vita è bella', 1997, 116, 'Drama', False),
 (97, 'Requiem for a Dream', 2000, 102, 'Drama', True),
 (98, 'Memento', 2000, 113, 'Thriller', True),
 (99, 'Eternal Sunshine of the Spotless Mind', 2004, 108, 'Drama', False),
 (100, 'Donnie Darko', 2001, 113, 'Drama', True)
 */
 
 /*
 INSERT INTO subtitulos (id_movie, idioma) VALUES
 (1, 'es'),
 (1, 'en'),
 (2, 'es'),
 (2, 'en'),
 (3, 'es'),
 (3, 'en'),
 (4, 'es'),
 (4, 'en'),
 (4, 'fr'),
 (5, 'es'),
 (5, 'en'),
 (6, 'es'),
 (6, 'en'),
 (7, 'es'),
 (7, 'en'),
 (7, 'de'),
 (8, 'es'),
 (8, 'en'),
 (9, 'es'),
 (9, 'en'),
 (10, 'es'),
 (10, 'en'),
 (11, 'es'),
 (11, 'en'),
 (12, 'es'),
 (12, 'en'),
 (12, 'fr'),
 (13, 'es'),
 (13, 'en'),
 (14, 'es'),
 (14, 'en'),
 (15, 'es'),
 (15, 'en'),
 (16, 'es'),
 (16, 'en'),
 (17, 'es'),
 (17, 'en'),
 (18, 'es'),
 (18, 'en'),
 (19, 'es'),
 (19, 'en'),
 (20, 'es'),
 (20, 'en'),
 (21, 'es'),
 (21, 'en'),
 (22, 'es'),
 (22, 'en'),
 (23, 'es'),
 (23, 'en'),
 (24, 'es'),
 (24, 'en'),
 (25, 'es'),
 (25, 'en'),
 (26, 'es'),
 (26, 'en'),
 (27, 'es'),
 (27, 'en'),
 (28, 'es'),
 (28, 'en'),
 (29, 'es'),
 (29, 'en'),
 (30, 'es'),
 (30, 'en'),
 (31, 'es'),
 (31, 'en'),
 (32, 'es'),
 (32, 'en'),
 (33, 'es'),
 (33, 'en'),
 (34, 'es'),
 (34, 'en'),
 (35, 'es'),
 (35, 'en'),
 (36, 'es'),
 (36, 'en'),
 (36, 'jp'),
 (37, 'es'),
 (37, 'en'),
 (37, 'jp'),
 (38, 'es'),
 (38, 'en'),
 (39, 'es'),
 (39, 'en'),
 (40, 'es'),
 (40, 'en'),
 (41, 'es'),
 (41, 'en'),
 (42, 'es'),
 (42, 'en'),
 (43, 'es'),
 (43, 'en'),
 (44, 'es'),
 (44, 'en'),
 (45, 'es'),
 (45, 'en'),
 (46, 'es'),
 (46, 'en'),
 (47, 'es'),
 (47, 'en'),
 (48, 'es'),
 (48, 'en'),
 (49, 'es'),
 (49, 'en'),
 (49, 'ko'),
 (50, 'es'),
 (50, 'en'),
 (50, 'ko'),
 (51, 'es'),
 (51, 'en'),
 (52, 'es'),
 (52, 'en'),
 (53, 'es'),
 (53, 'en'),
 (54, 'es'),
 (54, 'en'),
 (55, 'es'),
 (55, 'en'),
 (56, 'es'),
 (56, 'en'),
 (57, 'es'),
 (57, 'en'),
 (58, 'es'),
 (58, 'en'),
 (59, 'es'),
 (59, 'en'),
 (60, 'es'),
 (60, 'en'),
 (61, 'es'),
 (61, 'en'),
 (62, 'es'),
 (62, 'en'),
 (63, 'es'),
 (63, 'en'),
 (64, 'es'),
 (64, 'en'),
 (65, 'es'),
 (65, 'en'),
 (66, 'es'),
 (66, 'en'),
 (67, 'es'),
 (67, 'en'),
 (68, 'es'),
 (68, 'en'),
 (69, 'es'),
 (69, 'en'),
 (70, 'es'),
 (70, 'en'),
 (71, 'es'),
 (71, 'en'),
 (72, 'es'),
 (72, 'en'),
 (73, 'es'),
 (73, 'en'),
 (74, 'es'),
 (74, 'en'),
 (75, 'es'),
 (75, 'en'),
 (76, 'es'),
 (76, 'en'),
 (77, 'es'),
 (77, 'en'),
 (78, 'es'),
 (78, 'en'),
 (79, 'es'),
 (79, 'en'),
 (80, 'es'),
 (80, 'en'),
 (81, 'es'),
 (81, 'en'),
 (81, 'fr'),
 (82, 'es'),
 (82, 'en'),
 (82, 'fr'),
 (83, 'es'),
 (83, 'en'),
 (83, 'pt'),
 (84, 'es'),
 (84, 'en'),
 (85, 'es'),
 (85, 'en'),
 (86, 'es'),
 (86, 'en'),
 (87, 'es'),
 (87, 'en'),
 (88, 'es'),
 (88, 'en'),
 (89, 'es'),
 (89, 'en'),
 (90, 'es'),
 (90, 'en'),
 (91, 'es'),
 (91, 'en'),
 (92, 'es'),
 (92, 'en'),
 (93, 'es'),
 (93, 'en'),
 (94, 'es'),
 (94, 'en'),
 (95, 'es'),
 (95, 'en'),
 (96, 'es'),
 (96, 'en'),
 (96, 'it'),
 (97, 'es'),
 (97, 'en'),
 (98, 'es'),
 (98, 'en'),
 (99, 'es'),
 (99, 'en'),
 (100, 'es'),
 (100, 'en')
 */
 
 
 -- ==================================================
 -- Fase 4: Obtener información a partir de los datos.
 -- ==================================================
 
 -- ¿Cuántas películas tienen una duración superior a 120 minutos?
 
 USE peliculas;
 
 SELECT COUNT(*) FROM movies
 WHERE duracion > 120;
 
 
 -- ¿Cuántas películas incluyen subtítulos en español?
 
 SELECT COUNT(*) FROM subtitulos
 WHERE idioma = 'es';
 
 
 -- ¿Cuántas películas tienen contenido adulto?
 
 SELECT COUNT(*) FROM movies
 WHERE contenido_adultos = 1;
 
 
 -- ¿Cuál es la película más antigua registrada en la base de datos?
 
 SELECT titulo, año_lanzamiento FROM movies
 ORDER BY año_lanzamiento ASC
 LIMIT 1;
 
 
 -- Muestra el promedio de duración de las películas agrupado por género.
 
 SELECT genero, AVG(duracion) AS duracion_promedio FROM movies
 GROUP BY genero;
 
 
 -- ¿Cuántas películas por año se han registrado en la base de datos? Ordena de mayor a menor.
 
 SELECT año_lanzamiento, COUNT(*) AS total_peliculas FROM movies
 GROUP BY año_lanzamiento
 ORDER BY año_lanzamiento DESC;
 
 
 -- ¿Cuál es el año con más películas en la base de datos?
 
SELECT año_lanzamiento, COUNT(*) AS total_peliculas FROM movies
GROUP BY año_lanzamiento
ORDER BY total_peliculas DESC
LIMIT 1;
 
 
 -- Obtén un listado de todos los géneros y cuántas películas corresponden a cada uno.
 
 SELECT genero, COUNT(*) AS total_peliculas FROM movies
 GROUP BY genero;
 
 
 -- Muestra todas las películas cuyo título contenga la palabra "Godfather" (puedes usar cualquier palabra).
 
 SELECT titulo FROM movies
 WHERE titulo LIKE '%Godfather%';
 
 