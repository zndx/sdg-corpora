CREATE TABLE satellite_missions (
  id INTEGER NOT NULL,
  mission_id VARCHAR(44),
  mission_name VARCHAR(32),
  operator VARCHAR(32),
  launch_year INTEGER,
  orbit_type VARCHAR(32),
  is_copernicus_mission BOOLEAN,
  geographic_zone_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES geographic_zones (id)
);
