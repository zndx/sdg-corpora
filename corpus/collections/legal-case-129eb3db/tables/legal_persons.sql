CREATE TABLE legal_persons (
  legal_person_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  role VARCHAR(32),
  qualification VARCHAR(32),
  bar_circuit VARCHAR(32),
  specialization VARCHAR(32),
  legal_case_id INTEGER,
  professional_body_id INTEGER,
  PRIMARY KEY (legal_person_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (legal_case_id),
  FOREIGN KEY (professional_body_id) REFERENCES professional_bodies (id)
);
