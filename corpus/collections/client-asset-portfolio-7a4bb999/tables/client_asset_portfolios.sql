CREATE TABLE client_asset_portfolios (
  client_asset_portfolio_id INTEGER NOT NULL,
  portfolio_identifier VARCHAR(32),
  total_value_u_s_d DECIMAL,
  asset_type VARCHAR(32),
  segregation_status VARCHAR(32),
  custodian_entity VARCHAR(32),
  last_valuation_date TIMESTAMP,
  risk_rating VARCHAR(32),
  insurance_policy_id INTEGER,
  financial_institution_id INTEGER,
  regulatory_framework_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (client_asset_portfolio_id),
  FOREIGN KEY (insurance_policy_id) REFERENCES insurance_policies (insurance_policy_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (financial_institution_id),
  FOREIGN KEY (regulatory_framework_id) REFERENCES regulatory_frameworks (id)
);
