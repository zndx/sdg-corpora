CREATE TABLE members_sessions (
  faculty_member_id INTEGER NOT NULL,
  session_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, session_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);
