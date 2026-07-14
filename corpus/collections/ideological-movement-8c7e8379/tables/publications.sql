CREATE TABLE publications (
  publication_id INTEGER NOT NULL,
  pub_identifier VARCHAR(32),
  title VARCHAR(32),
  publication_date DATE,
  publisher VARCHAR(32),
  language VARCHAR(32),
  subject_matter VARCHAR(32),
  is_critical_of_movement BOOLEAN,
  individual_id INTEGER,
  ideological_movement_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (publication_id),
  FOREIGN KEY (individual_id) REFERENCES individuals (individual_id),
  FOREIGN KEY (ideological_movement_id) REFERENCES ideological_movements (ideological_movement_id)
);
