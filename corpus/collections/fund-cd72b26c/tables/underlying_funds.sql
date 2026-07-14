CREATE TABLE underlying_funds (
  underlying_fund_id INTEGER NOT NULL,
  underlying_fund_identifier VARCHAR(32),
  underlying_fund_name VARCHAR(32),
  management_fee_waived BOOLEAN,
  performance_fee_waived BOOLEAN,
  investment_strategy VARCHAR(32),
  geographic_focus VARCHAR(32),
  asset_class VARCHAR(32),
  manager_name VARCHAR(32),
  fund_id INTEGER,
  benchmark_index_id INTEGER,
  PRIMARY KEY (underlying_fund_id),
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id),
  FOREIGN KEY (benchmark_index_id) REFERENCES benchmark_indexes (benchmark_index_id)
);
