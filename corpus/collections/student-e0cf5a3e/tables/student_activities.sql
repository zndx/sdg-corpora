CREATE TABLE student_activities (
  id INTEGER NOT NULL,
  activity_id VARCHAR(34),
  activity_name VARCHAR(32),
  category VARCHAR(32),
  status VARCHAR(32),
  governing_policy VARCHAR(32),
  code_of_conduct_id INTEGER,
  dean_of_students_staff_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (code_of_conduct_id) REFERENCES code_of_conducts (id),
  FOREIGN KEY (dean_of_students_staff_id) REFERENCES dean_of_students_staffs (id)
);
