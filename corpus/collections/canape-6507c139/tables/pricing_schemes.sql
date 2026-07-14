CREATE TABLE pricing_schemes (
  id INTEGER NOT NULL,
  scheme_id VARCHAR(44),
  price_point DECIMAL,
  currency VARCHAR(32),
  valid_from TIMESTAMP,
  canape_id INTEGER,
  bowl_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (canape_id) REFERENCES canapes (canape_id),
  FOREIGN KEY (bowl_id) REFERENCES tasting_bowls (bowl_id)
);
