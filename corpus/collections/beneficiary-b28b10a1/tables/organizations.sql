CREATE TABLE organizations (
  id INTEGER NOT NULL,
  org_id VARCHAR(32),
  org_name VARCHAR(32),
  org_type VARCHAR(32),
  established_year INTEGER,
  location VARCHAR(32),
  status VARCHAR(32),
  membership VARCHAR(32),
  program_id INTEGER,
  beneficiary_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (program_id) REFERENCES programs (id),
  FOREIGN KEY (beneficiary_id) REFERENCES beneficiaries (beneficiary_id)
);
