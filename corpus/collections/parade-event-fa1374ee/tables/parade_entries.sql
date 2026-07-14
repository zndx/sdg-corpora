CREATE TABLE parade_entries (
  parade_entry_id INTEGER NOT NULL,
  entry_type VARCHAR(32),
  number_of_participants INTEGER,
  is_diesel_powered BOOLEAN,
  give_away_method VARCHAR(32),
  entry_status VARCHAR(32),
  participating_organization_id INTEGER,
  parade_vehicle_id INTEGER,
  vehicle_operator_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (parade_entry_id),
  FOREIGN KEY (participating_organization_id) REFERENCES participating_organizations (participating_organization_id),
  FOREIGN KEY (parade_vehicle_id) REFERENCES parade_vehicles (parade_vehicle_id),
  FOREIGN KEY (vehicle_operator_id) REFERENCES vehicle_operators (id)
);
