CREATE TABLE students_teachers (
  student_id INTEGER NOT NULL,
  special_day_class_teacher_id INTEGER NOT NULL,
  PRIMARY KEY (student_id, special_day_class_teacher_id),
  FOREIGN KEY (student_id) REFERENCES students (id),
  FOREIGN KEY (special_day_class_teacher_id) REFERENCES special_day_class_teachers (special_day_class_teacher_id)
);
