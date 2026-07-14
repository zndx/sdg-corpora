CREATE TABLE compliance_deficiencies (
  deficiency_id VARCHAR(32) NOT NULL,
  category VARCHAR(32),
  description VARCHAR(32),
  discovery_date DATE,
  remediation_status VARCHAR(32),
  compliance_investigation_id INTEGER,
  banking_division_id INTEGER,
  client_id VARCHAR(32),
  PRIMARY KEY (deficiency_id),
  FOREIGN KEY (compliance_investigation_id) REFERENCES compliance_investigations (id),
  FOREIGN KEY (banking_division_id) REFERENCES banking_divisions (id),
  FOREIGN KEY (client_id) REFERENCES high_risk_clients (client_id)
);
