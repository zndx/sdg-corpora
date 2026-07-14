CREATE TABLE video_recordings (
  id INTEGER NOT NULL,
  recording_identifier VARCHAR(32),
  hosting_platform VARCHAR(32),
  access_url VARCHAR(52),
  publish_date DATE,
  duration_seconds INTEGER,
  webinar_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id)
);
