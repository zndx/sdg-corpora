CREATE TABLE patients (
  patient_id VARCHAR(32) NOT NULL,
  full_name VARCHAR(36),
  age_group VARCHAR(32),
  diagnosis VARCHAR(32),
  insurance_provider VARCHAR(32),
  has_caregiver BOOLEAN,
  enrolled_in_program BOOLEAN,
  provider_id INTEGER,
  program_id INTEGER,
  PRIMARY KEY (patient_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id)
);
