#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#Welcome
echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome, please select a service?"

#Main Menu
MAIN_MENU() {
  # Add a echo line when calling MAIN_MENU 
  # e.g. MAIN_MENU "Testing" will display a line Testing then following with the menu list 
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #echo from table services
  SERVICE_INFO=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  if [[ -z $SERVICE_INFO ]]
    then
      echo -e "\nApologies, but there is currently no service available. Please try again later."
      #INSERT default services
      SERVICE_DEFAULT=$($PSQL "INSERT INTO services(name,remark) VALUES ('cut','blunt'), ('color','black'), ('perm','curl'), ('style','straight')")
      exit
    else
      #Display the formatted services
      echo "$SERVICE_INFO" | while read SERVICE_ID BAR NAME
      do
        echo "$SERVICE_ID) $NAME"
      done
  fi

  read SERVICE_ID_SELECTED
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
      if [[ -z $SERVICE_NAME_SELECTED ]]
        then
          SERVICE_NOT_FOUND
        else
          # otherwise, start scheduling the appointment
          APPOINTMENT_BOOKING $SERVICE_ID_SELECTED $SERVICE_NAME_SELECTED
      fi
}

APPOINTMENT_BOOKING() {
  # variable bring from MAIN_MENU()
SERVICE_ID_SELECTED=$1
SERVICE_NAME_SELECTED=$2

echo -e "\nThe service you had chosen is $SERVICE_ID_SELECTED) $SERVICE_NAME_SELECTED"
echo -e "\nPlease input your phone number?"
read CUSTOMER_PHONE

#check phone number in table customers first
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

if [[ -z  $CUSTOMER_ID ]]
then
    # Ask for new customer name
    echo -e "\nWe don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #Not sure why there are spaces displayed $(echo $CUSTOMER_ID | sed 's/^ *//g')
    echo  -e "\nNew customer registered as '$CUSTOMER_NAME' with id $(echo $CUSTOMER_ID | sed 's/^ *//g'). Thank you."
fi

#Ask for appointment time
echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
read SERVICE_TIME

    # insert new appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 
    #echo  -e "\nYour appointment of $SERVICE_NAME_SELECTED will be at $SERVICE_TIME'. Our staff will call you with $CUSTOMER_PHONE'. Thank you, $CUSTOMER_NAME."
    
    #freeCodeCamp requirement, must end with below sentence
    echo  -e "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

SERVICE_NOT_FOUND() {
  MAIN_MENU "Sorry, I could not find that service. Please enter a valid service number."
}

#MUST BE CALL AT THE LAST
MAIN_MENU 
