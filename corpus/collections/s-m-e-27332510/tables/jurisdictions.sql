CREATE TABLE jurisdictions (
  id INTEGER NOT NULL,
  jurisdiction_id VARCHAR(34),
  name VARCHAR(32),
  country_code VARCHAR(44),
  region VARCHAR(32),
  population INTEGER,
  gdp DECIMAL,
  regulatory_environment VARCHAR(32),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);
