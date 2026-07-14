CREATE TABLE industry_sectors (
  industry_sector_id INTEGER NOT NULL,
  sector_id INTEGER,
  sector_name VARCHAR(32),
  description VARCHAR(32),
  is_public_sector BOOLEAN,
  organization_id INTEGER,
  partner_organization_id INTEGER,
  PRIMARY KEY (industry_sector_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (partner_organization_id) REFERENCES partner_organizations (partner_organization_id)
);
