CREATE TABLE legal_tech_solution_labs (
  lab_id INTEGER NOT NULL,
  lab_name VARCHAR(32),
  location VARCHAR(32),
  establishment_date DATE,
  isms_compliant BOOLEAN,
  service_scope VARCHAR(32),
  supported_languages VARCHAR(32),
  discovery_operation_center_id INTEGER,
  forensic_operation_center_id INTEGER,
  engine_id INTEGER,
  data_analysis_tool_id INTEGER,
  PRIMARY KEY (lab_id),
  FOREIGN KEY (discovery_operation_center_id) REFERENCES discovery_operation_centers (discovery_operation_center_id),
  FOREIGN KEY (forensic_operation_center_id) REFERENCES forensic_operation_centers (forensic_operation_center_id),
  FOREIGN KEY (engine_id) REFERENCES a_i_engines (engine_id),
  FOREIGN KEY (data_analysis_tool_id) REFERENCES data_analysis_tools (id)
);
