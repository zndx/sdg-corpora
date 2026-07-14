CREATE TABLE CommunityProgramCommunityNeed (
  programId INTEGER NOT NULL,
  needId INTEGER NOT NULL,
  PRIMARY KEY (programId, needId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id),
  FOREIGN KEY (needId) REFERENCES CommunityNeed (needId)
);
