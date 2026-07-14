CREATE TABLE privileges_persons (
  divine_privilege_id INTEGER NOT NULL,
  adopted_person_id INTEGER NOT NULL,
  PRIMARY KEY (divine_privilege_id, adopted_person_id),
  FOREIGN KEY (divine_privilege_id) REFERENCES divine_privileges (id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id)
);
