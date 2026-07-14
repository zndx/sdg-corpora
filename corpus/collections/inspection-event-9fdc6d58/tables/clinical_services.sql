CREATE TABLE clinical_services (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_type VARCHAR(32),
  operating_hours VARCHAR(32),
  location_address VARCHAR(32),
  location_postcode VARCHAR(32),
  number_of_clinicians INTEGER,
  number_of_support_staff INTEGER,
  service_status VARCHAR(32),
  PRIMARY KEY (id)
);
