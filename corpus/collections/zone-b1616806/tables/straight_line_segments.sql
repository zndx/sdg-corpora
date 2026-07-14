CREATE TABLE straight_line_segments (
  segment_id VARCHAR(44) NOT NULL,
  length DECIMAL,
  start_tangent_point_x DECIMAL,
  start_tangent_point_y DECIMAL,
  end_tangent_point_x DECIMAL,
  end_tangent_point_y DECIMAL,
  tangent_circle_id INTEGER,
  planned_route_id INTEGER,
  PRIMARY KEY (segment_id),
  FOREIGN KEY (tangent_circle_id) REFERENCES tangent_circles (id),
  FOREIGN KEY (planned_route_id) REFERENCES planned_routes (planned_route_id)
);
