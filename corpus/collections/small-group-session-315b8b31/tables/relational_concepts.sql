CREATE TABLE relational_concepts (
  concept_id INTEGER NOT NULL,
  concept_name VARCHAR(32),
  concept_category VARCHAR(32),
  description VARCHAR(32),
  scripture_reference VARCHAR(32),
  small_group_session_id INTEGER,
  PRIMARY KEY (concept_id),
  FOREIGN KEY (small_group_session_id) REFERENCES small_group_sessions (small_group_session_id)
);
