CREATE TABLE parsing_pipelines (
  pipeline_id VARCHAR(32) NOT NULL,
  pipeline_name VARCHAR(32),
  start_date_time TIMESTAMP,
  end_date_time TIMESTAMP,
  status VARCHAR(32),
  records_processed INTEGER,
  center_id VARCHAR(32),
  parsed_data_store_id INTEGER,
  PRIMARY KEY (pipeline_id),
  FOREIGN KEY (center_id) REFERENCES high_performance_computer_centers (center_id),
  FOREIGN KEY (parsed_data_store_id) REFERENCES parsed_data_stores (parsed_data_store_id)
);
