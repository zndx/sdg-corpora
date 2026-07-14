CREATE TABLE high_performance_computer_centers (
  center_id VARCHAR(32) NOT NULL,
  center_name VARCHAR(32),
  location VARCHAR(32),
  total_compute_nodes INTEGER,
  peak_performance_flops DECIMAL,
  operational_status VARCHAR(32),
  computational_code_id INTEGER,
  big_data_analytics_tool_id INTEGER,
  PRIMARY KEY (center_id),
  FOREIGN KEY (computational_code_id) REFERENCES computational_codes (id),
  FOREIGN KEY (big_data_analytics_tool_id) REFERENCES big_data_analytics_tools (id)
);
