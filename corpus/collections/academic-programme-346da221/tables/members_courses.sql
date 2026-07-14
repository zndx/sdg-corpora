CREATE TABLE members_courses (
  faculty_member_id INTEGER NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, course_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id),
  FOREIGN KEY (course_id) REFERENCES courses (course_id)
);
