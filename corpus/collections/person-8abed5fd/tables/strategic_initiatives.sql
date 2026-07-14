CREATE TABLE strategic_initiatives (
  id INTEGER NOT NULL,
  initiative_id VARCHAR(44),
  initiative_name VARCHAR(32),
  target_region VARCHAR(32),
  status VARCHAR(32),
  description VARCHAR(32),
  professional_role_id INTEGER,
  geographic_market_id INTEGER,
  industry_sector_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (professional_role_id) REFERENCES professional_roles (professional_role_id),
  FOREIGN KEY (geographic_market_id) REFERENCES geographic_markets (id),
  FOREIGN KEY (industry_sector_id) REFERENCES industry_sectors (industry_sector_id)
);
