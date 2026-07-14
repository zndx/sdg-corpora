CREATE TABLE security_incidents (
  incident_id VARCHAR(32) NOT NULL,
  incident_type VARCHAR(32),
  severity_level INTEGER,
  reported_date TIMESTAMP,
  is_resolved BOOLEAN,
  resulting_action VARCHAR(32),
  network_account_id INTEGER,
  network_administrator_admin_id VARCHAR(44),
  acceptable_use_policy_id INTEGER,
  PRIMARY KEY (incident_id),
  FOREIGN KEY (network_account_id) REFERENCES network_accounts (id),
  FOREIGN KEY (network_administrator_admin_id) REFERENCES network_administrators (admin_id),
  FOREIGN KEY (acceptable_use_policy_id) REFERENCES acceptable_use_policies (id)
);
