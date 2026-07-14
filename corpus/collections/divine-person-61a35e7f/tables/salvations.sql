CREATE TABLE salvations (
  id INTEGER NOT NULL,
  has_source VARCHAR(32),
  has_mechanism VARCHAR(32),
  has_recipient VARCHAR(32),
  has_result VARCHAR(32),
  divine_act_id INTEGER,
  humanity_id INTEGER,
  divine_person_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_act_id) REFERENCES divine_acts (id),
  FOREIGN KEY (humanity_id) REFERENCES humanities (id),
  FOREIGN KEY (divine_person_id) REFERENCES divine_persons (id)
);
