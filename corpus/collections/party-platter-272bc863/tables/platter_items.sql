CREATE TABLE platter_items (
  platter_item_id INTEGER NOT NULL,
  item_id VARCHAR(32),
  item_name VARCHAR(32),
  quantity INTEGER,
  category VARCHAR(32),
  is_crispy BOOLEAN,
  is_grilled BOOLEAN,
  party_platter_id INTEGER,
  PRIMARY KEY (platter_item_id),
  FOREIGN KEY (party_platter_id) REFERENCES party_platters (id)
);
