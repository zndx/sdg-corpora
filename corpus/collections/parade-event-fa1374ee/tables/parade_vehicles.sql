CREATE TABLE parade_vehicles (
  parade_vehicle_id INTEGER NOT NULL,
  vehicle_type VARCHAR(32),
  is_diesel_powered BOOLEAN,
  vehicle_identifier VARCHAR(32),
  vehicle_status VARCHAR(32),
  parade_entry_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (parade_vehicle_id),
  FOREIGN KEY (parade_entry_id) REFERENCES parade_entries (parade_entry_id)
);
