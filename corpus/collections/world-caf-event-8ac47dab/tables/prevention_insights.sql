CREATE TABLE prevention_insights (
  id INTEGER NOT NULL,
  insight_identifier VARCHAR(32),
  content VARCHAR(32),
  source_session VARCHAR(32),
  theme VARCHAR(32),
  quality_rating VARCHAR(32),
  is_recurring BOOLEAN,
  is_new_element BOOLEAN,
  discussion_session_id INTEGER,
  burglary_prevention_topic_id INTEGER,
  project_report_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id),
  FOREIGN KEY (burglary_prevention_topic_id) REFERENCES burglary_prevention_topics (id),
  FOREIGN KEY (project_report_id) REFERENCES project_reports (project_report_id)
);
