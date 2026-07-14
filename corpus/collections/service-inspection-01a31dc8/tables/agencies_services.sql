CREATE TABLE agencies_services (
  agency_id VARCHAR(39) NOT NULL,
  service_code VARCHAR(32) NOT NULL,
  PRIMARY KEY (agency_id, service_code),
  FOREIGN KEY (agency_id) REFERENCES service_agencies (agency_id),
  FOREIGN KEY (service_code) REFERENCES social_care_services (service_code)
);
