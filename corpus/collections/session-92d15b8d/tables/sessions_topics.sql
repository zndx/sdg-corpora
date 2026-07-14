CREATE TABLE sessions_topics (
  session_id INTEGER NOT NULL,
  academic_topic_id INTEGER NOT NULL,
  PRIMARY KEY (session_id, academic_topic_id),
  FOREIGN KEY (session_id) REFERENCES sessions (session_id),
  FOREIGN KEY (academic_topic_id) REFERENCES academic_topics (academic_topic_id)
);
