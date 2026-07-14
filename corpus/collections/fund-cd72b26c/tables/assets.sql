CREATE TABLE assets (
  asset_id INTEGER NOT NULL,
  asset_identifier VARCHAR(32),
  asset_name VARCHAR(32),
  asset_type VARCHAR(32),
  market_cap DECIMAL,
  sector VARCHAR(32),
  country_of_incorporation VARCHAR(32),
  currency_denomination VARCHAR(32),
  is_equity BOOLEAN,
  is_fixed_income BOOLEAN,
  underlying_fund_id INTEGER,
  benchmark_index_id INTEGER,
  PRIMARY KEY (asset_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id),
  FOREIGN KEY (benchmark_index_id) REFERENCES benchmark_indexes (benchmark_index_id)
);
