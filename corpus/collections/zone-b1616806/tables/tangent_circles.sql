CREATE TABLE tangent_circles (
  id INTEGER NOT NULL,
  circle_id VARCHAR(44),
  radius DECIMAL,
  center_x DECIMAL,
  center_y DECIMAL,
  obstacle_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id)
);
