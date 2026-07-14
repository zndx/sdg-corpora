CREATE TABLE career_transitions (
  id INTEGER NOT NULL,
  transition_id VARCHAR(32),
  transition_type VARCHAR(32),
  start_date DATE,
  end_date DATE,
  description VARCHAR(32),
  phase_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
