CREATE TABLE box_lunches (
  id INTEGER NOT NULL,
  lunch_id VARCHAR(32),
  lunch_name VARCHAR(32),
  price DECIMAL,
  status VARCHAR(32),
  last_updated TIMESTAMP,
  wrap_id INTEGER,
  side_item_side_id VARCHAR(35),
  dessert_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (wrap_id) REFERENCES wraps (wrap_id),
  FOREIGN KEY (side_item_side_id) REFERENCES side_items (side_id),
  FOREIGN KEY (dessert_id) REFERENCES desserts (id)
);
