CREATE TABLE planned_routes (
  planned_route_id INTEGER NOT NULL,
  route_id VARCHAR(44),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  is_feasible BOOLEAN,
  min_obstacle_distance DECIMAL,
  zone_id INTEGER,
  waypoint_id INTEGER,
  ends_at_waypoint_id INTEGER,
  PRIMARY KEY (planned_route_id),
  FOREIGN KEY (zone_id) REFERENCES zones (id),
  FOREIGN KEY (waypoint_id) REFERENCES waypoints (id),
  FOREIGN KEY (ends_at_waypoint_id) REFERENCES waypoints (id)
);
