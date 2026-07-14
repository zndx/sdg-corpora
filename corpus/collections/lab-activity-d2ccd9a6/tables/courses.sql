CREATE TABLE courses (
  id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_name VARCHAR(32),
  credits INTEGER,
  semester VARCHAR(32),
  department VARCHAR(32),
  faculty_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id)
);
