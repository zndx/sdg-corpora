CREATE TABLE participants_activities (
  participant_id INTEGER NOT NULL,
  practice_activity_id INTEGER NOT NULL,
  PRIMARY KEY (participant_id, practice_activity_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id),
  FOREIGN KEY (practice_activity_id) REFERENCES practice_activities (practice_activity_id)
);
