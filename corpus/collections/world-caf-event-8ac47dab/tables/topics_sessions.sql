CREATE TABLE topics_sessions (
  burglary_prevention_topic_id INTEGER NOT NULL,
  discussion_session_id INTEGER NOT NULL,
  PRIMARY KEY (burglary_prevention_topic_id, discussion_session_id),
  FOREIGN KEY (burglary_prevention_topic_id) REFERENCES burglary_prevention_topics (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id)
);
