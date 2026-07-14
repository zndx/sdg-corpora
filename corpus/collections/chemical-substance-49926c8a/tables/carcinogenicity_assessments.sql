CREATE TABLE carcinogenicity_assessments (
  carcinogenicity_assessment_id INTEGER NOT NULL,
  assessment_date TIMESTAMP,
  carcinogenicity_status VARCHAR(60),
  evidence_level VARCHAR(32),
  reporting_body VARCHAR(32),
  report_year INTEGER,
  report_title VARCHAR(32),
  is_mutagenic BOOLEAN,
  genotoxicity_findings VARCHAR(32),
  chemical_substance_id INTEGER,
  mechanism_of_carcinogenesis_id INTEGER,
  PRIMARY KEY (carcinogenicity_assessment_id),
  FOREIGN KEY (chemical_substance_id) REFERENCES chemical_substances (chemical_substance_id),
  FOREIGN KEY (mechanism_of_carcinogenesis_id) REFERENCES mechanism_of_carcinogenesises (id)
);
