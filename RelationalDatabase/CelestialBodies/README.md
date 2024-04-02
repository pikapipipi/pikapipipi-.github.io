## Celestial Bodies Database

This is for the [freeCodeCamp Relational Database, Celestial Bodies Database project](https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database).

To run this project, please go to the link above and create your own Gitpod first.

---

## Instructions

### Part 1: Create database and tables

Based on the project requirements, data tables can be prepared as below.
#### 1.1 Enable PostgreSQL and create a database and tables by entering below in the terminal

```
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE universe;
\c universe
``` 

``` 
CREATE TABLE galaxy(
galaxy_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
constellation TEXT,
distance_in_kly INT,
stars_in_billion INT,
apparentMagnitude_in_M NUMERIC(4, 2),
visibleWithNakeEye BOOLEAN
);
``` 
``` 
CREATE TABLE star(
star_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
constellation TEXT,
distance_in_ly INT,
apparentMagnitude_in_M NUMERIC(4, 2),
visibleWithNakeEye BOOLEAN,
galaxy_id INT REFERENCES galaxy(galaxy_id)
);
``` 
``` 
CREATE TABLE planet(
planet_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
colour TEXT,
distance_in_lm INT,
apparentMagnitude_in_M NUMERIC(4, 2),
visibleWithNakeEye BOOLEAN,
star_id INT REFERENCES star(star_id)
);
``` 
``` 
CREATE TABLE moon(
moon_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL UNIQUE,
colour TEXT,
distance_in_lm INT,
apparentMagnitude_in_M NUMERIC(4, 2),
visibleWithNakeEye BOOLEAN,
planet_id INT REFERENCES planet(planet_id)
);
``` 
``` 
CREATE TABLE deities(
deities_id SERIAL PRIMARY KEY,
name VARCHAR(30) NOT NULL,
religion TEXT,
knownAs TEXT,
planet_id INT REFERENCES planet(planet_id),
moon_id INT REFERENCES moon(moon_id)
);

ALTER TABLE deities ADD CONSTRAINT constraint_name UNIQUE (name);
``` 


The tables created are initially empty but are ready to be filled by pseudo-data later.


#### 1.2 Split the terminal. Create backup for `worldcup.sql` file in the newly split Bash terminal by entering 
```
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql

``` 

### Part 2: Insert data

#### 2.1 Data were insert by entering below in the PostgreSQL terminal
``` 
INSERT INTO galaxy(name,constellation,distance_in_kly,stars_in_billion,apparentMagnitude_in_M,visibleWithNakeEye) 
VALUES
('Milky Way','Sagittarius',1,400,-5.1,true),
('Large Magellanic Cloud','Dorado/Mensa',160,550,0.9,true),
('Andromeda Galaxy','Andromeda',200,1000,2.7,true),
('Triangulum Galaxy','Triangulum',3,40,5.7,true),
('Centaurus A','Centaurus',14,1000,6.84,true),
('Bodes Galaxy','Ursa Major',12,250,6.94,true)
;
``` 
``` 
INSERT INTO star(name,constellation,distance_in_ly,apparentMagnitude_in_M,visibleWithNakeEye,galaxy_id) 
VALUES
('Sun',null,0,-27.0,true,1),
('HD 33579','Dorado',163000,9.22,false,2),
('DMM2009',null,2500000,15.6,false,3),
('B324','Triangulum',3200000,14.859,false,4),
('Rigel','Orion',863,6.67,true,5),
('Sirius','Canis Major',8.6,11.18,true,1)
;
``` 
```
INSERT INTO planet(name,colour,distance_in_lm,apparentMagnitude_in_M,visibleWithNakeEye,star_id) 
VALUES
('Mercury','Grey',3.3,2.2,true,1),
('Venus','Golden Brown',6,-4.6,true,1),
('Earth','blue',8.3,null,true,1),
('Mars','red',12.7,-2.3,true,1),
('Jupiter','Brown Red',43,-2.7,true,1),
('Saturn','Grey Yellow',1.3,-0.4,true,1),
('Uranus','Cyan',2.7,5.7,true,1),
('Neptune','Blue',4.2,7.9,false,1),
('HD 33579 b',null,164,11.2,false,2),
('HD 33579 c',null,164,12.5,false,2),
('B324 b','Orange Brown',1290,8.6,false,4),
('Kepler-186f',null,512,16.2,false,1)
;
``` 
```
INSERT INTO moon(name,colour,distance_in_lm,apparentMagnitude_in_M,visibleWithNakeEye,planet_id) 
VALUES
('Moon','Grey',2.3,-12.6,true,3),
('Phobos','Black',0.9,11.3,false,4),
('Deimos','Grey',3.7,12.9,false,4),
('Io','Orange White',1.8,-5,false,5),
('Europa','Yellow White',3.2,-5.7,false,5),
('Ganymede','Grey White',7.1,-4.5,false,5),
('Callisto','Grey Brown',16.7,-5.9,false,5),
('Himalia','Grey Brown',242.3,-7.1,false,5),
('Elara','Grey Brown',314.8,-7.3,false,5),
('Titan','Orange Brown',24.3,-7.9,false,6),
('Rhea','Grey Brown',8.5,-7.6,false,6),
('Iapetus','Black White',79.3,-7,false,6),
('Dione','Grey White',37.4,-7.7,false,6),
('Titania','Grey Brown',43.2,-7.7,false,7),
('Oberon','Reddish Brown',52.8,-7.7,false,7),
('Umbriel','Grey Black',42.3,-7.2,false,7),
('Ariel','White Grey',40.1,-7.4,false,7),
('Triton','Grey Reddish Brown',354.7,-7.8,false,8),
('Proteus','Black Grey',117.7,-7.1,false,8),
('Nereid','Grey Blue',550.1,-6.5,false,8),
('Larissa','Grey White',73.7,-7.2,false,8)
;

``` 
```
INSERT INTO deities(name,religion,knownAs,planet_id,moon_id) 
VALUES
('Aphrodite','Greek','Goddess of love, beauty, pleasure, and procreation',2,null),
('Mars','Roman','God of war',4,null),
('Ares','Greek','God of war',4,null),
('Jupiter','Roman','King of the gods, god of sky and thunder',5,null),
('Zeus','Greek','King of the gods, god of sky and thunder',5,null),
('Saturn','Roman','God of agriculture, time, and harvest',6,null),
('Cronus','Greek','Titan god of time, harvest, and the sky',6,null),
('Uranus','Greek','Primordial god of the sky',7,null),
('Caelus','Roman','God of the sky',7,null),
('Neptune','Roman','God of the sea and freshwater',8,null),
('Poseidon','Greek','God of the sea, earthquakes, and horses',8,null),
('Moon','Roman','Moon goddess',3,1),
('Phobos & Deimos','Greek','Sons of Ares (god of war)',4,2),
('Io','Greek','Daughter of Inachus (river god)',5,4),
('Europa','Greek','Daughter of Agenor (king of Tyre)',5,5),
('Ganymede','Greek','Son of Tros (king of Troy)',5,6),
('Callisto','Greek','Daughter of Lycaon (king of Arcadia)',5,7),
('Titan','Greek','Primordial race of powerful beings',6,10),
('Rhea','Greek','Titan goddess, wife of Cronus (Titan god of time)',6,11),
('Iapetus','Greek','Titan god, son of Uranus (primordial god of the sky)',6,12),
('Dione','Greek','Titan goddess, daughter of Uranus and Gaia (primordial goddess of Earth)',6,13),
('Titania','Greek','Queen of the fairies',7,14),
('Oberon','Mischievous spirit','King of the fairies',7,15),
('Umbriel','Mischievous spirit','A mischievous spirit',7,16),
('Ariel','Mischievous spirit','A benevolent spirit',7,17),
('Triton','Greek','Son of Poseidon (god of the sea)',8,18)
;

``` 

#### 2.2 Explore data
Feel free to explore tables entering in PostgreSQL terminal such as
```
SELECT * FROM galaxy FULL JOIN star ON galaxy.galaxy_id = star.galaxy_id;
SELECT * FROM star FULL JOIN planet ON planet.star_id = star.star_id;
SELECT * FROM planet FULL JOIN moon ON planet.planet_id = moon.planet_id;
```

#### (Optional) To roll back from the initial backup file, in Bash terminal enter
```
psql -U postgres < universe.sql
```


---
## Project requirements
1. You should create a database named `universe`.
2. Be sure to connect to your database with `\c universe`. Then, you should add tables named `galaxy`, `star`, `planet`, and `moon`.
3. Each table should have a `primary key`.
4. Each `primary key` should automatically increment.
5. Each table should have a `name` column.
6. You should use the `INT` data type for at least two columns that are not a primary or foreign key.
7. You should use the `NUMERIC` data type at least once.
8. You should use the `TEXT` data type at least once.
9. You should use the `BOOLEAN` data type on at least two columns.
10. Each `star` should have a `foreign key` that references one of the rows in `galaxy`.
11. Each `planet` should have a `foreign key` that references one of the rows in `star`.
12. Each `moon` should have a `foreign key` that references one of the rows in `planet`.
13. Your database should have at least five `tables`.
14. Each table should have at least three rows.
15. The `galaxy` and `star` tables should each have at least six rows.
16. The `planet` table should have at least 12 rows.
17. The `moon` table should have at least 20 rows.
18. Each table should have at least three columns.
19. The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns.
20. At least two columns per table should not accept `NULL` values.
21. At least one column from each table should be required to be `UNIQUE`.
22. All columns named name should be of type `VARCHAR`.
23. Each `primary key` column should follow the naming convention `table_name_id`. For example : the `moon` table should have a `primary key` column named `moon_id`.
24. Each `foreign key` column should have the same name as the `column` it is referencing.

---

> ~~ Happy Coding ~~