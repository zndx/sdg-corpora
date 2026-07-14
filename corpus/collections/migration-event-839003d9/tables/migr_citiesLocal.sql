CREATE TABLE migr_citiesLocal (
  city_id VARCHAR(44) NOT NULL,
  local_id INTEGER NOT NULL,
  PRIMARY KEY (city_id, local_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id),
  FOREIGN KEY (local_id) REFERENCES migr_locals (id)
);
