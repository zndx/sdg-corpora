CREATE TABLE organizations_sectors (
  organization_id INTEGER NOT NULL,
  client_sector_id INTEGER NOT NULL,
  PRIMARY KEY (organization_id, client_sector_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (organization_id),
  FOREIGN KEY (client_sector_id) REFERENCES client_sectors (id)
);
