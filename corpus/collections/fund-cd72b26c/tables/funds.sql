CREATE TABLE funds (
  fund_id INTEGER NOT NULL,
  fund_identifier VARCHAR(32),
  fund_name VARCHAR(32),
  inception_date DATE,
  fund_class VARCHAR(32),
  total_assets_under_management DECIMAL,
  management_fee_rate DECIMAL,
  performance_fee_rate DECIMAL,
  charitable_donation_status BOOLEAN,
  benchmark_index_id INTEGER,
  charitable_cause_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (fund_id),
  FOREIGN KEY (benchmark_index_id) REFERENCES benchmark_indexes (benchmark_index_id),
  FOREIGN KEY (charitable_cause_id) REFERENCES charitable_causes (id)
);
