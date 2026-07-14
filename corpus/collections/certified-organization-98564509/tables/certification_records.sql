CREATE TABLE certification_records (
  certificate_identity_number VARCHAR(32) NOT NULL,
  approval_number VARCHAR(32),
  current_issue_date TIMESTAMP,
  expiry_date DATE,
  scope_description VARCHAR(32),
  status VARCHAR(32),
  certified_organization_id INTEGER,
  management_standard_id INTEGER,
  certification_body_id INTEGER,
  auditor_id INTEGER,
  certification_record_certificate_identity_number VARCHAR(32),
  PRIMARY KEY (certificate_identity_number),
  FOREIGN KEY (certified_organization_id) REFERENCES certified_organizations (id),
  FOREIGN KEY (management_standard_id) REFERENCES management_standards (management_standard_id),
  FOREIGN KEY (certification_body_id) REFERENCES certification_bodies (id),
  FOREIGN KEY (auditor_id) REFERENCES auditors (id),
  FOREIGN KEY (certification_record_certificate_identity_number) REFERENCES certification_records (certificate_identity_number)
);
