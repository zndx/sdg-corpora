CREATE TABLE competition_records (
  id INTEGER NOT NULL,
  record_id INTEGER,
  competition_name VARCHAR(32),
  competition_level INTEGER,
  competition_date DATE,
  result VARCHAR(32),
  competition_type VARCHAR(32),
  horse_id INTEGER,
  evaluator_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (horse_id) REFERENCES horses (id),
  FOREIGN KEY (evaluator_id) REFERENCES evaluators (id)
);
