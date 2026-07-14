CREATE TABLE reading_challenges (
  id INTEGER NOT NULL,
  challenge_id VARCHAR(44),
  start_date DATE,
  end_date DATE,
  institution_name VARCHAR(32),
  year_group VARCHAR(32),
  status VARCHAR(32),
  PRIMARY KEY (id)
);
