CREATE TABLE migr_locals (
  id INTEGER NOT NULL,
  local_id INTEGER,
  nationality VARCHAR(32),
  residence_city VARCHAR(32),
  language_proficiency VARCHAR(32),
  perception_of_migrants VARCHAR(32),
  employment_sector VARCHAR(32),
  city_id VARCHAR(44),
  business_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id),
  FOREIGN KEY (business_id) REFERENCES migr_businesses (id)
);
