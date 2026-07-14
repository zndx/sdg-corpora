CREATE TABLE discussion_questions (
  id INTEGER NOT NULL,
  question_id VARCHAR(44),
  question_text VARCHAR(32),
  question_number INTEGER,
  requires_personal_reflection BOOLEAN,
  references_scripture BOOLEAN,
  small_group_session_id INTEGER,
  concept_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (small_group_session_id) REFERENCES small_group_sessions (small_group_session_id),
  FOREIGN KEY (concept_id) REFERENCES relational_concepts (concept_id)
);
