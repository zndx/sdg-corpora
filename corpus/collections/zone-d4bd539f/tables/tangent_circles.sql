CREATE TABLE tangent_circles (
  id INTEGER NOT NULL,
  circle_id VARCHAR(44),
  circle_radius DECIMAL,
  circle_center_x DECIMAL,
  circle_center_y DECIMAL,
  circle_curvature DECIMAL,
  obstacle_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id)
);
