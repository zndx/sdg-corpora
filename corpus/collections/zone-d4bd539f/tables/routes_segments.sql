CREATE TABLE routes_segments (
  route_id INTEGER NOT NULL,
  path_segment_id INTEGER NOT NULL,
  PRIMARY KEY (route_id, path_segment_id),
  FOREIGN KEY (route_id) REFERENCES routes (id),
  FOREIGN KEY (path_segment_id) REFERENCES path_segments (path_segment_id)
);
