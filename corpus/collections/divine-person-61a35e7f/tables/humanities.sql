CREATE TABLE humanities (
  id INTEGER NOT NULL,
  has_image_status BOOLEAN,
  has_sin_condition BOOLEAN,
  has_reconciliation_status VARCHAR(32),
  has_eternal_destiny VARCHAR(32),
  divine_person_id INTEGER,
  divine_act_id INTEGER,
  church_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (divine_person_id) REFERENCES divine_persons (id),
  FOREIGN KEY (divine_act_id) REFERENCES divine_acts (id),
  FOREIGN KEY (church_id) REFERENCES churches (id)
);
