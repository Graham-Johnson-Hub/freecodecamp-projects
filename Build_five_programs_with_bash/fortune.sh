#!/bin/bash
#program to read a persons fortune
GET_FORTUNE() {
  if [[ ! $1 ]]
  then
    echo "Ask a yes or no question:"
  else
    echo "Try again. Make sure it ends with a question mark:"
  fi
  read QUESTION
}

echo "~~ Fortune Teller ~~"
GET_FORTUNE

until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again
done

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again")
N=$(( RANDOM % 6 ))

# Empty line before response
echo -e "\n${RESPONSES[$N]}"
