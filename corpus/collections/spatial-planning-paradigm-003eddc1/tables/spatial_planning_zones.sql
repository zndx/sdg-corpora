CREATE TABLE spatial_planning_zones (
  spatial_planning_zone_id INTEGER NOT NULL,
  zone_id VARCHAR(44),
  name VARCHAR(32),
  region VARCHAR(32),
  country VARCHAR(32),
  area_km2 DECIMAL,
  transit_oriented_development_id INTEGER,
  ecological_system_id VARCHAR(44),
  PRIMARY KEY (spatial_planning_zone_id),
  FOREIGN KEY (transit_oriented_development_id) REFERENCES transit_oriented_developments (id),
  FOREIGN KEY (ecological_system_id) REFERENCES ecological_systems (ecological_system_id)
);
