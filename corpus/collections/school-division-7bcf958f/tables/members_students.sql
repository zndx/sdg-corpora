CREATE TABLE members_students (
  faculty_member_id INTEGER NOT NULL,
  student_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, student_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (student_id) REFERENCES students (id)
);
