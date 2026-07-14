CREATE TABLE residents_sessions (
  resident_id INTEGER NOT NULL,
  session_id INTEGER NOT NULL,
  PRIMARY KEY (resident_id, session_id),
  FOREIGN KEY (resident_id) REFERENCES residents (id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);
