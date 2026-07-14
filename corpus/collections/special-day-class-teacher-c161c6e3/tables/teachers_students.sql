CREATE TABLE teachers_students (
  special_day_class_teacher_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (special_day_class_teacher_id, student_id),
  FOREIGN KEY (special_day_class_teacher_id) REFERENCES special_day_class_teachers (special_day_class_teacher_id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
