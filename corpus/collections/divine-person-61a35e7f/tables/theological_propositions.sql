CREATE TABLE theological_propositions (
  id INTEGER NOT NULL,
  has_proposition_type VARCHAR(32),
  has_authority VARCHAR(32),
  has_truth_value BOOLEAN,
  has_scope VARCHAR(32),
  divine_person_id INTEGER,
  humanity_id INTEGER,
  salvation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_person_id) REFERENCES divine_persons (id),
  FOREIGN KEY (humanity_id) REFERENCES humanities (id),
  FOREIGN KEY (salvation_id) REFERENCES salvations (id)
);
