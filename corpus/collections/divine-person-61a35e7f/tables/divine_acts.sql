CREATE TABLE divine_acts (
  id INTEGER NOT NULL,
  has_act_type VARCHAR(32),
  has_temporal_phase VARCHAR(32),
  has_location VARCHAR(32),
  has_outcome VARCHAR(32),
  divine_person_id INTEGER,
  humanity_id INTEGER,
  salvation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_person_id) REFERENCES divine_persons (id),
  FOREIGN KEY (humanity_id) REFERENCES humanities (id),
  FOREIGN KEY (salvation_id) REFERENCES salvations (id)
);
