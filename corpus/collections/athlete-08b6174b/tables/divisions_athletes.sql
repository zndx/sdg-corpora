CREATE TABLE divisions_athletes (
  division_id VARCHAR(32) NOT NULL,
  athlete_id INTEGER NOT NULL,
  PRIMARY KEY (division_id, athlete_id),
  FOREIGN KEY (division_id) REFERENCES competition_divisions (division_id),
  FOREIGN KEY (athlete_id) REFERENCES athletes (id)
);
