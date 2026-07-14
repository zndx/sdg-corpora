CREATE TABLE spaces_obstacles (
  parking_space_id INTEGER NOT NULL,
  obstacle_id INTEGER NOT NULL,
  PRIMARY KEY (parking_space_id, obstacle_id),
  FOREIGN KEY (parking_space_id) REFERENCES parking_spaces (id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id)
);
