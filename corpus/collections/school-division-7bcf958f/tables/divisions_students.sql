CREATE TABLE divisions_students (
  school_division_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (school_division_id, student_id),
  FOREIGN KEY (school_division_id) REFERENCES school_divisions (school_division_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
