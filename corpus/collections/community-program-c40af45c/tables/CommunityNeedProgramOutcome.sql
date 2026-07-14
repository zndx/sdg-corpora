CREATE TABLE CommunityNeedProgramOutcome (
  needId INTEGER NOT NULL,
  outcomeId INTEGER NOT NULL,
  PRIMARY KEY (needId, outcomeId),
  FOREIGN KEY (needId) REFERENCES CommunityNeed (needId),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id)
);
