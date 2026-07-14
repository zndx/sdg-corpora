CREATE TABLE facilities (
  id INTEGER NOT NULL,
  facility_id VARCHAR(35),
  name VARCHAR(32),
  type VARCHAR(32),
  location VARCHAR(32),
  session_id VARCHAR(44),
  created_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (session_id) REFERENCES dialysis_sessions (session_id)
);
