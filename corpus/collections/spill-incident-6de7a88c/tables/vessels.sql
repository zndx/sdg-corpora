CREATE TABLE vessels (
  id INTEGER NOT NULL,
  vessel_id VARCHAR(40),
  vessel_name VARCHAR(32),
  vessel_type VARCHAR(32),
  vessel_length DECIMAL,
  vessel_status VARCHAR(32),
  owner_name VARCHAR(32),
  owner_location VARCHAR(32),
  total_constructive_loss BOOLEAN,
  spill_incident_id INTEGER,
  geographic_location_id INTEGER,
  moved_to_geographic_location_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (geographic_location_id) REFERENCES geographic_locations (id),
  FOREIGN KEY (moved_to_geographic_location_id) REFERENCES geographic_locations (id)
);
