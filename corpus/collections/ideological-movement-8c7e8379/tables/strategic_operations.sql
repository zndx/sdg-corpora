CREATE TABLE strategic_operations (
  id INTEGER NOT NULL,
  operation_code VARCHAR(44),
  operation_name VARCHAR(32),
  description VARCHAR(32),
  target_region VARCHAR(32),
  implementation_method VARCHAR(32),
  is_coercive BOOLEAN,
  ideological_movement_id INTEGER,
  geopolitical_region_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (ideological_movement_id) REFERENCES ideological_movements (ideological_movement_id),
  FOREIGN KEY (geopolitical_region_id) REFERENCES geopolitical_regions (id)
);
