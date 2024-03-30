#!/bin/bash

## OBJECTIVE ##
## Alter tables according to user's requirement
##  ##   ##  ##

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

CHECK=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='9';")
if [[ -z $CHECK ]]
then
echo "editing data..."

## backup first
pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql

## You should rename the weight column to atomic_mass
RENAME_PROPERTIES_WEIGHT=$($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass;")

## You should rename the melting_point column to melting_point_celsius and the boiling_point column to boiling_point_celsius
RENAME_PROPERTIES_MELTINGPOINT=$($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;")
RENAME_PROPERTIES_BOILINGPOINT=$($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;")

## Your melting_point_celsius and boiling_point_celsius columns should not accept null values
ALTER_PROPERTIES_MELTINGPOINT_NOT_NULL=$($PSQL"ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;")
ALTER_PROPERTIES_BOILINGPOINT_NOT_NULL=$($PSQL"ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;")

## You should add the UNIQUE constraint to the symbol and name columns from the elements table
ALTER_ELEMENTS_SYMBOL_ADD_UNIQUE=$($PSQL "ALTER TABLE elements ADD UNIQUE(symbol);")
ALTER_ELEMENTS_NAME_ADD_UNIQUE=$($PSQL "ALTER TABLE elements ADD UNIQUE(name);")

## Your symbol and name columns should have the NOT NULL constraint
ALTER_ELEMENTS_SYMBOL_NOT_NULL=$($PSQL"ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;")
ALTER_ELEMENTS_NAME_NOT_NULL=$($PSQL"ALTER TABLE elements ALTER COLUMN name SET NOT NULL;")

## You should set the atomic_number column from the properties table as a foreign key that references the column of the same name in the elements table
ALTER_PROPERTIES_ATOMIC_NUMBER_FOREIGN_KEY=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);")

## You should create a types table that will store the three types of elements
## Your types table should have a type_id column that is an integer and the primary key
## Your types table should have a type column that's a VARCHAR and cannot be null. It will store the different types from the type column in the properties table
CREATE_TYPES=$($PSQL "CREATE TABLE types(type_id SERIAL PRIMARY KEY, type VARCHAR(20) NOT NULL);")

## You should add three rows to your types table whose values are the three different types from the properties table
INSERT_ROWS_TYPES_TYPE=$($PSQL "INSERT INTO types(type) SELECT DISTINCT(type) FROM properties;")

## Your properties table should have a type_id foreign key column that references the type_id column from the types table. It should be an INT with the NOT NULL constraint
## Note: CANNOT add not null when add column until all fields are filled 
## https://forum.freecodecamp.org/t/type-id-contains-null-values-build-a-periodic-table-database-course/507416
ADD_COLUMN_PROPERTIES_TYPE_ID=$($PSQL "ALTER TABLE properties ADD COLUMN type_id INT;")
UPDATE__TYPE_ID=$($PSQL "UPDATE properties SET type_id = (SELECT type_id FROM types WHERE properties.type = types.type);")
ALTER_COLUMN_PROPERTIES_TYPE_ID_NOT_NULL=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;")
ADD_FOREIGNKEY_PROPERTIES_TYPE_ID=$($PSQL "ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);")

## You should capitalize the first letter of all the symbol values in the elements table. Be careful to only capitalize the letter and not change any others
UPDATE_ELEMENTS_INITCAP_SYMBOL=$($PSQL "UPDATE elements SET symbol=INITCAP(symbol);")

## You should remove all the trailing zeros after the decimals from each row of the atomic_mass column. You may need to adjust a data type to DECIMAL for this. The final values they should be are in the atomic_mass.txt file
## https://forum.freecodecamp.org/t/build-a-periodic-table-database-help-needed/549342/12
## ## ALTER_PROPERTIES_ATOMICMASS_DECIMAL=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL(5,3);")
UPDATE_PROPERTIES_ATOMICMASS_REAL=$($PSQL "UPDATE properties SET atomic_mass = atomic_mass::REAL;")
ALTER_PROPERTIES_ATOMICMASS_DECIMAL=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;")
UPDATE_PROPERTIES_ATOMICMASS_TRIM_TEXT_DECIMAL=$($PSQL "UPDATE properties SET atomic_mass=trim(trailing '00' FROM atomic_mass::TEXT)::DECIMAL;")

## You should add the element with atomic number 9 to your database. Its name is Fluorine, symbol is F, mass is 18.998, melting point is -220, boiling point is -188.1, and it's a nonmetal
## You should add the element with atomic number 10 to your database. Its name is Neon, symbol is Ne, mass is 20.18, melting point is -248.6, boiling point is -246.1, and it's a nonmetal
INSERT_ELEMENTS=$($PSQL "INSERT INTO elements(atomic_number,symbol,name) VALUES(9,'F','Fluorine'),(10,'Ne','Neon');")
INSERT_PROPERTIES=$($PSQL "INSERT INTO properties(atomic_number,type,melting_point_celsius,boiling_point_celsius,type_id,atomic_mass) VALUES(9,'nonmetal',-220,-188.1,3,'18.998'),(10,'nonmetal',-248.6,-246.1,3,'20.18');")

## You should delete the non existent element, whose atomic_number is 1000, from the two tables
DELETE_PROPERTIES_1000=$($PSQL "DELETE FROM properties WHERE atomic_number=1000;")
DELETE_ELEMENTS_1000=$($PSQL "DELETE FROM elements WHERE atomic_number=1000;")

## Your properties table should not have a type column
DELETE_COLUMN_PROPERTIES_TYPE=$($PSQL "ALTER TABLE properties DROP COLUMN type;")
fi