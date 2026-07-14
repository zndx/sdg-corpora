CREATE TABLE compliance_investigations (
  id INTEGER NOT NULL,
  investigation_id VARCHAR(44),
  initiation_date TIMESTAMP,
  status VARCHAR(32),
  issuing_authority VARCHAR(32),
  finding_severity VARCHAR(32),
  penalty_amount VARCHAR(32),
  financial_institution_id INTEGER,
  compliance_investigation_id INTEGER,
  deficiency_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (compliance_investigation_id) REFERENCES compliance_investigations (id),
  FOREIGN KEY (deficiency_id) REFERENCES compliance_deficiencies (deficiency_id)
);
