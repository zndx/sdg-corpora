CREATE TABLE certification_records (
  certification_record_id INTEGER NOT NULL,
  certificate_id INTEGER,
  issue_date DATE,
  expiry_date DATE,
  scope_description VARCHAR(32),
  certification_body VARCHAR(32),
  status VARCHAR(32),
  organization_id INTEGER,
  management_system_standard_id INTEGER,
  PRIMARY KEY (certification_record_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (management_system_standard_id) REFERENCES management_system_standards (management_system_standard_id)
);
