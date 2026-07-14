CREATE TABLE cred_educational_institutions (
  educational_institution_id INTEGER NOT NULL,
  institution_name VARCHAR(32),
  location_city VARCHAR(32),
  location_state VARCHAR(32),
  accreditation_status VARCHAR(32),
  founding_year INTEGER,
  person_id INTEGER,
  degree_program_id INTEGER,
  PRIMARY KEY (educational_institution_id),
  FOREIGN KEY (person_id) REFERENCES cred_persons (id),
  FOREIGN KEY (degree_program_id) REFERENCES cred_degree_programs (degree_program_id)
);
