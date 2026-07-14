CREATE TABLE dipping_sauces (
  dipping_sauce_id INTEGER NOT NULL,
  name VARCHAR(32),
  flavor_profile VARCHAR(32),
  spiciness VARCHAR(32),
  food_item_id INTEGER,
  PRIMARY KEY (dipping_sauce_id),
  FOREIGN KEY (food_item_id) REFERENCES food_items (food_item_id)
);
