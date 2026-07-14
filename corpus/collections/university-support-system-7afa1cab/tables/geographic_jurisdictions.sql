CREATE TABLE geographic_jurisdictions (
  id INTEGER NOT NULL,
  jurisdiction_id VARCHAR(34),
  jurisdiction_name VARCHAR(32),
  jurisdiction_type VARCHAR(32),
  population INTEGER,
  gdp DECIMAL,
  entrepreneurship_index DECIMAL,
  government_policies VARCHAR(37),
  last_updated TIMESTAMP,
  PRIMARY KEY (id)
);
