CREATE TABLE participants_sessions (
  field_participant_id INTEGER NOT NULL,
  discussion_session_id INTEGER NOT NULL,
  PRIMARY KEY (field_participant_id, discussion_session_id),
  FOREIGN KEY (field_participant_id) REFERENCES field_participants (id),
  FOREIGN KEY (discussion_session_id) REFERENCES discussion_sessions (id)
);
