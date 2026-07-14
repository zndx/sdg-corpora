CREATE TABLE activities_participants (
  practice_activity_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (practice_activity_id, participant_id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
