CREATE TABLE hazard_barriers (
  id INTEGER NOT NULL,
  barrier_identifier VARCHAR(32),
  barrier_type VARCHAR(32),
  effectiveness_rating DECIMAL,
  regulatory_initiative VARCHAR(32),
  support_system_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (support_system_id) REFERENCES support_systems (support_system_id)
);
