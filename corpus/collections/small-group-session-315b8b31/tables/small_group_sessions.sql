CREATE TABLE small_group_sessions (
  small_group_session_id INTEGER NOT NULL,
  session_id VARCHAR(44),
  session_date TIMESTAMP,
  facilitator_name VARCHAR(32),
  topic_theme VARCHAR(32),
  discussion_format VARCHAR(32),
  attendance_count INTEGER,
  concept_id INTEGER,
  PRIMARY KEY (small_group_session_id),
  FOREIGN KEY (concept_id) REFERENCES relational_concepts (concept_id)
);
