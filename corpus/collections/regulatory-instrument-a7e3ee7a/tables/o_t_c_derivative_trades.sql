CREATE TABLE o_t_c_derivative_trades (
  id INTEGER NOT NULL,
  trade_identifier VARCHAR(32),
  trade_date TIMESTAMP,
  trade_type VARCHAR(32),
  settlement_type VARCHAR(32),
  notional_amount VARCHAR(32),
  currency VARCHAR(32),
  maturity_date TIMESTAMP,
  status VARCHAR(32),
  netting_agreement_id INTEGER,
  collateral_id INTEGER,
  regulatory_instrument_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (netting_agreement_id) REFERENCES netting_agreements (id),
  FOREIGN KEY (collateral_id) REFERENCES collaterals (id),
  FOREIGN KEY (regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id)
);
