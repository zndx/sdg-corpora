CREATE TABLE resources (
  id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  resource_type VARCHAR(32),
  quantity INTEGER,
  unit_cost DECIMAL,
  total_cost DECIMAL,
  distribution_date TIMESTAMP,
  status VARCHAR(32),
  activity_id INTEGER,
  beneficiary_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (activity_id) REFERENCES activities (activity_id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (beneficiary_id)
);
