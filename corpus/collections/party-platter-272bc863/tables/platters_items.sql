CREATE TABLE platters_items (
  party_platter_id INTEGER NOT NULL,
  platter_item_id INTEGER NOT NULL,
  PRIMARY KEY (party_platter_id, platter_item_id),
  FOREIGN KEY (party_platter_id) REFERENCES party_platters (id),
  FOREIGN KEY (platter_item_id) REFERENCES platter_items (platter_item_id)
);
