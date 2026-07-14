CREATE TABLE foods (
  id INTEGER NOT NULL,
  food_id VARCHAR(44),
  name VARCHAR(32),
  category VARCHAR(32),
  is_staining BOOLEAN,
  preparation_method VARCHAR(32),
  wine_id INTEGER,
  restaurant_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (wine_id) REFERENCES wines (wine_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);
