CREATE TABLE systems_states (
  physical_transition_system_id INTEGER NOT NULL,
  state_id INTEGER NOT NULL,
  PRIMARY KEY (physical_transition_system_id, state_id),
  FOREIGN KEY (physical_transition_system_id) REFERENCES physical_transition_systems (physical_transition_system_id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
