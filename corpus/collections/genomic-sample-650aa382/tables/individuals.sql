CREATE TABLE individuals (
  id INTEGER NOT NULL,
  individual_id VARCHAR(44),
  date_of_birth DATE,
  sex VARCHAR(32),
  enrollment_status VARCHAR(32),
  insurance_provider VARCHAR(32),
  health_record_id INTEGER,
  clinical_program_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (health_record_id) REFERENCES health_records (health_record_id),
  FOREIGN KEY (clinical_program_id) REFERENCES clinical_programs (clinical_program_id)
);
