CREATE TABLE faculty_members (
  faculty_member_id INTEGER NOT NULL,
  faculty_id VARCHAR(44),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  title VARCHAR(32),
  department_id VARCHAR(32),
  school_id INTEGER,
  university_id VARCHAR(40),
  employment_status VARCHAR(32),
  hire_date TIMESTAMP,
  contact_email VARCHAR(32),
  contact_phone VARCHAR(32),
  PRIMARY KEY (faculty_member_id)
);
