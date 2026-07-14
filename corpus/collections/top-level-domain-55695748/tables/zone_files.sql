CREATE TABLE zone_files (
  zone_file_id INTEGER NOT NULL,
  file_id VARCHAR(44),
  capture_date DATE,
  record_count INTEGER,
  is_complete BOOLEAN,
  storage_location VARCHAR(32),
  top_level_domain_id INTEGER,
  abuse_rate_id INTEGER,
  PRIMARY KEY (zone_file_id),
  FOREIGN KEY (top_level_domain_id) REFERENCES top_level_domains (top_level_domain_id),
  FOREIGN KEY (abuse_rate_id) REFERENCES abuse_rates (id)
);
