CREATE TABLE geographic_markets (
  id INTEGER NOT NULL,
  market_id VARCHAR(44),
  region_name VARCHAR(32),
  country_code VARCHAR(44),
  market_type VARCHAR(32),
  strategic_initiative_id INTEGER,
  industry_sector_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (strategic_initiative_id) REFERENCES strategic_initiatives (id),
  FOREIGN KEY (industry_sector_id) REFERENCES industry_sectors (industry_sector_id)
);
