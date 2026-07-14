CREATE TABLE disputes_players (
  dispute_id INTEGER NOT NULL,
  player_id INTEGER NOT NULL,
  PRIMARY KEY (dispute_id, player_id),
  FOREIGN KEY (dispute_id) REFERENCES disputes (id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);
