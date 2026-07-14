CREATE TABLE vineyards (
  vineyard_id INTEGER NOT NULL,
  name VARCHAR(32),
  location VARCHAR(32),
  acres DECIMAL,
  average_vine_age INTEGER,
  ownership_type VARCHAR(32),
  wine_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (vineyard_id),
  FOREIGN KEY (wine_id) REFERENCES wines (wine_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
