CREATE TABLE transit_oriented_developments (
  id INTEGER NOT NULL,
  tod_id INTEGER,
  name VARCHAR(32),
  conurbation VARCHAR(32),
  coverage_radius DECIMAL,
  implementation_status VARCHAR(32),
  spatial_planning_zone_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id)
);
