CREATE TABLE desserts (
  id INTEGER NOT NULL,
  dessert_id VARCHAR(44),
  dessert_name VARCHAR(32),
  price DECIMAL,
  type VARCHAR(32),
  is_available BOOLEAN,
  party_platter_id INTEGER,
  box_lunch_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (party_platter_id) REFERENCES party_platters (id),
  FOREIGN KEY (box_lunch_id) REFERENCES box_lunches (id)
);
