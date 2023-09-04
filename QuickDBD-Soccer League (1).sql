-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/gsUiP3
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP DATABASE soccer_league
CREATE DATABASE soccer_league
\c soccer_league

CREATE TABLE 'teams' (
    'team_id' SERIAL  NOT NULL ,
    'name' TEXT  NOT NULL ,
    'city' TEXT  NOT NULL ,
    PRIMARY KEY (
        'team_id'
    )
);

CREATE TABLE 'players' (
    'player_id' SERIAL  NOT NULL ,
    'name' TEXT  NOT NULL ,
    'current_team' TEXT  NOT NULL ,
    PRIMARY KEY (
        'player_id'
    )
);

CREATE TABLE 'goals' (
    'goals_id' SERIAL  NOT NULL ,
    'player_id' INTEGER  NOT NULL ,
    'matches_id' INTEGER  NOT NULL 
);

CREATE TABLE 'matches' (
    'match_id' SERIAL  NOT NULL ,
    'home_team' TEXT  NOT NULL ,
    'away_team' TEXT  NOT NULL ,
    'location' TEXT  NOT NULL ,
    'date' TEXT  NOT NULL ,
    'season_id' INTEGER  NOT NULL ,
    'referees' TEXT  NOT NULL ,
    PRIMARY KEY (
        'match_id'
    )
);

CREATE TABLE 'referees' (
    'referee_id' SERIAL  NOT NULL ,
    'name' TEXT  NOT NULL ,
    PRIMARY KEY (
        'referee_id'
    )
);

CREATE TABLE 'seasons' (
    'season_id' SERIAL  NOT NULL ,
    'start_date' TEXT  NOT NULL ,
    'end_date' TEXT  NOT NULL 
);

CREATE TABLE 'results' (
    'result_id' SERIAL  NOT NULL ,
    'team_id' INTEGER  NOT NULL ,
    'match_id' INTEGER  NOT NULL ,
    'result' INTEGER  NOT NULL 
);

ALTER TABLE 'players' ADD CONSTRAINT 'fk_players_current_team' FOREIGN KEY('current_team')
REFERENCES 'teams' ('team_id');

ALTER TABLE 'goals' ADD CONSTRAINT 'fk_goals_player_id' FOREIGN KEY('player_id')
REFERENCES 'players' ('player_id');

ALTER TABLE 'goals' ADD CONSTRAINT 'fk_goals_matches_id' FOREIGN KEY('matches_id')
REFERENCES 'matches' ('match_id');

ALTER TABLE 'matches' ADD CONSTRAINT 'fk_matches_home_team' FOREIGN KEY('home_team')
REFERENCES 'teams' ('team_id');

ALTER TABLE 'matches' ADD CONSTRAINT 'fk_matches_away_team' FOREIGN KEY('away_team')
REFERENCES 'teams' ('team_id');

ALTER TABLE 'matches' ADD CONSTRAINT 'fk_matches_season_id' FOREIGN KEY('season_id')
REFERENCES 'seasons' ('season_id');

ALTER TABLE 'matches' ADD CONSTRAINT 'fk_matches_referees' FOREIGN KEY('referees')
REFERENCES 'referees' ('referee_id');

ALTER TABLE 'results' ADD CONSTRAINT 'fk_results_team_id' FOREIGN KEY('team_id')
REFERENCES 'teams' ('team_id');

ALTER TABLE 'results' ADD CONSTRAINT 'fk_results_match_id' FOREIGN KEY('match_id')
REFERENCES 'matches' ('match_id');

