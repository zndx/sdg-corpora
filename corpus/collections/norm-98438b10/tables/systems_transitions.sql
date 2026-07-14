CREATE TABLE systems_transitions (
  physical_transition_system_id INTEGER NOT NULL,
  transition_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (physical_transition_system_id, transition_id),
  FOREIGN KEY (physical_transition_system_id) REFERENCES physical_transition_systems (physical_transition_system_id),
  FOREIGN KEY (transition_id) REFERENCES transitions (transition_id)
);
