CREATE TABLE courses (
  course_id INTEGER NOT NULL,
  course_code VARCHAR(32),
  course_title VARCHAR(32),
  department VARCHAR(32),
  credits DECIMAL,
  is_verified BOOLEAN,
  is_advanced BOOLEAN,
  semester VARCHAR(32),
  faculty_member_id INTEGER,
  prerequisite_of_course_id INTEGER,
  diploma_requirement_id INTEGER,
  created_at TIMESTAMP,
  PRIMARY KEY (course_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (prerequisite_of_course_id) REFERENCES courses (course_id),
  FOREIGN KEY (diploma_requirement_id) REFERENCES diploma_requirements (id)
);
