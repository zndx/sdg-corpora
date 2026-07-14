CREATE TABLE states (
  id INTEGER NOT NULL,
  state_id INTEGER,
  state_index INTEGER,
  is_initial_state BOOLEAN,
  satisfied_atoms VARCHAR(32),
  timestamp TIMESTAMP,
  physical_transition_system_id INTEGER,
  transitions_to_state_id INTEGER,
  norm_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (physical_transition_system_id) REFERENCES physical_transition_systems (physical_transition_system_id),
  FOREIGN KEY (transitions_to_state_id) REFERENCES states (id),
  FOREIGN KEY (norm_id) REFERENCES norms (id)
);
