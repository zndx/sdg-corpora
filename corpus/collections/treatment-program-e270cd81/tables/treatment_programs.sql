CREATE TABLE treatment_programs (
  id INTEGER NOT NULL,
  program_id INTEGER,
  program_name VARCHAR(32),
  delivery_mode VARCHAR(32),
  risk_level VARCHAR(32),
  status VARCHAR(32),
  accreditation_body VARCHAR(32),
  service_code VARCHAR(32),
  facility_id INTEGER,
  payment_source_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (service_code) REFERENCES clinical_services (service_code),
  FOREIGN KEY (facility_id) REFERENCES facilities (facility_id),
  FOREIGN KEY (payment_source_id) REFERENCES payment_sources (id)
);
