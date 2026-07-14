CREATE TABLE meteorologists (
  meteorologist_id INTEGER NOT NULL,
  meteorologist_identifier VARCHAR(32),
  full_name VARCHAR(36),
  specialization VARCHAR(32),
  affiliation VARCHAR(32),
  webinar_session_id INTEGER,
  PRIMARY KEY (meteorologist_id),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id)
);
