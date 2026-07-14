CREATE TABLE flood_hazards (
  id INTEGER NOT NULL,
  hazard_id VARCHAR(32),
  event_date TIMESTAMP,
  peak_water_level DECIMAL,
  duration DECIMAL,
  hazard_severity VARCHAR(32),
  cause_type VARCHAR(32),
  geographic_zone_id INTEGER,
  record_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_zone_id) REFERENCES geographic_zones (id),
  FOREIGN KEY (record_id) REFERENCES condition_records (record_id)
);
