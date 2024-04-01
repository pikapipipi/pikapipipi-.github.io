#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=numberguess -t --no-align -c"

## OBJECTIVE ##
## Randum Number Guessing Game
##  ##   ##  ##

GUESS_LOOP(){
  # variable bring from GUESSING_GAME()
  ANSWER=$(($RANDOM % 1000 + 1))
  USER_ID=$1
  ATTEMPT=0
  ## echo "TEST: GUESS_LOOP $ANSWER $USER_ID"

    WIN_FLAG=0
    ## Ask for number guessing
    #Ask for guess
    echo -e "Guess the secret number between 1 and 1000:"    
    while [[ $WIN_FLAG == 0 ]]; do
    read GUESS
    ((ATTEMPT=ATTEMPT+1))

        # Check for inte1rger
        if ! [[ $GUESS =~ ^[0-9]+$ ]] 
        then
        echo -e "That is not an integer, guess again:"
          else
          # Check for 1 to 1000 
          if [[ $GUESS -lt 1 ]] || [[ $GUESS -gt 1000 ]]
          then
          echo -e "That is not a number between 1 and 1000, guess again:"
          else
            # Check for answer
             if [[ $GUESS != $ANSWER ]]
            then
              ## check for larger or lesser
              if [[ $GUESS -lt $ANSWER ]]
              then 
                echo -e "It's lower than that, guess again:"
              else
                echo -e "It's higher than that, guess again:"
              fi
            else
              ##exit with do while
              WIN_FLAG=1
              echo -e "You guessed it in $ATTEMPT tries. The secret number was $ANSWER. Nice job!"

              ##record this game
              INSET_GAME=$($PSQL "INSERT INTO games(answer, attempt, user_id) VALUES ($ANSWER,$ATTEMPT,$USER_ID);")
              exit
            fi
          fi
        fi
    done
}

GUESSING_GAME() {
  ## Greeting and ask for user name
  echo -e "Enter your username:"
  read USER_NAME
#Not sure why there are spaces displayed $(echo $USER_NAME | sed 's/^ *//g')

##Check username for record
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME';")
  if [[ -z $USER_ID ]]
    then
    echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
    ## Register for new user 
    INSET_USER=$($PSQL "INSERT INTO users(username) VALUES ('$USER_NAME');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME';")
    
    else
    GAME_PLAYED=$(echo $($PSQL "SELECT COUNT(game_id) FROM games FULL JOIN users ON games.user_id = users.user_id WHERE games.user_id =$USER_ID;") | sed 's/ //g')
    BEST_GAME=$(echo $($PSQL "SELECT MIN(attempt) FROM games FULL JOIN users ON games.user_id = users.user_id WHERE games.user_id =$USER_ID;") | sed 's/ //g')
    echo -e "Welcome back, $USER_NAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

    GUESS_LOOP $USER_ID

}

GUESSING_GAME