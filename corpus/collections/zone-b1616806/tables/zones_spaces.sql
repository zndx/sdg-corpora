CREATE TABLE zones_spaces (
  zone_id INTEGER NOT NULL,
  parking_space_id INTEGER NOT NULL,
  PRIMARY KEY (zone_id, parking_space_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (parking_space_id) REFERENCES parking_spaces (id)
);
