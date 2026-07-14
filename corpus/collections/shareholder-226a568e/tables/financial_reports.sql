CREATE TABLE financial_reports (
  id INTEGER NOT NULL,
  report_id VARCHAR(32),
  report_type VARCHAR(32),
  issuance_date DATE,
  fiscal_period VARCHAR(32),
  consolidation_status VARCHAR(32),
  publication_url VARCHAR(64),
  auditor_name VARCHAR(32),
  company_id VARCHAR(32),
  regulatory_authority_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (regulatory_authority_id) REFERENCES regulatory_authorities (id)
);
