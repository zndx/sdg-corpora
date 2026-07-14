CREATE TABLE parsed_data_stores (
  parsed_data_store_id INTEGER NOT NULL,
  store_id VARCHAR(44),
  store_name VARCHAR(32),
  total_records INTEGER,
  last_updated TIMESTAMP,
  storage_size_g_b DECIMAL,
  data_integrity_status VARCHAR(32),
  big_data_analytics_tool_id INTEGER,
  visualization_service_id INTEGER,
  PRIMARY KEY (parsed_data_store_id),
  FOREIGN KEY (big_data_analytics_tool_id) REFERENCES big_data_analytics_tools (id),
  FOREIGN KEY (visualization_service_id) REFERENCES visualization_services (id)
);
