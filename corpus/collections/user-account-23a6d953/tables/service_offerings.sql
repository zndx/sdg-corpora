CREATE TABLE service_offerings (
  id INTEGER NOT NULL,
  service_id VARCHAR(44),
  service_name VARCHAR(32),
  service_type VARCHAR(32),
  is_current BOOLEAN,
  is_potential BOOLEAN,
  survey_response_id INTEGER,
  session_id VARCHAR(44),
  PRIMARY KEY (id),
  FOREIGN KEY (survey_response_id) REFERENCES survey_responses (id),
  FOREIGN KEY (session_id) REFERENCES web_sessions (session_id)
);
