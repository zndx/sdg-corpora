CREATE TABLE student_surveys (
  id INTEGER NOT NULL,
  survey_id VARCHAR(44),
  collection_date TIMESTAMP,
  feedback_category VARCHAR(32),
  satisfaction_score INTEGER,
  comments VARCHAR(32),
  student_id INTEGER,
  faculty_member_id INTEGER,
  instructional_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (student_id) REFERENCES students (student_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (instructional_session_id) REFERENCES instructional_sessions (id)
);
