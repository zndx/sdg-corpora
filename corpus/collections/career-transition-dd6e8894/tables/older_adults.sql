CREATE TABLE older_adults (
  id INTEGER NOT NULL,
  participant_id VARCHAR(44),
  age INTEGER,
  gender VARCHAR(32),
  employment_status VARCHAR(32),
  previous_occupation VARCHAR(32),
  career_transition_id INTEGER,
  phase_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (career_transition_id) REFERENCES career_transitions (id),
  FOREIGN KEY (phase_id) REFERENCES research_phases (phase_id)
);
