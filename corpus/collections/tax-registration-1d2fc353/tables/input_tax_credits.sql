CREATE TABLE input_tax_credits (
  id INTEGER NOT NULL,
  credit_id VARCHAR(35),
  credit_amount VARCHAR(32),
  credit_date DATE,
  status VARCHAR(32),
  linked_supply_id VARCHAR(35),
  trader_id INTEGER,
  taxable_supply_id INTEGER,
  registration_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (trader_id) REFERENCES traders (id),
  FOREIGN KEY (taxable_supply_id) REFERENCES taxable_supplies (id),
  FOREIGN KEY (registration_id) REFERENCES tax_registrations (registration_id)
);
