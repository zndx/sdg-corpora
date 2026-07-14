CREATE TABLE party_platters (
  id INTEGER NOT NULL,
  platter_id VARCHAR(40),
  serves_count INTEGER,
  base_price DECIMAL,
  epic_price DECIMAL,
  status VARCHAR(32),
  last_updated TIMESTAMP,
  side_item_side_id VARCHAR(35),
  beverage_id INTEGER,
  dessert_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (side_item_side_id) REFERENCES side_items (side_id),
  FOREIGN KEY (beverage_id) REFERENCES beverages (beverage_id),
  FOREIGN KEY (dessert_id) REFERENCES desserts (id)
);
