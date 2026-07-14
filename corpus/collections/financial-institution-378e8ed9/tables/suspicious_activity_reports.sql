CREATE TABLE suspicious_activity_reports (
  sar_id VARCHAR(44) NOT NULL,
  filing_date TIMESTAMP,
  status VARCHAR(32),
  triggering_transaction_id VARCHAR(44),
  flagging_specialist_id VARCHAR(32),
  client_id VARCHAR(32),
  banking_division_id INTEGER,
  deficiency_id VARCHAR(32),
  PRIMARY KEY (sar_id),
  FOREIGN KEY (client_id) REFERENCES high_risk_clients (client_id),
  FOREIGN KEY (banking_division_id) REFERENCES banking_divisions (id),
  FOREIGN KEY (deficiency_id) REFERENCES compliance_deficiencies (deficiency_id)
);
