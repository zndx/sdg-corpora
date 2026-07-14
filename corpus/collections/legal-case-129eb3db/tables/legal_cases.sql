CREATE TABLE legal_cases (
  legal_case_id INTEGER NOT NULL,
  case_identifier VARCHAR(32),
  court_name VARCHAR(32),
  case_type VARCHAR(32),
  date_filed TIMESTAMP,
  status VARCHAR(32),
  jurisdiction VARCHAR(32),
  legal_person_id INTEGER,
  has_prosecutor_legal_person_id INTEGER,
  legal_outcome_id INTEGER,
  legal_statute_id INTEGER,
  PRIMARY KEY (legal_case_id),
  FOREIGN KEY (legal_person_id) REFERENCES legal_persons (legal_person_id),
  FOREIGN KEY (has_prosecutor_legal_person_id) REFERENCES legal_persons (legal_person_id),
  FOREIGN KEY (legal_outcome_id) REFERENCES legal_outcomes (legal_outcome_id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id)
);
