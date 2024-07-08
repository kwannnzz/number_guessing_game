#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( $RANDOM%1001 ))

echo "Enter your username:"
read USERNAME

CHECK_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")
if [[ -z $CHECK_USER ]]
then
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
USER_GUESS=0
NUMBER_OF_GUESSES=0
while [[ $USER_GUESS -ne $SECRET_NUMBER ]]
do
  read USER_GUESS
  (( NUMBER_OF_GUESSES++ ))
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
done

GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")

if [[ $USER_GUESS -eq $SECRET_NUMBER ]]
then
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  (( GAMES_PLAYED++ ))
  UPDATE_GAME_PLAYED=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")
  if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
  then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME'")
  fi
fi