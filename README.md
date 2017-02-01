# Tournament-Results
Using Python and PostgreSQL, a database is created to track results for a swiss-style game tournament.

## How To Run
1. Install **Python 2** and **PostgreSQL**
2. Go to web server via SSH
3. Run:
<code>
$ psql
</code>
<code>
$ \i tournament.sql
</code>
4. To run the unit tests:
<code>
$ python tournament_test.py
</code>

## Functions
 connect() = connect to the postgreSQL database
 deleteMatches() = remove all the match records from the database
 deletePlayers() = removed all the player records from the database
 countPlayers() = returns the number of players currently registered
 registerPlayer(name) = adds a player to the tournament database
 playerStandings() = returns a list of the players and their win records, sorted by wins
 reportMatch(winner, loser) = records the outcome of a single match between two players
 swissPairings() = returns a list of pairs of players for the next round of a match

## Tables

**PLAYERS**
id = unique player id
name = player's name

**MATCHES**
id = unique match id
winner = player id of winner
loser = player id of loser

**VIEW_WINS** _(view)_
Keeps track of the number of wins for each player.

**VIEW_LOSSES** _(view)_
Keeps track of the number of losses for each player.

**STANDINGS** _(view)_
Shows player's id, player's name, number of wins, and number of total matches played.
