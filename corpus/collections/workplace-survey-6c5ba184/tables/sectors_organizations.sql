CREATE TABLE sectors_organizations (
  client_sector_id INTEGER NOT NULL,
  organization_id INTEGER NOT NULL,
  PRIMARY KEY (client_sector_id, organization_id),
  FOREIGN KEY (client_sector_id) REFERENCES client_sectors (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id)
);
