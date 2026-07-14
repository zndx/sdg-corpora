CREATE TABLE ProgramOutcomeCommunityNeed (
  outcomeId INTEGER NOT NULL,
  needId INTEGER NOT NULL,
  PRIMARY KEY (outcomeId, needId),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id),
  FOREIGN KEY (needId) REFERENCES CommunityNeed (needId)
);
