CREATE TABLE migr_cities (
  city_id VARCHAR(44) NOT NULL,
  city_name VARCHAR(32),
  region VARCHAR(32),
  population_density INTEGER,
  cost_of_living_index DECIMAL,
  PRIMARY KEY (city_id)
);
