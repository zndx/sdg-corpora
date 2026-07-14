CREATE TABLE systems_sinks (
  heat_recovery_system_id INTEGER NOT NULL,
  heat_sink_id INTEGER NOT NULL,
  PRIMARY KEY (heat_recovery_system_id, heat_sink_id),
  FOREIGN KEY (heat_recovery_system_id) REFERENCES heat_recovery_systems (id),
  FOREIGN KEY (heat_sink_id) REFERENCES heat_sinks (heat_sink_id)
);
