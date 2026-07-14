CREATE TABLE health_authorities (
  health_authority_id INTEGER NOT NULL,
  authority_name VARCHAR(32),
  contact_phone VARCHAR(32),
  contact_email VARCHAR(32),
  region_covered VARCHAR(32),
  clinical_service_id INTEGER,
  PRIMARY KEY (health_authority_id),
  FOREIGN KEY (clinical_service_id) REFERENCES clinical_services (clinical_service_id)
);
