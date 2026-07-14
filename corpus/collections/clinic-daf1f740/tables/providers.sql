CREATE TABLE providers (
  provider_id INTEGER NOT NULL,
  full_name VARCHAR(36),
  credential VARCHAR(32),
  state_license VARCHAR(32),
  employment_status VARCHAR(32),
  years_experience INTEGER,
  ed_experience_years INTEGER,
  resides_in_state VARCHAR(32),
  clinic_id INTEGER,
  program_id INTEGER,
  PRIMARY KEY (provider_id),
  FOREIGN KEY (clinic_id) REFERENCES clinics (id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id)
);
