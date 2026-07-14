CREATE TABLE visualization_services (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  endpoint_url VARCHAR(56),
  uptime_percentage DECIMAL,
  max_concurrent_users INTEGER,
  active_status BOOLEAN,
  parsed_data_store_id INTEGER,
  center_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (parsed_data_store_id) REFERENCES parsed_data_stores (parsed_data_store_id),
  FOREIGN KEY (center_id) REFERENCES high_performance_computer_centers (center_id)
);
