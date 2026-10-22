#!/bin/bash

PSQL=(psql -X -q -w -h 127.0.0.1 -U freecodecamp -d number_guess -v ON_ERROR_STOP=1 -tA)
export PGPASSWORD="${PGPASSWORD:-fcc_temp_password}"

echo "Enter your username:"
read -r USERNAME
USERNAME_SQL=${USERNAME//\'/\'\'}

if ! USER_ID=$("${PSQL[@]}" -c "SELECT user_id FROM users WHERE username = '$USERNAME_SQL'"); then
  exit 1
fi

if [[ -z $USER_ID ]]; then
  if ! "${PSQL[@]}" -c "INSERT INTO users(username) VALUES ('$USERNAME_SQL')"; then
    exit 1
  fi
  if ! USER_ID=$("${PSQL[@]}" -c "SELECT user_id FROM users WHERE username = '$USERNAME_SQL'"); then
    exit 1
  fi
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  if ! GAMES_PLAYED=$("${PSQL[@]}" -c "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID"); then
    exit 1
  fi
  if ! BEST_GAME=$("${PSQL[@]}" -c "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID"); then
    exit 1
  fi

  if [[ -z $BEST_GAME ]]; then
    BEST_GAME=0
  fi

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
while read -r GUESS; do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    if ! "${PSQL[@]}" -c "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)"; then
      exit 1
    fi
    break
  fi
done
