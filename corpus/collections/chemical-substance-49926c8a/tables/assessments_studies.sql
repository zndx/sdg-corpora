CREATE TABLE assessments_studies (
  carcinogenicity_assessment_id INTEGER NOT NULL,
  study_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (carcinogenicity_assessment_id, study_id),
  FOREIGN KEY (carcinogenicity_assessment_id) REFERENCES carcinogenicity_assessments (carcinogenicity_assessment_id),
  FOREIGN KEY (study_id) REFERENCES epidemiological_studies (study_id)
);
