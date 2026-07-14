CREATE TABLE mechanism_of_carcinogenesises (
  id INTEGER NOT NULL,
  mechanism_id VARCHAR(32),
  mechanism_name VARCHAR(32),
  is_necessary_step BOOLEAN,
  is_sufficient_step BOOLEAN,
  observed_in_species VARCHAR(32),
  biological_response VARCHAR(84),
  chemical_substance_id INTEGER,
  receptor_id INTEGER,
  carcinogenicity_assessment_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id),
  FOREIGN KEY (receptor_id) REFERENCES biological_receptors (receptor_id),
  FOREIGN KEY (carcinogenicity_assessment_id) REFERENCES carcinogenicity_assessments (carcinogenicity_assessment_id)
);
