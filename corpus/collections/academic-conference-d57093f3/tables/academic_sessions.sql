CREATE TABLE academic_sessions (
  id INTEGER NOT NULL,
  session_title VARCHAR(32),
  session_type VARCHAR(32),
  scheduled_date TIMESTAMP,
  venue_room VARCHAR(32),
  status VARCHAR(32),
  academic_conference_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (academic_conference_id) REFERENCES academic_conferences (id)
);
