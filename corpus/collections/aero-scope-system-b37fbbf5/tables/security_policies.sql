CREATE TABLE security_policies (
  id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  policy_name VARCHAR(32),
  effective_date DATE,
  last_review_date DATE,
  compliance_status VARCHAR(32),
  network_segment_id INTEGER,
  audit_id VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id),
  FOREIGN KEY (audit_id) REFERENCES security_audits (audit_id)
);
