CREATE TABLE courses_members (
  course_id INTEGER NOT NULL,
  faculty_member_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, faculty_member_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id)
);
