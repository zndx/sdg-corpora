CREATE TABLE childs_guardians (
  child_id INTEGER NOT NULL,
  guardian_id INTEGER NOT NULL,
  PRIMARY KEY (child_id, guardian_id),
  FOREIGN KEY (child_id) REFERENCES childs (id),
  FOREIGN KEY (guardian_id) REFERENCES guardians (guardian_id)
);
