CREATE TABLE norms (
  id INTEGER NOT NULL,
  norm_id VARCHAR(44),
  norm_type VARCHAR(32),
  trigger_condition VARCHAR(32),
  deadline_condition VARCHAR(32),
  enforcement_mode VARCHAR(32),
  sanction_type VARCHAR(32),
  physical_transition_system_id INTEGER,
  norm_violation_id INTEGER,
  sanction_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (physical_transition_system_id) REFERENCES physical_transition_systems (physical_transition_system_id),
  FOREIGN KEY (norm_violation_id) REFERENCES norm_violations (id),
  FOREIGN KEY (sanction_id) REFERENCES sanctions (sanction_id)
);
