CREATE TABLE informations_cases (
  contact_information_id INTEGER NOT NULL,
  case_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (contact_information_id, case_id),
  FOREIGN KEY (contact_information_id) REFERENCES contact_informations (contact_information_id),
  FOREIGN KEY (case_id) REFERENCES adoption_cases (case_id)
);
