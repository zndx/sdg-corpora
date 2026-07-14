CREATE TABLE social_service_resources (
  social_service_resource_id INTEGER NOT NULL,
  resource_identifier VARCHAR(32),
  service_category VARCHAR(32),
  service_status VARCHAR(32),
  language_availability INTEGER,
  operating_hours VARCHAR(32),
  is_confidential BOOLEAN,
  service_organization_id INTEGER,
  service_location_id INTEGER,
  PRIMARY KEY (social_service_resource_id),
  FOREIGN KEY (service_organization_id) REFERENCES service_organizations (id),
  FOREIGN KEY (service_location_id) REFERENCES service_locations (service_location_id)
);
