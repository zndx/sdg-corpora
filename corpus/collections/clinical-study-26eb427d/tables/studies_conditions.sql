CREATE TABLE studies_conditions (
  clinical_study_id INTEGER NOT NULL,
  medical_condition_id INTEGER NOT NULL,
  PRIMARY KEY (clinical_study_id, medical_condition_id),
  FOREIGN KEY (clinical_study_id) REFERENCES clinical_studies (clinical_study_id),
  FOREIGN KEY (medical_condition_id) REFERENCES medical_conditions (id)
);
