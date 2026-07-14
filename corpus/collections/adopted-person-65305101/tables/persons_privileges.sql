CREATE TABLE persons_privileges (
  adopted_person_id INTEGER NOT NULL,
  divine_privilege_id INTEGER NOT NULL,
  PRIMARY KEY (adopted_person_id, divine_privilege_id),
  FOREIGN KEY (adopted_person_id) REFERENCES adopted_persons (id),
  FOREIGN KEY (divine_privilege_id) REFERENCES divine_privileges (id)
);
