CREATE TABLE rig_counts (
  id INTEGER NOT NULL,
  count_id VARCHAR(44),
  count_date DATE,
  active_rig_count INTEGER,
  region_name VARCHAR(32),
  data_provider VARCHAR(32),
  geographic_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_region_id) REFERENCES geographic_regions (geographic_region_id)
);
