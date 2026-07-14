CREATE TABLE certification_records (
  id INTEGER NOT NULL,
  certificate_identity_number VARCHAR(32),
  current_issue_date TIMESTAMP,
  expiry_date TIMESTAMP,
  status VARCHAR(32),
  certified_organization_id INTEGER,
  management_standard_id INTEGER,
  certification_scope_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (certified_organization_id) REFERENCES certified_organizations (id),
  FOREIGN KEY (management_standard_id) REFERENCES management_standards (id),
  FOREIGN KEY (certification_scope_id) REFERENCES certification_scopes (certification_scope_id)
);
