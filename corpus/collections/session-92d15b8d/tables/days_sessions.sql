CREATE TABLE days_sessions (
  program_day_id INTEGER NOT NULL,
  session_id INTEGER NOT NULL,
  PRIMARY KEY (program_day_id, session_id),
  FOREIGN KEY (program_day_id) REFERENCES program_days (program_day_id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);
