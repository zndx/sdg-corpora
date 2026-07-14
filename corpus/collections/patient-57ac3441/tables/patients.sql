CREATE TABLE patients (
  id INTEGER NOT NULL,
  patient_id VARCHAR(32),
  age INTEGER,
  sex VARCHAR(32),
  diagnosis VARCHAR(32),
  clinical_profile_id INTEGER,
  session_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_profile_id) REFERENCES clinical_profiles (id),
  FOREIGN KEY (session_id) REFERENCES dialysis_sessions (session_id)
);
