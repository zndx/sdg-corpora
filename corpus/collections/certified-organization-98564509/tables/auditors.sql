CREATE TABLE auditors (
  id INTEGER NOT NULL,
  auditor_name VARCHAR(32),
  auditor_title VARCHAR(32),
  region VARCHAR(32),
  certification_record_certificate_identity_number VARCHAR(32),
  certification_body_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (certification_record_certificate_identity_number) REFERENCES certification_records (certificate_identity_number),
  FOREIGN KEY (certification_body_id) REFERENCES certification_bodies (id)
);
