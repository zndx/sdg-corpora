CREATE TABLE clinical_outcomes (
  id INTEGER NOT NULL,
  outcome_id VARCHAR(32),
  outcome_name VARCHAR(32),
  measurement_type VARCHAR(32),
  unit VARCHAR(32),
  clinical_study_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id)
);
