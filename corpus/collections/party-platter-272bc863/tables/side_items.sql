CREATE TABLE side_items (
  side_id VARCHAR(35) NOT NULL,
  side_name VARCHAR(32),
  price DECIMAL,
  type VARCHAR(32),
  is_available BOOLEAN,
  party_platter_id INTEGER,
  box_lunch_id INTEGER,
  PRIMARY KEY (side_id),
  FOREIGN KEY (party_platter_id) REFERENCES party_platters (id),
  FOREIGN KEY (box_lunch_id) REFERENCES box_lunches (id)
);
