CREATE TABLE taxable_supplies (
  id INTEGER NOT NULL,
  supply_id VARCHAR(44),
  supply_date DATE,
  supply_type VARCHAR(32),
  is_exempted BOOLEAN,
  value DECIMAL,
  tax_rate DECIMAL,
  trader_id INTEGER,
  received_by_trader_id INTEGER,
  jurisdiction_code VARCHAR(44),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (trader_id) REFERENCES traders (id),
  FOREIGN KEY (received_by_trader_id) REFERENCES traders (id),
  FOREIGN KEY (jurisdiction_code) REFERENCES jurisdictions (jurisdiction_code)
);
