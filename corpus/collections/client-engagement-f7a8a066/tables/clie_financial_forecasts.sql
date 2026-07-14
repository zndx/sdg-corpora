CREATE TABLE clie_financial_forecasts (
  forecast_id VARCHAR(44) NOT NULL,
  forecast_type VARCHAR(32),
  projection_period VARCHAR(32),
  projected_revenue VARCHAR(32),
  projected_expenses DECIMAL,
  projected_net_cash DECIMAL,
  confidence_level VARCHAR(32),
  engagement_id INTEGER,
  financial_controller_id INTEGER,
  account_id VARCHAR(44),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (forecast_id),
  FOREIGN KEY (engagement_id) REFERENCES clie_client_engagements (engagement_id),
  FOREIGN KEY (financial_controller_id) REFERENCES clie_financial_controllers (financial_controller_id),
  FOREIGN KEY (account_id) REFERENCES clie_management_accounts (account_id)
);
