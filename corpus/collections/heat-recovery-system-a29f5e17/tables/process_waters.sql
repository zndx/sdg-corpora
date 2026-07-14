CREATE TABLE process_waters (
  id INTEGER NOT NULL,
  water_identifier VARCHAR(32),
  usage_type VARCHAR(32),
  flow_rate DECIMAL,
  temperature DECIMAL,
  preheated_by BOOLEAN,
  heat_recovery_system_id INTEGER,
  pulp_mill_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (heat_recovery_system_id) REFERENCES heat_recovery_systems (id),
  FOREIGN KEY (pulp_mill_id) REFERENCES pulp_mills (id)
);
