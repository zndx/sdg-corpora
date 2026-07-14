CREATE TABLE staffs_activities (
  dean_of_students_staff_id INTEGER NOT NULL,
  student_activity_id INTEGER NOT NULL,
  PRIMARY KEY (dean_of_students_staff_id, student_activity_id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id),
  FOREIGN KEY (student_activity_id) REFERENCES student_activities (id)
);
