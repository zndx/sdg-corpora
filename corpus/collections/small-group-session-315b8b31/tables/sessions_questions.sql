CREATE TABLE sessions_questions (
  small_group_session_id INTEGER NOT NULL,
  discussion_question_id INTEGER NOT NULL,
  PRIMARY KEY (small_group_session_id, discussion_question_id),
  FOREIGN KEY (small_group_session_id) REFERENCES small_group_sessions (small_group_session_id),
  FOREIGN KEY (discussion_question_id) REFERENCES discussion_questions (id)
);
