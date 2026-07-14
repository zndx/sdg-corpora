CREATE TABLE migr_businesses (
  id INTEGER NOT NULL,
  business_id VARCHAR(40),
  business_name VARCHAR(32),
  business_type VARCHAR(32),
  target_clientele VARCHAR(32),
  establishment_date DATE,
  operating_status VARCHAR(32),
  migrant_id INTEGER,
  city_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id)
);
