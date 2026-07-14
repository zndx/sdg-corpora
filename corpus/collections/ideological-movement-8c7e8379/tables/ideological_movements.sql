CREATE TABLE ideological_movements (
  ideological_movement_id INTEGER NOT NULL,
  movement_identifier VARCHAR(32),
  founding_year INTEGER,
  founder_name VARCHAR(32),
  strategic_phase VARCHAR(32),
  ultimate_goal VARCHAR(32),
  operational_territory VARCHAR(32),
  is_political BOOLEAN,
  strategic_operation_id INTEGER,
  geopolitical_region_id INTEGER,
  PRIMARY KEY (ideological_movement_id),
  FOREIGN KEY (strategic_operation_id) REFERENCES strategic_operations (id),
  FOREIGN KEY (geopolitical_region_id) REFERENCES geopolitical_regions (id)
);
