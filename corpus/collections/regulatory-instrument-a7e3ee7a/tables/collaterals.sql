CREATE TABLE collaterals (
  id INTEGER NOT NULL,
  collateral_identifier VARCHAR(32),
  asset_type VARCHAR(32),
  issuing_entity VARCHAR(32),
  credit_quality_rating VARCHAR(32),
  denomination VARCHAR(32),
  eligibility_status VARCHAR(32),
  wrong_way_risk BOOLEAN,
  financial_counterparty_id INTEGER,
  o_t_c_derivative_trade_id INTEGER,
  regulatory_instrument_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (financial_counterparty_id) REFERENCES financial_counterparties (financial_counterparty_id),
  FOREIGN KEY (o_t_c_derivative_trade_id) REFERENCES o_t_c_derivative_trades (id),
  FOREIGN KEY (regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id)
);
