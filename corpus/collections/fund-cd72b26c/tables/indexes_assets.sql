CREATE TABLE indexes_assets (
  benchmark_index_id INTEGER NOT NULL,
  asset_id INTEGER NOT NULL,
  PRIMARY KEY (benchmark_index_id, asset_id),
  FOREIGN KEY (benchmark_index_id) REFERENCES benchmark_indexes (benchmark_index_id),
  FOREIGN KEY (asset_id) REFERENCES assets (asset_id)
);
