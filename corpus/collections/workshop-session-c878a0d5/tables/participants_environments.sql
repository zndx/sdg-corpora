CREATE TABLE participants_environments (
  participant_id INTEGER NOT NULL,
  environment_id INTEGER NOT NULL,
  PRIMARY KEY (participant_id, environment_id),
  FOREIGN KEY (participant_id) REFERENCES participants (participant_id),
  FOREIGN KEY (environment_id) REFERENCES learning_environments (environment_id)
);
