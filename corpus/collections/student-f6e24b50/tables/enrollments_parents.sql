CREATE TABLE enrollments_parents (
  enrollment_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  PRIMARY KEY (enrollment_id, parent_id),
  FOREIGN KEY (enrollment_id) REFERENCES enrollments (id),
  FOREIGN KEY (parent_id) REFERENCES parents (id)
);
