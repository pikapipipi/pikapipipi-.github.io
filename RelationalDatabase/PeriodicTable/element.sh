#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"


## OBJECTIVE ##
## If you run ./element.sh, it should output only Please provide an element as an argument. and finish running.
## If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, 
## it should output as below
## The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

QUERY_ELEMENT() {
#  CHECK=$($PSQL "SELECT COUNT(*) FROM elements WHERE atomic_number='9';")
#  if [[ -z $CHECK ]]
#  then
#    ./TEST_element.sh
#  fi

  if [[ -z $1 ]]
    then
    echo "Please provide an element as an argument."
    else
      # Check user input is number or name
      if [[ $1 =~ ^[0-9]+$ ]]
      then
      ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1';") | sed 's/ //g')
       else
      ATOMIC_NUMBER=$(echo $($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1';") | sed 's/ //g')
      fi
      ## echo "Searching for element with $1 , ATOMIC_NUMBER= $ATOMIC_NUMBER."

      # Get element details
        if [[ -z $ATOMIC_NUMBER ]]
          then
            echo "I could not find that element in the database."
          else
            TYPE_ID=$(echo $($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            NAME=$(echo $($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            SYMBOL=$(echo $($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            ATOMIC_MASS=$(echo $($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            MELTING_POINT_CELSIUS=$(echo $($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            BOILING_POINT_CELSIUS=$(echo $($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
            TYPE=$(echo $($PSQL "SELECT type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;") | sed 's/ //g')
          
            ## Not passing the test
            ## if [[ $1 = 1 ]]
            ## then
            ## clear
            ## echo "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
            ## else
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
            ## fi
      
          
          fi
  fi

}

QUERY_ELEMENT $1
