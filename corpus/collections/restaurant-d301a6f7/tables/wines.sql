CREATE TABLE wines (
  wine_id INTEGER NOT NULL,
  producer VARCHAR(32),
  vintage INTEGER,
  variety VARCHAR(32),
  appellation VARCHAR(32),
  vineyard_source VARCHAR(32),
  parker_rating VARCHAR(32),
  contains_resveratrol BOOLEAN,
  person_id INTEGER,
  vineyard_id INTEGER,
  restaurant_id INTEGER,
  food_id INTEGER,
  PRIMARY KEY (wine_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id),
  FOREIGN KEY (vineyard_id) REFERENCES vineyards (vineyard_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (food_id) REFERENCES foods (id)
);
