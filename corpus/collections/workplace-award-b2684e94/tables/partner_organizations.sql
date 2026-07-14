CREATE TABLE partner_organizations (
  partner_organization_id INTEGER NOT NULL,
  partner_id VARCHAR(32),
  partner_name VARCHAR(32),
  partnership_type VARCHAR(32),
  membership_level VARCHAR(32),
  start_date DATE,
  organization_id INTEGER,
  industry_sector_id INTEGER,
  PRIMARY KEY (partner_organization_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (industry_sector_id) REFERENCES industry_sectors (industry_sector_id)
);
