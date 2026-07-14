CREATE TABLE organizations_infrastructures (
  client_organization_client_id VARCHAR(32) NOT NULL,
  network_infrastructure_network_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (client_organization_client_id, network_infrastructure_network_id),
  FOREIGN KEY (client_organization_client_id) REFERENCES client_organizations (client_id),
  FOREIGN KEY (network_infrastructure_network_id) REFERENCES network_infrastructures (network_id)
);
