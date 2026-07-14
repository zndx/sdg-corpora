CREATE TABLE safeguarding_procedures (
  safeguarding_procedure_id INTEGER NOT NULL,
  procedure_code VARCHAR(44),
  procedure_name VARCHAR(32),
  trigger_condition VARCHAR(32),
  response_time_limit DECIMAL,
  status VARCHAR(32),
  assigned_role VARCHAR(32),
  incident_report_id INTEGER,
  PRIMARY KEY (safeguarding_procedure_id),
  FOREIGN KEY (incident_report_id) REFERENCES incident_reports (id)
);
