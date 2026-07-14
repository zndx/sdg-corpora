CREATE TABLE health_care_summaries (
  summary_identifier VARCHAR(32),
  creation_date TIMESTAMP,
  format_code VARCHAR(32) NOT NULL,
  has_records BOOLEAN,
  confidentiality_status VARCHAR(32),
  youth_id INTEGER,
  healthcare_facility_id INTEGER,
  authorization_id INTEGER,
  PRIMARY KEY (format_code),
  FOREIGN KEY (youth_id) REFERENCES youths (id),
  FOREIGN KEY (healthcare_facility_id) REFERENCES healthcare_facilities (id),
  FOREIGN KEY (authorization_id) REFERENCES authorizations (id)
);
