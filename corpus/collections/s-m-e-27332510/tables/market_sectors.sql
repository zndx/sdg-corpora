CREATE TABLE market_sectors (
  id INTEGER NOT NULL,
  sector_id INTEGER,
  name VARCHAR(32),
  industry_classification_code INTEGER,
  growth_rate DECIMAL,
  is_growth_sector BOOLEAN,
  description VARCHAR(32),
  jurisdiction_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (jurisdiction_id) REFERENCES jurisdictions (id)
);
