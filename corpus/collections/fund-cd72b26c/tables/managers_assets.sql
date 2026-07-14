CREATE TABLE managers_assets (
  fund_manager_id INTEGER NOT NULL,
  asset_id INTEGER NOT NULL,
  PRIMARY KEY (fund_manager_id, asset_id),
  FOREIGN KEY (fund_manager_id) REFERENCES fund_managers (fund_manager_id),
  FOREIGN KEY (asset_id) REFERENCES assets (asset_id)
);
