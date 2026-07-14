CREATE TABLE TeamAssessment (
  id INTEGER NOT NULL,
  assessmentId VARCHAR(42),
  assessmentType VARCHAR(32),
  dateConducted TIMESTAMP,
  durationMinutes INTEGER,
  modelUsed VARCHAR(32),
  resultStatus VARCHAR(32),
  teamId VARCHAR(32),
  executiveId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (teamId) REFERENCES LeadershipTeam (teamId),
  FOREIGN KEY (executiveId) REFERENCES Executive (executiveId)
);
