CREATE TABLE transitions (
  transition_id VARCHAR(32) NOT NULL,
  action_id INTEGER,
  precondition VARCHAR(32),
  effect VARCHAR(32),
  state_id INTEGER,
  terminates_at_state_id INTEGER,
  physical_transition_system_id INTEGER,
  PRIMARY KEY (transition_id),
  FOREIGN KEY (state_id) REFERENCES states (id),
  FOREIGN KEY (terminates_at_state_id) REFERENCES states (id),
  FOREIGN KEY (physical_transition_system_id) REFERENCES physical_transition_systems (physical_transition_system_id)
);
