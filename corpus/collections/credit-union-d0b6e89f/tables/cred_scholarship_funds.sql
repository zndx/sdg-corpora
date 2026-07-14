CREATE TABLE cred_scholarship_funds (
  id INTEGER NOT NULL,
  fund_name VARCHAR(32),
  established_year INTEGER,
  target_beneficiaries VARCHAR(32),
  funding_source VARCHAR(32),
  organization_id INTEGER,
  person_id INTEGER,
  awarded_to_person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES cred_organizations (organization_id),
  FOREIGN KEY (person_id) REFERENCES cred_persons (id),
  FOREIGN KEY (awarded_to_person_id) REFERENCES cred_persons (id)
);
