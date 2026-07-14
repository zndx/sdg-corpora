CREATE TABLE service_organizations (
  id INTEGER NOT NULL,
  organization_name VARCHAR(32),
  jurisdiction_level VARCHAR(32),
  contact_phone_number VARCHAR(32),
  website_url VARCHAR(55),
  is_toll_free BOOLEAN,
  social_service_resource_id INTEGER,
  hotline_service_phone_number VARCHAR(32),
  PRIMARY KEY (id),
  FOREIGN KEY (social_service_resource_id) REFERENCES social_service_resources (social_service_resource_id),
  FOREIGN KEY (hotline_service_phone_number) REFERENCES hotline_services (phone_number)
);
