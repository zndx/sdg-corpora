CREATE TABLE medical_conditions (
  id INTEGER NOT NULL,
  condition_id VARCHAR(44),
  condition_name VARCHAR(32),
  category VARCHAR(32),
  clinical_study_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id)
);
