CREATE TABLE ethical_policy_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  publish_date DATE,
  report_title VARCHAR(32),
  issuing_institution VARCHAR(32),
  compliance_status VARCHAR(32),
  financial_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id)
);
