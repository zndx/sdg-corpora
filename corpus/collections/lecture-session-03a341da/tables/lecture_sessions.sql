CREATE TABLE lecture_sessions (
  id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  scheduled_date DATE,
  duration_minutes INTEGER,
  topic VARCHAR(32),
  status VARCHAR(32),
  PRIMARY KEY (id)
);
