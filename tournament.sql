-- Table definitions for the tournament project.

-- Drop database if it already exists.
DROP DATABASE IF EXISTS tournament;

-- Create database "tournament".
CREATE DATABASE tournament;

-- Connect to the database "tournament".
\c tournament

-- Drop table of view if it already exists.
DROP TABLE IF EXISTS players, matches CASCADE;
DROP VIEW IF EXISTS view_wins, view_losses, standings;

-- Table "players" will have id and names.
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Table "matches" will have match results.
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    winner INT REFERENCES players(player_id),
    loser INT REFERENCES players(player_id)
);

-- View "view_wins" counts wins on table matches by players.id.
CREATE VIEW view_wins AS
SELECT players.id AS player, count(matches.winner) AS wins
FROM players LEFT JOIN matches
ON players.id = matches.winner
GROUP BY players.id, matches.winner
ORDER BY players.id;

-- View "view_losses" counts losses on table matches by players.id.
CREATE VIEW view_losses AS
SELECT players.id AS player, count(matches.loser) AS losses
FROM players LEFT JOIN matches
ON players.id = matches.loser
GROUP BY players.id, matches.loser
ORDER BY players.id;

-- View "standings" shows player's id, name, number of wins, and matches.
CREATE VIEW standings AS
SELECT players.id, players.name, view_wins.wins as wins,
view_wins.wins + view_losses.losses as matches,
FROM players, view_wins, view_losses
WHERE players.id = view_wins.player and view_losses.player = view_wins.player
ORDER BY wins DESC;




