CREATE TABLE classes_students (
  class_code VARCHAR(32) NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (class_code, student_id),
  FOREIGN KEY (class_code) REFERENCES student_classes (class_code),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
