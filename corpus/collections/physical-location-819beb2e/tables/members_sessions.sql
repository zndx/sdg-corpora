CREATE TABLE members_sessions (
  faculty_member_id INTEGER NOT NULL,
  instructional_session_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, instructional_session_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (id),
  FOREIGN KEY (instructional_session_id) REFERENCES instructional_sessions (id)
);
