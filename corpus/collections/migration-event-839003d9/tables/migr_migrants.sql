CREATE TABLE migr_migrants (
  migrant_id INTEGER NOT NULL,
  nationality VARCHAR(32),
  residence_status VARCHAR(32),
  employment_type VARCHAR(32),
  salary_level DECIMAL,
  language_proficiency VARCHAR(32),
  integration_intent VARCHAR(32),
  city_id VARCHAR(44),
  business_id INTEGER,
  PRIMARY KEY (migrant_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id),
  FOREIGN KEY (business_id) REFERENCES migr_businesses (id)
);
