CREATE TABLE staffs_suspensions (
  dean_of_students_staff_id INTEGER NOT NULL,
  interim_suspension_id INTEGER NOT NULL,
  PRIMARY KEY (dean_of_students_staff_id, interim_suspension_id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id),
  FOREIGN KEY (interim_suspension_id) REFERENCES interim_suspensions (id)
);
