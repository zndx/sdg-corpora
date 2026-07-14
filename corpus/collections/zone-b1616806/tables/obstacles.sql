CREATE TABLE obstacles (
  obstacle_id INTEGER NOT NULL,
  obstacle_type VARCHAR(32),
  position_x DECIMAL,
  position_y DECIMAL,
  is_static BOOLEAN,
  zone_id INTEGER,
  PRIMARY KEY (obstacle_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id)
);
