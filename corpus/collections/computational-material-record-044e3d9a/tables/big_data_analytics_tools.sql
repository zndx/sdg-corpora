CREATE TABLE big_data_analytics_tools (
  id INTEGER NOT NULL,
  tool_id VARCHAR(32),
  tool_name VARCHAR(32),
  algorithm_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  status VARCHAR(32),
  novel_materials_discovered INTEGER,
  parsed_data_store_id INTEGER,
  center_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (parsed_data_store_id) REFERENCES parsed_data_stores (parsed_data_store_id),
  FOREIGN KEY (center_id) REFERENCES high_performance_computer_centers (center_id)
);
