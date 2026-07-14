CREATE TABLE transitions_adults (
  career_transition_id INTEGER NOT NULL,
  older_adult_id INTEGER NOT NULL,
  PRIMARY KEY (career_transition_id, older_adult_id),
  FOREIGN KEY (career_transition_id) REFERENCES career_transitions (id),
  FOREIGN KEY (older_adult_id) REFERENCES older_adults (id)
);
