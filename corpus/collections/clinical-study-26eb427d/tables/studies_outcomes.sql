CREATE TABLE studies_outcomes (
  clinical_study_id INTEGER NOT NULL,
  clinical_outcome_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_study_id, clinical_outcome_id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id),
  FOREIGN KEY (clinical_outcome_id) REFERENCES clinical_outcomes (id)
);
