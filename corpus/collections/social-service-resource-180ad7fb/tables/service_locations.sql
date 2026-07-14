CREATE TABLE service_locations (
  service_location_id INTEGER NOT NULL,
  location_name VARCHAR(32),
  location_type VARCHAR(32),
  geographic_scope VARCHAR(32),
  supported_languages VARCHAR(32),
  social_service_resource_id INTEGER,
  hotline_service_phone_number VARCHAR(32),
  PRIMARY KEY (service_location_id),
  FOREIGN KEY (social_service_resource_id) REFERENCES social_service_resources (social_service_resource_id),
  FOREIGN KEY (hotline_service_phone_number) REFERENCES hotline_services (phone_number)
);
