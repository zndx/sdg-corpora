CREATE TABLE parking_spaces (
  id INTEGER NOT NULL,
  space_id VARCHAR(32),
  length DECIMAL,
  width DECIMAL,
  is_occupied BOOLEAN,
  zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (zone_id) REFERENCES zones (id)
);
