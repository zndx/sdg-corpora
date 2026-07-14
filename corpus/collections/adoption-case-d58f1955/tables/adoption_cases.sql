CREATE TABLE adoption_cases (
  id INTEGER NOT NULL,
  case_identifier VARCHAR(32),
  filing_date DATE,
  jurisdiction_code VARCHAR(44),
  case_status VARCHAR(32),
  court_docket_number VARCHAR(32),
  adoption_petitioner_id INTEGER,
  adult_to_be_adopted_social_security_number VARCHAR(32),
  n_l_f_representative_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (adoption_petitioner_id) REFERENCES adoption_petitioners (id),
  FOREIGN KEY (adult_to_be_adopted_social_security_number) REFERENCES adult_to_be_adopteds (social_security_number),
  FOREIGN KEY (n_l_f_representative_id) REFERENCES n_l_f_representatives (n_l_f_representative_id)
);
