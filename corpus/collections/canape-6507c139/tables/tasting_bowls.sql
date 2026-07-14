CREATE TABLE tasting_bowls (
  bowl_id VARCHAR(44) NOT NULL,
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  dietary_classification VARCHAR(32),
  recommended_count_per_person INTEGER,
  pricing_scheme_id INTEGER,
  PRIMARY KEY (bowl_id),
  FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_schemes (id)
);
