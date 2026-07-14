CREATE TABLE environments_participants (
  environment_id INTEGER NOT NULL,
  participant_id INTEGER NOT NULL,
  PRIMARY KEY (environment_id, participant_id),
  FOREIGN KEY (environment_id) REFERENCES learning_environments (environment_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id)
);
