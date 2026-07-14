CREATE TABLE venues (
  identifier VARCHAR(32),
  building_name VARCHAR(32),
  room_number VARCHAR(32) NOT NULL,
  floor INTEGER,
  capacity INTEGER,
  location_type VARCHAR(32),
  colloquium_id INTEGER,
  PRIMARY KEY (room_number),
  FOREIGN KEY (colloquium_id) REFERENCES colloquiums (id)
);
