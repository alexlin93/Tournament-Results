# Tournament-Results
Using Python and PostgreSQL, this is a database created to track results for a swiss-style game tournament. This project was created as part of the Udacity Full Stack Web Developer Nanodegree. I hope you enjoy it!

## Install
1. Install **Python 2** and **PostgreSQL**
2. Go into the directory
3. Run:
`$ psql
$ \i tournament.sql`
4. To run the unit tests:
`$ python tournament_test.py`

## How To Use
### Use these functions to build the database:
- connect() = connect to the postgreSQL database
- deleteMatches() = remove all the match records from the database
- deletePlayers() = removed all the player records from the database
- countPlayers() = returns the number of players currently registered
- registerPlayer(name) = adds a player to the tournament database
- playerStandings() = returns a list of the players and their win records, sorted by wins
- reportMatch(winner, loser) = records the outcome of a single match between two players
- swissPairings() = returns a list of pairs of players for the next round of a match

### These are the available tables you can build:

**PLAYERS**<br>
id = unique player id
name = player's name

**MATCHES**<br>
id = unique match id
winner = player id of winner
loser = player id of loser

**VIEW_WINS** _(view)_<br>
Keeps track of the number of wins for each player.

**VIEW_LOSSES** _(view)_<br>
Keeps track of the number of losses for each player.

**STANDINGS** _(view)_<br>
Shows player's id, player's name, number of wins, and number of total matches played.
