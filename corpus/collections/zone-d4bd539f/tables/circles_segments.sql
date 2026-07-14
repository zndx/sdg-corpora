CREATE TABLE circles_segments (
  tangent_circle_id INTEGER NOT NULL,
  path_segment_id INTEGER NOT NULL,
  PRIMARY KEY (tangent_circle_id, path_segment_id),
  FOREIGN KEY (tangent_circle_id) REFERENCES tangent_circles (id),
  FOREIGN KEY (path_segment_id) REFERENCES path_segments (path_segment_id)
);
