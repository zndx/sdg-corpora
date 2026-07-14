CREATE TABLE moderators_sessions (
  field_moderator_id INTEGER NOT NULL,
  discussion_session_id INTEGER NOT NULL,
  PRIMARY KEY (field_moderator_id, discussion_session_id),
  FOREIGN KEY (field_moderator_id) REFERENCES field_moderators (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id)
);
