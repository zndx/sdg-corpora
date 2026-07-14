CREATE TABLE varieties_sides (
  sandwich_variety_id INTEGER NOT NULL,
  boxed_lunch_side_id INTEGER NOT NULL,
  PRIMARY KEY (sandwich_variety_id, boxed_lunch_side_id),
  FOREIGN KEY (sandwich_variety_id) REFERENCES sandwich_varieties (id),
  FOREIGN KEY (boxed_lunch_side_id) REFERENCES boxed_lunch_sides (boxed_lunch_side_id)
);
