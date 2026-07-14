CREATE TABLE adoption_petitioners (
  id INTEGER NOT NULL,
  full_legal_name VARCHAR(32),
  date_of_birth DATE,
  social_security_number VARCHAR(32),
  residency_start_date DATE,
  relationship_to_adult VARCHAR(32),
  duration_of_acquaintance VARCHAR(32),
  residential_address_id INTEGER,
  adoption_case_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (residential_address_id) REFERENCES residential_addresses (residential_address_id),
  FOREIGN KEY (adoption_case_id) REFERENCES adoption_cases (id)
);
