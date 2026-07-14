CREATE TABLE waypoints (
  id INTEGER NOT NULL,
  waypoint_id INTEGER,
  x DECIMAL,
  y DECIMAL,
  waypoint_type VARCHAR(32),
  zone_id INTEGER,
  planned_route_id INTEGER,
  is_end_of_planned_route_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (planned_route_id) REFERENCES planned_routes (planned_route_id),
  FOREIGN KEY (is_end_of_planned_route_id) REFERENCES planned_routes (planned_route_id)
);
