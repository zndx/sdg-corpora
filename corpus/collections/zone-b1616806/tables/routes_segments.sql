CREATE TABLE routes_segments (
  planned_route_id INTEGER NOT NULL,
  segment_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (planned_route_id, segment_id),
  FOREIGN KEY (planned_route_id) REFERENCES planned_routes (planned_route_id),
  FOREIGN KEY (segment_id) REFERENCES straight_line_segments (segment_id)
);
