CREATE TABLE accreditation_certificates (
  certificate_number VARCHAR(32) NOT NULL,
  issue_date DATE,
  expiry_date DATE,
  accreditation_body VARCHAR(32),
  status VARCHAR(32),
  calibration_laboratory_id INTEGER,
  PRIMARY KEY (certificate_number),
  FOREIGN KEY (calibration_laboratory_id) REFERENCES calibration_laboratories (calibration_laboratory_id)
);
