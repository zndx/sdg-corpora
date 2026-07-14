CREATE TABLE adoption_cases (
  case_id VARCHAR(32) NOT NULL,
  filing_date DATE,
  status VARCHAR(32),
  jurisdiction VARCHAR(32),
  case_notes VARCHAR(32),
  petitioner_contact_person VARCHAR(32),
  nlf_rep VARCHAR(32),
  adoption_petitioner_social_security_number VARCHAR(32),
  adult_adoptee_id INTEGER,
  PRIMARY KEY (case_id),
  FOREIGN KEY (adoption_petitioner_social_security_number) REFERENCES adoption_petitioners (social_security_number),
  FOREIGN KEY (adult_adoptee_id) REFERENCES adult_adoptees (id)
);
