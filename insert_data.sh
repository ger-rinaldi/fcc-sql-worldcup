#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.


function get_clean_team_data() {

  # To diminish the need of querying the database for each row of games.csv
  # I decided to get all team names from the file itself and then insert them.
  # Otherwise, checking if both teams per row of games have been inserted, getting their id or inserting them,
  # would've slowed the process, reducing the chances to pass the tests.

  # Get all unique teams from winner csv field
  awk -F ',' '{print $3}' games.csv | sort | uniq > dirty_team_names.txt
  # Get all unique teams from opponent csv field
  awk -F ',' '{print $4}' games.csv | sort | uniq >> dirty_team_names.txt
  # Delete duplicate teams and rows with fieldname indicator
  cat dirty_team_names.txt | sort | uniq | sed '/\(winner\|opponent\)/d' > clean_team_names.txt

}


# Clear database before running
$PSQL "TRUNCATE TABLE games, teams CASCADE;"

# Get clean team names from the csv
get_clean_team_data

# Input teams to db from the clean file clean_team_names.txt
cat clean_team_names.txt | while read TEAM
do
  INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM');")
  
  # notify of errors or unexpected results
  if [[ $INSERT_TEAM_RESULT != 'INSERT 0 1' ]]
  then
    echo "INSERT TEAM $TEAM ERROR $INSERT_TEAM_RESULT"
  else
    # If no errors are found, get the ID of insert
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$TEAM';")
  fi

  # As stated in get_clean_team_data(), to reduce need of querying a temp file with each team and it's ID is created
  # that way the DB is not queried, hopefully improving time performance and test approval chances
  echo "$TEAM,$TEAM_ID" >> teams_with_id.txt

done



# tail -n +2: avoid reading the first line containing fieldnames
# IFS=',': change Internal Field Separator to comma
# read VARIABLES: get each field value
cat games.csv | tail -n +2 | while IFS=',' read YEAR ROUND WIN OPP WIN_GOAL OPP_GOAL
do

  # Here we 'query' the temporal file I created in the previous loop
  # This way we get the team_id without querying the DB
  GET_WIN_ID=$(cat teams_with_id.txt | grep "$WIN" | awk -F ',' '{print $2}')
  GET_OPP_ID=$(cat teams_with_id.txt | grep "$OPP" | awk -F ',' '{print $2}')
    
  GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $GET_WIN_ID, $GET_OPP_ID, $WIN_GOAL, $OPP_GOAL);")
  
  if [[ $GAME_INSERT_RESULT != 'INSERT 0 1' ]]
  then
    # Notify of errors and unexpected results using: Output, year and teams
    echo "INSERT ERROR $GAME_INSERT_RESULT $YEAR $GET_WIN_ID $GET_OPP_ID"
  fi
done

# A bit of tidying up...
rm dirty_team_names.txt clean_team_names.txt teams_with_id.txt
