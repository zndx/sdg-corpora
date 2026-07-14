CREATE TABLE heat_sinks (
  heat_sink_id INTEGER NOT NULL,
  sink_identifier VARCHAR(32),
  sink_type VARCHAR(32),
  target_temperature DECIMAL,
  flow_volume DECIMAL,
  unit_count INTEGER,
  heat_recovery_system_id INTEGER,
  pulp_mill_id INTEGER,
  PRIMARY KEY (heat_sink_id),
  FOREIGN KEY (heat_recovery_system_id) REFERENCES heat_recovery_systems (id),
  FOREIGN KEY (pulp_mill_id) REFERENCES pulp_mills (id)
);
