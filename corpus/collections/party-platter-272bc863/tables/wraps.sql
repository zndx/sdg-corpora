CREATE TABLE wraps (
  wrap_id INTEGER NOT NULL,
  wrap_name VARCHAR(32),
  price DECIMAL,
  main_ingredient VARCHAR(32),
  is_available BOOLEAN,
  box_lunch_id INTEGER,
  PRIMARY KEY (wrap_id),
  FOREIGN KEY (box_lunch_id) REFERENCES box_lunches (id)
);
