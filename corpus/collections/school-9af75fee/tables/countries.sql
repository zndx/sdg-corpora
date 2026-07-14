CREATE TABLE countries (
  id INTEGER NOT NULL,
  country_code VARCHAR(44),
  name VARCHAR(32),
  region VARCHAR(32),
  gdp_per_capita DECIMAL,
  internet_penetration DECIMAL,
  school_connectivity_rate DECIMAL,
  school_id INTEGER,
  connectivity_provider_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (school_id) REFERENCES schools (id),
  FOREIGN KEY (connectivity_provider_id) REFERENCES connectivity_providers (id)
);
