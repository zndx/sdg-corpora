CREATE TABLE management_standards (
  management_standard_id INTEGER NOT NULL,
  standard_identifier VARCHAR(32),
  standard_version VARCHAR(32),
  issuing_organization VARCHAR(33),
  certification_record_certificate_identity_number VARCHAR(32),
  PRIMARY KEY (management_standard_id),
  FOREIGN KEY (certification_record_certificate_identity_number) REFERENCES certification_records (certificate_identity_number)
);
