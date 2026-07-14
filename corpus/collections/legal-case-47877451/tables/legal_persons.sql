CREATE TABLE legal_persons (
  legal_person_id INTEGER NOT NULL,
  person_id VARCHAR(32),
  full_name VARCHAR(36),
  role VARCHAR(32),
  jurisdiction VARCHAR(32),
  qualification_year INTEGER,
  specialization VARCHAR(32),
  legal_case_id INTEGER,
  judges_legal_case_id INTEGER,
  professional_body_id INTEGER,
  PRIMARY KEY (legal_person_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id),
  FOREIGN KEY (judges_legal_case_id) REFERENCES legal_cases (id),
  FOREIGN KEY (professional_body_id) REFERENCES professional_bodies (id)
);
