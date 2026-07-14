CREATE TABLE animal_carcinogenicity_studies (
  id INTEGER NOT NULL,
  study_id VARCHAR(32),
  study_start_date DATE,
  study_end_date DATE,
  animal_species VARCHAR(32),
  exposure_route VARCHAR(32),
  tissue_sites_affected VARCHAR(32),
  dose_dependent BOOLEAN,
  tumor_incidence DECIMAL,
  chemical_substance_id INTEGER,
  carcinogenicity_assessment_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id),
  FOREIGN KEY (carcinogenicity_assessment_id) REFERENCES carcinogenicity_assessments (carcinogenicity_assessment_id)
);
