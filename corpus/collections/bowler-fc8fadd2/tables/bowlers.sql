CREATE TABLE bowlers (
  id INTEGER NOT NULL,
  book_id VARCHAR(32),
  full_name VARCHAR(36),
  declared_average DECIMAL,
  verified_average DECIMAL,
  residential_address VARCHAR(32),
  tournament_id INTEGER,
  disqualification_letter_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id),
  FOREIGN KEY (disqualification_letter_id) REFERENCES disqualification_letters (id)
);
