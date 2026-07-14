CREATE TABLE facilities (
  facility_id INTEGER NOT NULL,
  facility_name VARCHAR(32),
  street_address VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zip_code VARCHAR(44),
  bus_accessible BOOLEAN,
  evening_hours BOOLEAN,
  admissions_hours VARCHAR(32),
  treatment_program_id INTEGER,
  service_code VARCHAR(32),
  PRIMARY KEY (facility_id),
  FOREIGN KEY (treatment_program_id) REFERENCES treatment_programs (id),
  FOREIGN KEY (service_code) REFERENCES clinical_services (service_code)
);
