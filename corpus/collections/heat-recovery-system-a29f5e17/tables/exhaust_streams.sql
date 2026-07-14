CREATE TABLE exhaust_streams (
  id INTEGER NOT NULL,
  stream_identifier VARCHAR(32),
  source_process VARCHAR(32),
  temperature DECIMAL,
  humidity_level VARCHAR(32),
  flow_rate DECIMAL,
  fouling_potential VARCHAR(32),
  heat_recovery_system_id INTEGER,
  pulp_mill_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (heat_recovery_system_id) REFERENCES heat_recovery_systems (id),
  FOREIGN KEY (pulp_mill_id) REFERENCES pulp_mills (id)
);
