CREATE TABLE instructional_sessions (
  id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  status VARCHAR(32),
  classroom_id INTEGER,
  faculty_member_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id)
);
