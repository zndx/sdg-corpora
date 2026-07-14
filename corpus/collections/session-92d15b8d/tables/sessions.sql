CREATE TABLE sessions (
  session_id INTEGER NOT NULL,
  session_identifier VARCHAR(32),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  title VARCHAR(32),
  status VARCHAR(32),
  program_day_id INTEGER,
  PRIMARY KEY (session_id),
  FOREIGN KEY (program_day_id) REFERENCES program_days (program_day_id)
);
