CREATE TABLE migr_citiesBusiness (
  city_id VARCHAR(44) NOT NULL,
  business_id INTEGER NOT NULL,
  PRIMARY KEY (city_id, business_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id),
  FOREIGN KEY (business_id) REFERENCES migr_businesses (id)
);
