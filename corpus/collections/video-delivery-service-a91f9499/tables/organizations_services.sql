CREATE TABLE organizations_services (
  client_organization_client_id VARCHAR(32) NOT NULL,
  service_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (client_organization_client_id, service_id),
  FOREIGN KEY (client_organization_client_id) REFERENCES client_organizations (client_id),
  FOREIGN KEY (service_id) REFERENCES video_delivery_services (service_id)
);
