CREATE TABLE calibration_laboratories (
  calibration_laboratory_id INTEGER NOT NULL,
  laboratory_name VARCHAR(32),
  address VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_person VARCHAR(32),
  facility_type VARCHAR(32),
  certificate_number VARCHAR(32),
  PRIMARY KEY (calibration_laboratory_id),
  FOREIGN KEY (certificate_number) REFERENCES accreditation_certificates (certificate_number)
);
