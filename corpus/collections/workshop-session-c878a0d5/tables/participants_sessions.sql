CREATE TABLE participants_sessions (
  participant_id INTEGER NOT NULL,
  workshop_session_id INTEGER NOT NULL,
  PRIMARY KEY (participant_id, workshop_session_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (workshop_session_id)
);
