CREATE TABLE legal_publications (
  id INTEGER NOT NULL,
  pub_id VARCHAR(44),
  title VARCHAR(32),
  publication_date DATE,
  publisher VARCHAR(32),
  journal_name VARCHAR(32),
  topic VARCHAR(32),
  legal_person_id INTEGER,
  legal_case_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (legal_person_id) REFERENCES legal_persons (legal_person_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id)
);
