CREATE TABLE datasets (
  id INTEGER NOT NULL,
  dataset_id INTEGER,
  dataset_name VARCHAR(32),
  format VARCHAR(32),
  creation_date TIMESTAMP,
  record_count INTEGER,
  data_quality_score DECIMAL,
  storage_location VARCHAR(32),
  research_method_id INTEGER,
  study_design_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id),
  FOREIGN KEY (study_design_id) REFERENCES study_designs (id)
);
