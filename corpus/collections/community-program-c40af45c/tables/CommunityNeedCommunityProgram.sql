CREATE TABLE CommunityNeedCommunityProgram (
  needId INTEGER NOT NULL,
  programId INTEGER NOT NULL,
  PRIMARY KEY (needId, programId),
  FOREIGN KEY (needId) REFERENCES CommunityNeed (needId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id)
);
