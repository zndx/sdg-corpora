CREATE TABLE sessions_participants (
  discussion_session_id INTEGER NOT NULL,
  field_participant_id INTEGER NOT NULL,
  PRIMARY KEY (discussion_session_id, field_participant_id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id)
);
