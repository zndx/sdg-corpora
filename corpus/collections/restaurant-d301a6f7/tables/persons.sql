CREATE TABLE persons (
  person_id INTEGER NOT NULL,
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  role VARCHAR(32),
  is_celebrity BOOLEAN,
  restaurant_id INTEGER,
  works_as_chef_restaurant_id INTEGER,
  wine_id INTEGER,
  vineyard_id INTEGER,
  PRIMARY KEY (person_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (works_as_chef_restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (wine_id) REFERENCES wines (wine_id),
  FOREIGN KEY (vineyard_id) REFERENCES vineyards (vineyard_id)
);
