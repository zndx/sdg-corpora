CREATE TABLE industry_sectors (
  industry_sector_id INTEGER NOT NULL,
  sector_id INTEGER,
  sector_name VARCHAR(32),
  classification_code VARCHAR(44),
  organization_id INTEGER,
  strategic_initiative_id INTEGER,
  PRIMARY KEY (industry_sector_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (strategic_initiative_id) REFERENCES strategic_initiatives (id)
);
