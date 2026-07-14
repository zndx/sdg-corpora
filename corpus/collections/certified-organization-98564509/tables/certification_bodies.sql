CREATE TABLE certification_bodies (
  id INTEGER NOT NULL,
  body_name VARCHAR(32),
  accreditation_code INTEGER,
  jurisdiction VARCHAR(32),
  certified_organization_id INTEGER,
  certification_record_certificate_identity_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (certified_organization_id) REFERENCES certified_organizations (id),
  FOREIGN KEY (certification_record_certificate_identity_number) REFERENCES certification_records (certificate_identity_number)
);
