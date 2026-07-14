CREATE TABLE traffic_control_signs (
  traffic_control_sign_id INTEGER NOT NULL,
  sign_identifier VARCHAR(32),
  sign_type VARCHAR(32),
  installation_date DATE,
  last_inspection_date DATE,
  compliance_status VARCHAR(32),
  manual_revision VARCHAR(32),
  street_segment_id INTEGER,
  rule_code VARCHAR(44),
  PRIMARY KEY (traffic_control_sign_id),
  FOREIGN KEY (street_segment_id) REFERENCES street_segments (id),
  FOREIGN KEY (rule_code) REFERENCES traffic_rules (rule_code)
);
