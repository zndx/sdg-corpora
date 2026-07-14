CREATE TABLE funds_funds (
  fund_id INTEGER NOT NULL,
  underlying_fund_id INTEGER NOT NULL,
  PRIMARY KEY (fund_id, underlying_fund_id),
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id)
);
