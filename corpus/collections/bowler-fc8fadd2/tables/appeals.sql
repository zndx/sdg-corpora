CREATE TABLE appeals (
  appeal_id INTEGER NOT NULL,
  submission_date TIMESTAMP,
  postmark_date DATE,
  is_written BOOLEAN,
  outcome VARCHAR(32),
  disqualification_letter_id INTEGER,
  bowler_id INTEGER,
  tournament_id INTEGER,
  PRIMARY KEY (appeal_id),
  FOREIGN KEY (disqualification_letter_id) REFERENCES disqualification_letters (id),
  FOREIGN KEY (bowler_id) REFERENCES bowlers (id),
  FOREIGN KEY (tournament_id) REFERENCES tournaments (id)
);
