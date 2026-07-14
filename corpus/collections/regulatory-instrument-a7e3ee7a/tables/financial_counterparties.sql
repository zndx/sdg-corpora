CREATE TABLE financial_counterparties (
  financial_counterparty_id INTEGER NOT NULL,
  counterparty_identifier VARCHAR(32),
  legal_name VARCHAR(32),
  entity_type VARCHAR(32),
  jurisdiction VARCHAR(32),
  registration_status VARCHAR(32),
  clearing_threshold_exceeded BOOLEAN,
  regulatory_instrument_id INTEGER,
  collateral_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (financial_counterparty_id),
  FOREIGN KEY (regulatory_instrument_id) REFERENCES regulatory_instruments (regulatory_instrument_id),
  FOREIGN KEY (collateral_id) REFERENCES collaterals (id)
);
