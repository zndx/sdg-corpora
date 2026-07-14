CREATE TABLE competitions_divisions (
  competition_id INTEGER NOT NULL,
  division_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (competition_id, division_id),
  FOREIGN KEY (competition_id) REFERENCES competitions (id),
  FOREIGN KEY (division_id) REFERENCES competition_divisions (division_id)
);
