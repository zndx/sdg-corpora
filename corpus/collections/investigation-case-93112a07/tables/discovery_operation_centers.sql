CREATE TABLE discovery_operation_centers (
  discovery_operation_center_id INTEGER NOT NULL,
  center_id VARCHAR(32),
  center_name VARCHAR(32),
  focus_area VARCHAR(32),
  data_sources VARCHAR(32),
  analysis_techniques VARCHAR(37),
  lab_id INTEGER,
  case_id VARCHAR(32),
  PRIMARY KEY (discovery_operation_center_id),
  FOREIGN KEY (lab_id) REFERENCES legal_tech_solution_labs (lab_id),
  FOREIGN KEY (case_id) REFERENCES investigation_cases (case_id)
);
