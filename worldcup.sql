SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;

\c worldcup;

CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name CHARACTER VARYING(50) UNIQUE NOT NULL
);

CREATE TABLE games (
    game_id SERIAL PRIMARY KEY,
    year INTEGER NOT NULL,
    round CHARACTER VARYING(50) NOT NULL,
    winner_id INTEGER NOT NULL REFERENCES teams(team_id),
    opponent_id INTEGER NOT NULL REFERENCES teams(team_id),
    winner_goals INTEGER NOT NULL,
    opponent_goals INTEGER NOT NULL
);
