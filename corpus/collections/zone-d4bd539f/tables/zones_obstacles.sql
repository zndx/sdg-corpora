CREATE TABLE zones_obstacles (
  zone_id INTEGER NOT NULL,
  obstacle_id INTEGER NOT NULL,
  PRIMARY KEY (zone_id, obstacle_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id)
);
