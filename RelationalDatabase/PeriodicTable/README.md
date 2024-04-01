## Periodic Table Database

This is for the [freeCodeCamp Relational Database, Periodic Table Database project](https://www.freecodecamp.org/learn/relational-database/build-a-periodic-table-database-project/build-a-periodic-table-database).

To run this project, please go to the link above and create your own Gitpod first.

---

## Instructions

### Part 1: Create your Git repository

#### 1.1 Turn the project into a Git repository for version control with Bash terminal by entering
```
git init
git checkout -b main
git commit -m "Initial commit"
```

#### 1.2 During the editing, please feel free to track records with
```
git add <your_edited_file>
git commit -m "<any_description_of_the_edit>"
```


### Part 2: Fix the database

Based on the project requirements, several data have to be edited, which can be fixed with `./TEST_element.sh` and `periodic_table.sql`

#### 2.1 Enable the PostgreSQL database by entering in the terminal

```
psql --username=freecodecamp --dbname=periodic_table
``` 
This terminal will now be connected with PostgreSQL. 
Feel free to explore tables such as by entering

```
SELECT * FROM properties FULL JOIN elements ON properties.atomic_number = elements.atomic_number;
``` 

#### 2.2 Split the terminal. Make a backup for the data in the newly split Bash terminal by entering 
```
pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql
``` 

#### 2.3 Create a fix file `TEST_element.sh` with Bash terminal by entering 
```
mkdir periodic_table
cd periodic_table
touch TEST_element.sh
chmod +x TEST_element.sh
```
Copy and paste all content from the same name .sh file of this repo, save the .sh file

#### 2.4 Run the fix file with Bash terminal by entering
```
./TEST_element.sh
```
#### (Optional) To roll back from the initial backup file, in Bash terminal enter
```
psql -U postgres < periodic_table.sql
```

### Part 3: Create the script
#### 3.1 Create a shell script file `element.sh` with Bash terminal by entering 
```
touch element.sh
chmod +x element.sh
```
Copy and paste all content from the same name .sh file of this repo, save the .sh file

#### 3.2 Run `element.sh` with Bash terminal by entering such as
`./element.sh 1` Or `./element.sh Hydrogen`

Which the 1 or Hydrogen here, the first argument of element.sh, could be atomic number / symbol / name wishing to query as the project requirements said so. 

---
## Project requirements
1. Rename the `weight` column to `atomic_mass`.
2. Rename the `melting_point` column to `melting_point_celsius` and the `boiling_point` column to `boiling_point_celsius`.
3. `melting_point_celsius` and `boiling_point_celsius` columns should not accept `null` values.
4. Add the `UNIQUE` constraint to the `symbol` and `name` columns from the elements table.
5. `symbol` and `name` columns should have the `NOT NULL` constraint.
6. Set the `atomic_number` column from the `properties` table as a `foreign key` that references the column of the same name in the `elements` table.
7. Create a `types` table that will store the three types of `elements`.
8. `types` table should have a `type_id` column that is an `integer` and the `primary key`.
9. `types` table should have a `type` column that's a `VARCHAR` and cannot be `null`. It will store the different types from the type column in the `properties` table.
10. Add three rows to your `types` table whose values are the three different `types` from the `properties` table.
11. `properties` table should have a `type_id` `foreign key` column that references the `type_id` column from the `types` table. It should be an `INT` with the `NOT NULL` constraint.
12. Each row in `properties` table should have a `type_id` value that links to the correct `type` from the `types` table.
13. Capitalize the `first letter` of all the `symbol` values in the `elements` table. Be careful to only capitalize the `letter` and not change any others.
14. Remove all the `trailing zeros` after the `decimals` from each row of the `atomic_mass` column. You may need to adjust a data type to `DECIMAL` for this. The final values they should be are in the `atomic_mass.txt` file.
15. You should add the `element` with `atomic number` 9 to your database. Its `name` is Fluorine, `symbol` is F, `mass` is 18.998, `melting point` is -220, `boiling point` is -188.1, and it's a `nonmetal`.
16. Add the element with `atomic number` 10 to your database. Its `name` is Neon, `symbol` is Ne, `mass` is 20.18, `melting point` is -248.6, `boiling point` is -246.1, and it's a `nonmetal`.
17. Create a `periodic_table` folder in the `project` folder and turn it into a `git` repository with `git init`.
18. Your `repository` should have a `main` branch with all your commits.
19. `periodic_table` repo should have at least `five commits`.
20. Create an `element.sh` file in your repo folder for each program.
21. `script (.sh)` file should have executable permissions.
22. If user run `./element.sh`, it should output only `Please provide an element as an argument`. and finish running.
23. If user run `./element.sh 1`, `./element.sh H`, or `./element.sh Hydrogen`, it should output only `The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius`.
24. If user run `./element.sh` script with `another element` as input, it should get the `same output` but with information `associated` with the `given element`.
25. If the argument input to `element.sh` script doesn't exist as an `atomic_number`, `symbol`, or `name` in the database, the only output should be `I could not find that element in the database`.
26. The message for the `first commit` in the repo should be `Initial commit`.
27. The rest of the commit messages should start with `fix:`, `feat:`, `refactor:`, `chore:`, or `test:`.
28. Delete the `non existent element`, whose `atomic_number` is 1000, from the `two tables`.
29. `properties` table should not have a `type` column.
30. Finish the project while on the `main branch`. The `working tree` should be `clean` and it should not have any `uncommitted changes`.

---

> ~~ Happy Coding ~~
