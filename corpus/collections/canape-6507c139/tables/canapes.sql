CREATE TABLE canapes (
  canape_id INTEGER NOT NULL,
  name VARCHAR(32),
  price DECIMAL,
  category VARCHAR(32),
  dietary_classification VARCHAR(32),
  recommended_count_per_person INTEGER,
  bread_base_id INTEGER,
  pricing_scheme_id INTEGER,
  PRIMARY KEY (canape_id),
  FOREIGN KEY (bread_base_id) REFERENCES bread_bases (bread_base_id),
  FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_schemes (id)
);
