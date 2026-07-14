CREATE TABLE interim_suspensions (
  id INTEGER NOT NULL,
  suspension_id VARCHAR(44),
  imposition_date TIMESTAMP,
  hearing_date TIMESTAMP,
  issuing_authority VARCHAR(32),
  reason VARCHAR(32),
  status VARCHAR(32),
  student_id VARCHAR(32),
  hearing_id INTEGER,
  dean_of_students_staff_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (hearing_id) REFERENCES hearings (id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id)
);
