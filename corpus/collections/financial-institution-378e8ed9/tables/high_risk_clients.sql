CREATE TABLE high_risk_clients (
  client_id VARCHAR(32) NOT NULL,
  client_type VARCHAR(34),
  risk_rating INTEGER,
  jurisdiction VARCHAR(32),
  relationship_status VARCHAR(32),
  financial_institution_id INTEGER,
  banking_division_id INTEGER,
  suspicious_activity_report_sar_id VARCHAR(44),
  PRIMARY KEY (client_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (banking_division_id) REFERENCES banking_divisions (id),
  FOREIGN KEY (suspicious_activity_report_sar_id) REFERENCES suspicious_activity_reports (sar_id)
);
