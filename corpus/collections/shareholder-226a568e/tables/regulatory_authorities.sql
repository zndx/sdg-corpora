CREATE TABLE regulatory_authorities (
  id INTEGER NOT NULL,
  authority_id INTEGER,
  authority_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  regulation_code VARCHAR(44),
  bulletin_name VARCHAR(32),
  financial_report_id INTEGER,
  company_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (financial_report_id) REFERENCES financial_reports (id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id)
);
