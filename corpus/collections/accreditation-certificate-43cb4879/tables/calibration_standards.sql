CREATE TABLE calibration_standards (
  calibration_standard_id INTEGER NOT NULL,
  standard_identifier VARCHAR(32),
  standard_name VARCHAR(32),
  publication_year INTEGER,
  issuing_organization VARCHAR(33),
  certificate_number VARCHAR(32),
  PRIMARY KEY (calibration_standard_id),
  FOREIGN KEY (certificate_number) REFERENCES accreditation_certificates (certificate_number)
);
