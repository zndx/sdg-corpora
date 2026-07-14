CREATE TABLE fathers_persons (
  divine_father_id INTEGER NOT NULL,
  adopted_person_id INTEGER NOT NULL,
  PRIMARY KEY (divine_father_id, adopted_person_id),
  FOREIGN KEY (divine_father_id) REFERENCES divine_fathers (divine_father_id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id)
);
