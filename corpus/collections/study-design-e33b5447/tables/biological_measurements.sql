CREATE TABLE biological_measurements (
  measurement_id INTEGER NOT NULL,
  measurement_value DECIMAL,
  unit_of_measure VARCHAR(32),
  measurement_date TIMESTAMP,
  measurement_type VARCHAR(32),
  reference_standard VARCHAR(32),
  status VARCHAR(32),
  dataset_id INTEGER,
  research_method_id INTEGER,
  individual_participant_id VARCHAR(44),
  PRIMARY KEY (measurement_id),
  FOREIGN KEY (dataset_id) REFERENCES datasets (id),
  FOREIGN KEY (research_method_id) REFERENCES research_methods (id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id)
);
