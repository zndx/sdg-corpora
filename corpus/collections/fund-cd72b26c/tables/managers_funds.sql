CREATE TABLE managers_funds (
  fund_manager_id INTEGER NOT NULL,
  underlying_fund_id INTEGER NOT NULL,
  PRIMARY KEY (fund_manager_id, underlying_fund_id),
  FOREIGN KEY (fund_manager_id) REFERENCES fund_managers (fund_manager_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id)
);
