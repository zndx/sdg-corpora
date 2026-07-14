CREATE TABLE adult_to_be_adopteds (
  full_legal_name VARCHAR(32),
  date_of_birth DATE,
  social_security_number VARCHAR(32) NOT NULL,
  residency_start_date DATE,
  birth_city VARCHAR(32),
  birth_state VARCHAR(32),
  preferred_post_adoption_name VARCHAR(32),
  residential_address_id INTEGER,
  adoption_case_id INTEGER,
  person_id INTEGER,
  has_birth_father_person_id INTEGER,
  PRIMARY KEY (social_security_number),
  FOREIGN KEY (residential_address_id) REFERENCES residential_addresses (residential_address_id),
  FOREIGN KEY (adoption_case_id) REFERENCES adoption_cases (id),
  FOREIGN KEY (person_id) REFERENCES persons (id),
  FOREIGN KEY (has_birth_father_person_id) REFERENCES persons (id)
);
