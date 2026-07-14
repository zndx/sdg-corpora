CREATE TABLE physical_transition_systems (
  physical_transition_system_id INTEGER NOT NULL,
  system_id INTEGER,
  initial_state_id VARCHAR(32),
  state_count INTEGER,
  transition_relation_id VARCHAR(44),
  valuation_function_id VARCHAR(40),
  physical_atoms VARCHAR(32),
  sanction_atoms VARCHAR(32),
  norm_id INTEGER,
  PRIMARY KEY (physical_transition_system_id),
  FOREIGN KEY (norm_id) REFERENCES norms (id)
);
