CREATE TABLE policy_instruments (
  policy_instrument_id INTEGER NOT NULL,
  policy_id VARCHAR(35),
  name VARCHAR(32),
  jurisdiction VARCHAR(32),
  effective_date DATE,
  status VARCHAR(32),
  public_perception_id INTEGER,
  land_use_id INTEGER,
  spatial_planning_zone_id INTEGER,
  PRIMARY KEY (policy_instrument_id),
  FOREIGN KEY (public_perception_id) REFERENCES public_perceptions (public_perception_id),
  FOREIGN KEY (land_use_id) REFERENCES land_uses (id),
  FOREIGN KEY (spatial_planning_zone_id) REFERENCES spatial_planning_zones (spatial_planning_zone_id)
);
