CREATE TABLE assets_records (
  flood_asset_id INTEGER NOT NULL,
  record_id INTEGER NOT NULL,
  PRIMARY KEY (flood_asset_id, record_id),
  FOREIGN KEY (flood_asset_id) REFERENCES flood_assets (id),
  FOREIGN KEY (record_id) REFERENCES condition_records (record_id)
);
