CREATE TABLE food_items (
  food_item_id INTEGER NOT NULL,
  name VARCHAR(32),
  category VARCHAR(32),
  price DECIMAL,
  serving_size VARCHAR(32),
  ingredients VARCHAR(32),
  happy_hour_special_id INTEGER,
  PRIMARY KEY (food_item_id),
  FOREIGN KEY (happy_hour_special_id) REFERENCES happy_hour_specials (id)
);
