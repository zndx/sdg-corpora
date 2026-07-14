CREATE TABLE infrastructures_organizations (
  network_infrastructure_network_id VARCHAR(44) NOT NULL,
  client_organization_client_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (network_infrastructure_network_id, client_organization_client_id),
  FOREIGN KEY (network_infrastructure_network_id) REFERENCES network_infrastructures (network_id),
  FOREIGN KEY (client_organization_client_id) REFERENCES client_organizations (client_id)
);
