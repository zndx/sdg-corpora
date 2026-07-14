CREATE TABLE zones_uses (
  spatial_planning_zone_id INTEGER NOT NULL,
  land_use_id INTEGER NOT NULL,
  PRIMARY KEY (spatial_planning_zone_id, land_use_id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id),
  FOREIGN KEY (land_use_id) REFERENCES land_uses (id)
);
