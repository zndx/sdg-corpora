CREATE TABLE parents_enrollments (
  parent_id INTEGER NOT NULL,
  enrollment_id INTEGER NOT NULL,
  PRIMARY KEY (parent_id, enrollment_id),
  FOREIGN KEY (parent_id) REFERENCES parents (id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id)
);
