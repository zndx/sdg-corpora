CREATE TABLE zones (
  id INTEGER NOT NULL,
  zone_id VARCHAR(44),
  length DECIMAL,
  width DECIMAL,
  surface_type VARCHAR(32),
  is_cul_de_sac BOOLEAN,
  waypoint_id INTEGER,
  has_exit_point_waypoint_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (waypoint_id) REFERENCES waypoints (id),
  FOREIGN KEY (has_exit_point_waypoint_id) REFERENCES waypoints (id)
);
