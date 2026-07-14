CREATE TABLE approval_histories (
  approval_history_id INTEGER NOT NULL,
  original_approval_date DATE,
  historical_approval_number VARCHAR(32),
  historical_standard VARCHAR(32),
  certified_organization_id INTEGER,
  management_standard_id INTEGER,
  PRIMARY KEY (approval_history_id),
  FOREIGN KEY (certified_organization_id) REFERENCES certified_organizations (id),
  FOREIGN KEY (management_standard_id) REFERENCES management_standards (management_standard_id)
);
