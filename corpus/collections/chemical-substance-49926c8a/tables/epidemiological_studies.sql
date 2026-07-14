CREATE TABLE epidemiological_studies (
  study_id VARCHAR(32) NOT NULL,
  study_start_date DATE,
  study_end_date DATE,
  population_size INTEGER,
  exposure_level VARCHAR(32),
  cohort_location VARCHAR(32),
  cancer_types_observed VARCHAR(32),
  mortality_increase DECIMAL,
  chemical_substance_id INTEGER,
  carcinogenicity_assessment_id INTEGER,
  PRIMARY KEY (study_id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id),
  FOREIGN KEY (carcinogenicity_assessment_id) REFERENCES carcinogenicity_assessments (carcinogenicity_assessment_id)
);
