#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT sum(winner_goals+opponent_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT avg(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT round(avg(winner_goals),2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT avg(winner_goals+opponent_goals) FROM games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT max(winner_goals) FROM games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT count(game_id) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams RIGHT JOIN games ON team_id = winner_id WHERE year = 2018 AND round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT (name) FROM teams LEFT JOIN games winners ON team_id = winners.winner_id LEFT JOIN games opponents ON team_id = opponents.opponent_id WHERE (winners.year = 2014 AND winners.round = 'Eighth-Final') OR (opponents.year = 2014 AND opponents.round = 'Eighth-Final') ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT (name) FROM teams RIGHT JOIN games ON team_id = winner_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year,name FROM games LEFT JOIN teams ON winner_id = team_id WHERE round = 'Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT name FROM teams WHERE name LIKE 'Co%' ORDER BY name")"
