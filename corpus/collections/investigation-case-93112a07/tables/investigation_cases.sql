CREATE TABLE investigation_cases (
  case_id VARCHAR(32) NOT NULL,
  case_title VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  case_status VARCHAR(32),
  case_type VARCHAR(32),
  data_volume DECIMAL,
  lab_id INTEGER,
  engine_id INTEGER,
  data_analysis_tool_id INTEGER,
  PRIMARY KEY (case_id),
  FOREIGN KEY (lab_id) REFERENCES legal_tech_solution_labs (lab_id),
  FOREIGN KEY (engine_id) REFERENCES a_i_engines (engine_id),
  FOREIGN KEY (data_analysis_tool_id) REFERENCES data_analysis_tools (id)
);
