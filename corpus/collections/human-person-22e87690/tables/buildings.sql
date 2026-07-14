CREATE TABLE buildings (
  id INTEGER NOT NULL,
  has_building_type VARCHAR(32),
  has_material_composition VARCHAR(32),
  has_occupancy_status VARCHAR(32),
  has_animal_occupants BOOLEAN,
  settlement_id INTEGER,
  birth_event_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (settlement_id) REFERENCES settlements (settlement_id),
  FOREIGN KEY (birth_event_id) REFERENCES birth_events (birth_event_id)
);
