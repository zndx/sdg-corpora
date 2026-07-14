CREATE TABLE legal_outcomes (
  legal_outcome_id INTEGER NOT NULL,
  outcome_type VARCHAR(32),
  date_issued TIMESTAMP,
  sentence_length INTEGER,
  fine_amount DECIMAL,
  is_appealed BOOLEAN,
  legal_case_id INTEGER,
  legal_statute_id INTEGER,
  PRIMARY KEY (legal_outcome_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (legal_case_id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id)
);
