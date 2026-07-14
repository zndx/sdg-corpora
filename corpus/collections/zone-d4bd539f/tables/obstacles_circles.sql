CREATE TABLE obstacles_circles (
  obstacle_id INTEGER NOT NULL,
  tangent_circle_id INTEGER NOT NULL,
  PRIMARY KEY (obstacle_id, tangent_circle_id),
  FOREIGN KEY (obstacle_id) REFERENCES obstacles (obstacle_id),
  FOREIGN KEY (tangent_circle_id) REFERENCES tangent_circles (id)
);
