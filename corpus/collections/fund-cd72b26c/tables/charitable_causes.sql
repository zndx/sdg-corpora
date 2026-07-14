CREATE TABLE charitable_causes (
  id INTEGER NOT NULL,
  cause_identifier VARCHAR(32),
  cause_name VARCHAR(32),
  cause_category VARCHAR(32),
  total_donations_received DECIMAL,
  donation_frequency VARCHAR(32),
  next_donation_date DATE,
  tax_exempt_status BOOLEAN,
  geographic_focus VARCHAR(32),
  fund_id INTEGER,
  underlying_fund_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id)
);
