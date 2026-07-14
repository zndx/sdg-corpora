CREATE TABLE security_audits (
  audit_id VARCHAR(32) NOT NULL,
  audit_date TIMESTAMP,
  auditor_name VARCHAR(32),
  findings_count INTEGER,
  risk_rating VARCHAR(32),
  network_segment_id INTEGER,
  security_policy_id INTEGER,
  vulnerability_report_id INTEGER,
  PRIMARY KEY (audit_id),
  FOREIGN KEY (network_segment_id) REFERENCES network_segments (network_segment_id),
  FOREIGN KEY (security_policy_id) REFERENCES security_policies (id),
  FOREIGN KEY (vulnerability_report_id) REFERENCES vulnerability_reports (vulnerability_report_id)
);
