CREATE TABLE benchmark_indexes (
  benchmark_index_id INTEGER NOT NULL,
  index_name VARCHAR(32),
  index_ticker VARCHAR(32),
  index_type VARCHAR(32),
  currency VARCHAR(32),
  rebalancing_frequency VARCHAR(32),
  weighting_scheme VARCHAR(32),
  number_of_components INTEGER,
  is_hedged BOOLEAN,
  fund_id INTEGER,
  underlying_fund_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (benchmark_index_id),
  FOREIGN KEY (fund_id) REFERENCES funds (fund_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id)
);
