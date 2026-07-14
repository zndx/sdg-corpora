CREATE TABLE interventions (
  intervention_id VARCHAR(44) NOT NULL,
  intervention_name VARCHAR(32),
  type VARCHAR(32),
  dosage VARCHAR(32),
  clinical_study_id INTEGER,
  PRIMARY KEY (intervention_id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id)
);
