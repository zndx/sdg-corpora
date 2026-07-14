CREATE TABLE certificates_standards (
  certificate_number VARCHAR(32) NOT NULL,
  calibration_standard_id INTEGER NOT NULL,
  PRIMARY KEY (certificate_number, calibration_standard_id),
  FOREIGN KEY (certificate_number) REFERENCES accreditation_certificates (certificate_number),
  FOREIGN KEY (calibration_standard_id) REFERENCES calibration_standards (calibration_standard_id)
);
