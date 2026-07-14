CREATE TABLE engineers_organizations (
  technical_support_engineer_id INTEGER NOT NULL,
  client_organization_client_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (technical_support_engineer_id, client_organization_client_id),
  FOREIGN KEY (technical_support_engineer_id) REFERENCES technical_support_engineers (technical_support_engineer_id),
  FOREIGN KEY (client_organization_client_id) REFERENCES client_organizations (client_id)
);
