CREATE TABLE legal_statutes (
  id INTEGER NOT NULL,
  statute_name VARCHAR(32),
  year_enacted INTEGER,
  section_number VARCHAR(32),
  jurisdiction VARCHAR(32),
  status VARCHAR(32),
  legal_case_id INTEGER,
  legal_statute_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (legal_case_id),
  FOREIGN KEY (legal_statute_id) REFERENCES legal_statutes (id)
);
