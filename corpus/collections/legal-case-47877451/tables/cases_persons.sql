CREATE TABLE cases_persons (
  legal_case_id INTEGER NOT NULL,
  legal_person_id INTEGER NOT NULL,
  PRIMARY KEY (legal_case_id, legal_person_id),
  FOREIGN KEY (legal_case_id) REFERENCES legal_cases (id),
  FOREIGN KEY (legal_person_id) REFERENCES legal_persons (legal_person_id)
);
