CREATE TABLE a_i_engines (
  engine_id INTEGER NOT NULL,
  engine_name VARCHAR(32),
  version VARCHAR(32),
  training_data VARCHAR(32),
  supported_languages VARCHAR(32),
  processing_efficiency DECIMAL,
  lab_id INTEGER,
  case_id VARCHAR(32),
  PRIMARY KEY (engine_id),
  FOREIGN KEY (lab_id) REFERENCES legal_tech_solution_labs (lab_id),
  FOREIGN KEY (case_id) REFERENCES investigation_cases (case_id)
);
