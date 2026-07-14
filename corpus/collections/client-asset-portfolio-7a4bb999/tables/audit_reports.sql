CREATE TABLE audit_reports (
  id INTEGER NOT NULL,
  report_identifier VARCHAR(32),
  audit_firm VARCHAR(32),
  report_date DATE,
  audit_type VARCHAR(32),
  findings_summary VARCHAR(32),
  compliance_rating VARCHAR(32),
  scope_description VARCHAR(32),
  financial_institution_id INTEGER,
  client_asset_portfolio_id INTEGER,
  regulatory_framework_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (client_asset_portfolio_id) REFERENCES client_asset_portfolios (client_asset_portfolio_id),
  FOREIGN KEY (regulatory_framework_id) REFERENCES regulatory_frameworks (id)
);
