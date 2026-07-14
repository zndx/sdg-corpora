CREATE TABLE beverages (
  id INTEGER NOT NULL,
  beverage_type VARCHAR(32),
  brand VARCHAR(40),
  volume DECIMAL,
  unit VARCHAR(32),
  price DECIMAL,
  happy_hour_special_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (happy_hour_special_id) REFERENCES happy_hour_specials (id)
);
