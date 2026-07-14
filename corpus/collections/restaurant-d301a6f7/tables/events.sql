CREATE TABLE events (
  event_id INTEGER NOT NULL,
  event_name VARCHAR(32),
  event_type VARCHAR(32),
  date DATE,
  min_participants INTEGER,
  is_special_menu BOOLEAN,
  restaurant_id INTEGER,
  wine_id INTEGER,
  person_id INTEGER,
  PRIMARY KEY (event_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (id),
  FOREIGN KEY (wine_id) REFERENCES wines (wine_id),
  FOREIGN KEY (person_id) REFERENCES persons (person_id)
);
