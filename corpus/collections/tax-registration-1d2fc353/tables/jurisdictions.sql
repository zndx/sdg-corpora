CREATE TABLE jurisdictions (
  jurisdiction_code VARCHAR(44) NOT NULL,
  jurisdiction_name VARCHAR(32),
  jurisdiction_type VARCHAR(32),
  is_special_category BOOLEAN,
  turnover_threshold DECIMAL,
  trader_id INTEGER,
  registration_id INTEGER,
  PRIMARY KEY (jurisdiction_code),
  FOREIGN KEY (trader_id) REFERENCES traders (id),
  FOREIGN KEY (registration_id) REFERENCES tax_registrations (registration_id)
);
