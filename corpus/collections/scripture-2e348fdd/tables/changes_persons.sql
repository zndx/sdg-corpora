CREATE TABLE changes_persons (
  spiritual_change_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (spiritual_change_id, person_id),
  FOREIGN KEY (spiritual_change_id) REFERENCES spiritual_changes (spiritual_change_id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
