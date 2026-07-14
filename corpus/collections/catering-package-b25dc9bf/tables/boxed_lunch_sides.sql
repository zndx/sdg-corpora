CREATE TABLE boxed_lunch_sides (
  boxed_lunch_side_id INTEGER NOT NULL,
  side_id VARCHAR(35),
  side_name VARCHAR(32),
  side_category VARCHAR(32),
  sandwich_variety_id INTEGER,
  PRIMARY KEY (boxed_lunch_side_id),
  FOREIGN KEY (sandwich_variety_id) REFERENCES sandwich_varieties (id)
);
