CREATE TABLE computational_codes (
  id INTEGER NOT NULL,
  code_id VARCHAR(44),
  code_name VARCHAR(32),
  version VARCHAR(32),
  license_type VARCHAR(32),
  developer_group VARCHAR(32),
  center_id VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (center_id) REFERENCES high_performance_computer_centers (center_id)
);
