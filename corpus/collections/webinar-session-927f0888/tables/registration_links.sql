CREATE TABLE registration_links (
  id INTEGER NOT NULL,
  link_identifier VARCHAR(61),
  url VARCHAR(56),
  expiration_date TIMESTAMP,
  webinar_session_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (webinar_session_id) REFERENCES webinar_sessions (webinar_session_id)
);
