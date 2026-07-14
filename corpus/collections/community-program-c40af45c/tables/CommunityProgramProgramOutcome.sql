CREATE TABLE CommunityProgramProgramOutcome (
  programId INTEGER NOT NULL,
  outcomeId INTEGER NOT NULL,
  PRIMARY KEY (programId, outcomeId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id)
);
