CREATE TABLE studies_interventions (
  clinical_study_id INTEGER NOT NULL,
  intervention_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (clinical_study_id, intervention_id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id),
  FOREIGN KEY (intervention_id) REFERENCES interventions (intervention_id)
);
