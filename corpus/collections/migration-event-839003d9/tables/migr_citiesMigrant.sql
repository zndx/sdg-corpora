CREATE TABLE migr_citiesMigrant (
  city_id VARCHAR(44) NOT NULL,
  migrant_id INTEGER NOT NULL,
  PRIMARY KEY (city_id, migrant_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id),
  FOREIGN KEY (migrant_id) REFERENCES migr_migrants (migrant_id)
);
