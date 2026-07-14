CREATE TABLE sessions_participants (
  workshop_session_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (workshop_session_id, participant_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
