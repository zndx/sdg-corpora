CREATE TABLE path_segments (
  path_segment_id INTEGER NOT NULL,
  segment_id VARCHAR(44),
  segment_length DECIMAL,
  segment_start_x DECIMAL,
  segment_start_y DECIMAL,
  segment_end_x DECIMAL,
  segment_end_y DECIMAL,
  segment_status VARCHAR(32),
  tangent_circle_id INTEGER,
  connects_end_tangent_circle_id INTEGER,
  route_id INTEGER,
  PRIMARY KEY (path_segment_id),
  FOREIGN KEY (tangent_circle_id) REFERENCES tangent_circles (id),
  FOREIGN KEY (connects_end_tangent_circle_id) REFERENCES tangent_circles (id),
  FOREIGN KEY (route_id) REFERENCES routes (id)
);
