CREATE TABLE judgments (
  id INTEGER NOT NULL,
  judgment_id VARCHAR(35),
  ruling_type VARCHAR(32),
  sentence_length DECIMAL,
  fine_amount DECIMAL,
  legal_reasoning VARCHAR(32),
  appeal_status VARCHAR(32),
  legal_case_id INTEGER,
  legal_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id)
);
