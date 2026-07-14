CREATE TABLE programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  target_population VARCHAR(32),
  budget DECIMAL,
  funding_source VARCHAR(32),
  beneficiary_id INTEGER,
  activity_id INTEGER,
  organization_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (beneficiary_id),
  FOREIGN KEY (activity_id) REFERENCES activities (activity_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
