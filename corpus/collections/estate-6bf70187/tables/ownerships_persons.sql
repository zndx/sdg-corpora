CREATE TABLE ownerships_persons (
  joint_ownership_id INTEGER NOT NULL,
  person_id INTEGER NOT NULL,
  PRIMARY KEY (joint_ownership_id, person_id),
  FOREIGN KEY (joint_ownership_id) REFERENCES joint_ownerships (joint_ownership_id),
  FOREIGN KEY (person_id) REFERENCES persons (id)
);
