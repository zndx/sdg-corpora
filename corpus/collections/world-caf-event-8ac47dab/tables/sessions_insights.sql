CREATE TABLE sessions_insights (
  discussion_session_id INTEGER NOT NULL,
  prevention_insight_id INTEGER NOT NULL,
  PRIMARY KEY (discussion_session_id, prevention_insight_id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id),
  FOREIGN KEY (prevention_insight_id) REFERENCES prevention_insights (id)
);
