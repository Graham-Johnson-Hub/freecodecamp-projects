#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate tables and Reset ID
$PSQL "TRUNCATE games, teams RESTART IDENTITY"

# Insert teams
tail -n +2 games.csv | awk -F',' '{print $3 "\n" $4}' | sort | uniq | while read team; do
    [[ -n "$team" ]] && $PSQL "INSERT INTO teams (name) VALUES ('$team')"
done

# Insert games with team ID lookups
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
    
    year=$(echo $year | tr -d '\r')
    round=$(echo $round | tr -d '\r')
    winner=$(echo $winner | tr -d '\r')
    opponent=$(echo $opponent | tr -d '\r')
    winner_goals=$(echo $winner_goals | tr -d '\r')
    opponent_goals=$(echo $opponent_goals | tr -d '\r')
    
    # Get team IDs
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
    
    # Insert game
    $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
           VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals)"
done
