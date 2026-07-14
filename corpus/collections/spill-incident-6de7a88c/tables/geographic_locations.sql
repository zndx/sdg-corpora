CREATE TABLE geographic_locations (
  id INTEGER NOT NULL,
  location_id INTEGER,
  latitude DECIMAL,
  longitude DECIMAL,
  location_name VARCHAR(32),
  water_depth DECIMAL,
  distance_from_shore DECIMAL,
  location_type VARCHAR(32),
  spill_incident_id INTEGER,
  ecological_resource_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (ecological_resource_id) REFERENCES ecological_resources (id)
);
