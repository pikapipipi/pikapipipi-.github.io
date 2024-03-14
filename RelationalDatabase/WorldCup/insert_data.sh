#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

### RESTART EVERYTHING ###
echo $($PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY;")

### INSERT DATA INTO TABLES ###
#row counter
num=1

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
# if the keys field are not NULL , although the csv file should not have any blank
#check if not the title row
if [[ (-n $WINNER || -n $OPPONENT) &&  ($WINNER != 'winner' && $OPPONENT != 'opponent') ]]
then
    echo looping games.csv, row $num
    
    ## check if the team is already in the table
    WINNER_ID=$($PSQL "SELECT team_id from teams WHERE name='$WINNER' ")
    OPPONENT_ID=$($PSQL "SELECT team_id from teams WHERE name='$OPPONENT' ")

    # Insert data into the teams table
    # which is adding the UNIQUE team from the csv file, There should be 24 rows

    # insert data, WINNER
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAMS_RESULT == "INSERT 0 1" ]]
      then
          WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

        echo "Inserted into TABLE teams, WINNER, $WINNER"
      fi
    fi
    
    # insert data, OPPONENT
    if [[ -z $OPPONENT_ID && $OPPONENT_ID != $WINNER_ID ]]
    then
      INSERT_TEAMS_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAMS_RESULT == "INSERT 0 1" ]]
      then
          OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        echo "Inserted into TABLE teams, OPPONENT, $OPPONENT"
      fi
    fi

    # Insert data into the games table
    # Basicly is add ALL the rows from the csv file, There should be 32 rows
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")   
    echo "Inserted into TABLE games: $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS"

fi #if not blank && not the title row
  #row counter
  num=$((num +1)) 
done

