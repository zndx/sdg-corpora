CREATE TABLE data_analysis_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  tool_type VARCHAR(32),
  developer VARCHAR(32),
  version VARCHAR(32),
  features VARCHAR(32),
  lab_id INTEGER,
  case_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (lab_id) REFERENCES legal_tech_solution_labs (lab_id),
  FOREIGN KEY (case_id) REFERENCES investigation_cases (case_id)
);
