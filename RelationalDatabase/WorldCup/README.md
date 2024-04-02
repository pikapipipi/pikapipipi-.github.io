## World Cup Database

This is for the [freeCodeCamp Relational Database, World Cup Database project](https://www.freecodecamp.org/learn/relational-database/build-a-world-cup-database-project/build-a-world-cup-database).

To run this project, please go to the link above and create your own Gitpod first.

---

## Instructions

### Part 1: Create database and tables

Based on the project requirements, some pseudo-tables can be prepared as below.
#### 1.1 Enable PostgreSQL and create a database and tables by entering below in the terminal

```
psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup;
\c worldcup
``` 
``` 
CREATE TABLE teams(
team_id SERIAL PRIMARY KEY,
name TEXT NOT NULL UNIQUE
);
``` 
``` 
CREATE TABLE games(
game_id SERIAL PRIMARY KEY,
year INT NOT NULL,
round VARCHAR(30) NOT NULL,
winner_id INT REFERENCES teams(team_id) NOT NULL,
opponent_id INT REFERENCES teams(team_id) NOT NULL,
winner_goals INT NOT NULL,
opponent_goals INT NOT NULL
);
``` 
The tables created are initially empty but are prepared to be filled by `./insert_data.sh` and `games.csv`

#### 1.2 Split the terminal. Create backup for `worldcup.sql` file in the newly split Bash terminal by entering 
```
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
``` 

### Part 2: Create the script  `insert_data.sh` and `queries.sh`

#### 2.1 Create a shell script file `insert_data.sh` with Bash terminal by entering 
```
touch queries.sh
chmod +x queries.sh
touch insert_data.sh
chmod +x insert_data.sh
```
Copy and paste all content from the same named .sh files of this repo, save the .sh files


### Part 3: Run the script  `insert_data.sh` and `queries.sh`
#### 3.1  To import data from `games.csv`, in Bash terminal, enter
```
./insert_data.sh
```
Data will be imported from `games.csv` to the tables
Feel free to explore tables entering in PostgreSQL terminal such as 
```
SELECT * FROM teams FULL JOIN games ON teams.team_id = games.winner_id;
``` 

#### (Optional) To roll back from the initial backup file, in Bash terminal enter
```
psql -U postgres < periodic_table.sqlpsql -U postgres < salon.sql
```

#### 3.2  To print out user's query, in Bash terminal, enter
```
./queries.sh
```

---
## Project requirements
1. You should create a database named `worldcup`.
2. You should **connect to your worldcup database** and then create `teams` and `games` tables.
3. Your `teams` table should have a `team_id` column that is a type of `SERIAL` and is the primary key, and a `name` column that has to be `UNIQUE`.
4. Your `games` table should have a `game_id` column that is a type of `SERIAL` and is the primary key, a `year` column of type `INT`, and a `round` column of type `VARCHAR`.
5. Your `games` table should have `winner_id` and `opponent_id` foreign key columns that each reference `team_id` from the `teams` table.
6. Your `games` table should have `winner_goals` and `opponent_goals` columns that are type `INT`.
7. All of your columns should have the `NOT NULL` constraint.
8. Your two script (`.sh`) files should have `executable permissions`. Other `tests` involving these two files will fail until permissions are correct. When these `permissions` are enabled, the tests will take significantly longer to run.
9. When you run your `insert_data.sh` script, it should add each `unique team` to the `teams` table. There should be `24` rows.
10. When you run your `insert_data.sh` script, it should insert a `row` for each line in the `games.csv` file (other than the top line of the file). There should be `32` rows. Each row should have every column filled in with the appropriate info. Make sure to add the correct ID's from the `teams` table (you cannot hard-code the values).
11. You should correctly complete the queries in the `queries.sh` file. Fill in each empty echo command to get the output of what is suggested with the command above it. Only use a single line like the first query. The output should match what is in the `expected_output.txt` file **exactly**, take note of the number of decimal places in some of the query results.

---

> ~~ Happy Coding ~~