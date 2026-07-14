CREATE TABLE cred_degree_programs (
  degree_program_id INTEGER NOT NULL,
  program_name VARCHAR(32),
  degree_type VARCHAR(32),
  duration_years INTEGER,
  field_of_study VARCHAR(32),
  educational_institution_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (degree_program_id),
  FOREIGN KEY (educational_institution_id) REFERENCES cred_educational_institutions (educational_institution_id),
  FOREIGN KEY (person_id) REFERENCES cred_persons (id)
);
