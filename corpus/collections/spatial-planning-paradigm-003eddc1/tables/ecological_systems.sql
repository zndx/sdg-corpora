CREATE TABLE ecological_systems (
  ecological_system_id VARCHAR(44) NOT NULL,
  name VARCHAR(32),
  type VARCHAR(32),
  area_hectares DECIMAL,
  conservation_status VARCHAR(32),
  spatial_planning_zone_id INTEGER,
  PRIMARY KEY (ecological_system_id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id)
);
