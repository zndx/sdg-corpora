CREATE TABLE abuse_rates (
  id INTEGER NOT NULL,
  measurement_date TIMESTAMP,
  rate_value DECIMAL,
  sample_size INTEGER,
  confidence_interval DECIMAL,
  data_source VARCHAR(32),
  top_level_domain_id INTEGER,
  zone_file_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (top_level_domain_id) REFERENCES top_level_domains (top_level_domain_id),
  FOREIGN KEY (zone_file_id) REFERENCES zone_files (zone_file_id)
);
