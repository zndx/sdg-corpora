CREATE TABLE land_uses (
  id INTEGER NOT NULL,
  land_use_id VARCHAR(32),
  zoning_district VARCHAR(32),
  density_class VARCHAR(32),
  primary_function VARCHAR(32),
  last_survey_date DATE,
  spatial_planning_zone_id INTEGER,
  transit_oriented_development_id INTEGER,
  spatial_planning_paradigm_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id),
  FOREIGN KEY (transit_oriented_development_id) REFERENCES transit_oriented_developments (id),
  FOREIGN KEY (spatial_planning_paradigm_id) REFERENCES spatial_planning_paradigms (id)
);
