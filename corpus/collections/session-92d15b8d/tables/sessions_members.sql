CREATE TABLE sessions_members (
  session_id INTEGER NOT NULL,
  faculty_member_id INTEGER NOT NULL,
  PRIMARY KEY (session_id, faculty_member_id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id)
);
