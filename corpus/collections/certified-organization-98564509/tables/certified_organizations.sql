CREATE TABLE certified_organizations (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  street_address VARCHAR(32),
  postal_code VARCHAR(35),
  city VARCHAR(32),
  country VARCHAR(32),
  registration_number VARCHAR(32),
  certification_body_id INTEGER,
  certification_record_certificate_identity_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (certification_body_id) REFERENCES certification_bodies (id),
  FOREIGN KEY (certification_record_certificate_identity_number) REFERENCES certification_records (certificate_identity_number)
);
