CREATE TABLE vehicles_obstacles (
  vehicle_id INTEGER NOT NULL,
  obstacle_id INTEGER NOT NULL,
  PRIMARY KEY (vehicle_id, obstacle_id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id)
);
