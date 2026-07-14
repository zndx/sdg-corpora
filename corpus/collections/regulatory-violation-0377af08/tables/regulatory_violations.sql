CREATE TABLE regulatory_violations (
  regulatory_violation_id INTEGER NOT NULL,
  violation_id VARCHAR(32),
  description VARCHAR(32),
  regulatory_reference VARCHAR(32),
  severity_level VARCHAR(32),
  status VARCHAR(32),
  inspection_report_id VARCHAR(44),
  date_identified TIMESTAMP,
  reported_in_inspection_report_id INTEGER,
  corrective_action_plan_id INTEGER,
  PRIMARY KEY (regulatory_violation_id),
  FOREIGN KEY (reported_in_inspection_report_id) REFERENCES inspection_reports (id),
  FOREIGN KEY (corrective_action_plan_id) REFERENCES corrective_action_plans (corrective_action_plan_id)
);
