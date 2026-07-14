CREATE TABLE obstacles (
  obstacle_id INTEGER NOT NULL,
  obstacle_type VARCHAR(32),
  obstacle_x DECIMAL,
  obstacle_y DECIMAL,
  obstacle_radius DECIMAL,
  obstacle_status VARCHAR(32),
  zone_id INTEGER,
  PRIMARY KEY (obstacle_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id)
);
