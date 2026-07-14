CREATE TABLE enrolments_parents (
  enrolment_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  PRIMARY KEY (enrolment_id, parent_id),
  FOREIGN KEY (enrolment_id) REFERENCES enrolments (enrolment_id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
