CREATE TABLE topics_sessions (
  academic_topic_id INTEGER NOT NULL,
  session_id INTEGER NOT NULL,
  PRIMARY KEY (academic_topic_id, session_id),
  FOREIGN KEY (academic_topic_id) REFERENCES academic_topics (academic_topic_id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);
