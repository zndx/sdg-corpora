CREATE TABLE activities_sessions (
  practice_activity_id INTEGER NOT NULL,
  workshop_session_id INTEGER NOT NULL,
  PRIMARY KEY (practice_activity_id, workshop_session_id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id),
  FOREIGN KEY (workshop_session_id) REFERENCES workshop_sessions (workshop_session_id)
);
