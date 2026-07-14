CREATE TABLE regulatory_frameworks (
  id INTEGER NOT NULL,
  framework_identifier VARCHAR(32),
  issuing_authority VARCHAR(32),
  jurisdiction VARCHAR(32),
  compliance_status VARCHAR(32),
  last_audit_date DATE,
  regulatory_type VARCHAR(32),
  financial_institution_id INTEGER,
  client_asset_portfolio_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (client_asset_portfolio_id) REFERENCES client_asset_portfolios (client_asset_portfolio_id)
);
