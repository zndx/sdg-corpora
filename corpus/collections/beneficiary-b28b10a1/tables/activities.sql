CREATE TABLE activities (
  activity_id INTEGER NOT NULL,
  activity_name VARCHAR(32),
  activity_type VARCHAR(32),
  date TIMESTAMP,
  location VARCHAR(32),
  participants_count INTEGER,
  status VARCHAR(32),
  resources_used DECIMAL,
  program_id INTEGER,
  beneficiary_id INTEGER,
  resource_id INTEGER,
  PRIMARY KEY (activity_id),
  FOREIGN KEY (program_id) REFERENCES programs (id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (beneficiary_id),
  FOREIGN KEY (resource_id) REFERENCES resources (id)
);
