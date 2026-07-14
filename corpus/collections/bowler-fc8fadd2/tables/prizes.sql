CREATE TABLE prizes (
  prize_id INTEGER NOT NULL,
  prize_type VARCHAR(32),
  prize_value DECIMAL,
  eligibility_status VARCHAR(32),
  bowler_id INTEGER,
  tournament_id INTEGER,
  PRIMARY KEY (prize_id),
  FOREIGN KEY (bowler_id) REFERENCES bowlers (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
);
