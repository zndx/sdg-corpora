CREATE TABLE inspections_services (
  service_inspection_id INTEGER NOT NULL,
  service_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (service_inspection_id, service_code),
  FOREIGN KEY (service_inspection_id) REFERENCES service_inspections (id),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code)
);
