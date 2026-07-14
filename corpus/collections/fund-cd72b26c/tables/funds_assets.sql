CREATE TABLE funds_assets (
  underlying_fund_id INTEGER NOT NULL,
  asset_id INTEGER NOT NULL,
  PRIMARY KEY (underlying_fund_id, asset_id),
  FOREIGN KEY (underlying_fund_id) REFERENCES underlying_funds (underlying_fund_id),
  FOREIGN KEY (asset_id) REFERENCES assets (asset_id)
);
