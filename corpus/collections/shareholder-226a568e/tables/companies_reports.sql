CREATE TABLE companies_reports (
  company_id VARCHAR(32) NOT NULL,
  financial_report_id INTEGER NOT NULL,
  PRIMARY KEY (company_id, financial_report_id),
  FOREIGN KEY (company_id) REFERENCES companies (company_id),
  FOREIGN KEY (financial_report_id) REFERENCES financial_reports (id)
);
