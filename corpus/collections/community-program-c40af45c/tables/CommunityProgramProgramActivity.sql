CREATE TABLE CommunityProgramProgramActivity (
  programId INTEGER NOT NULL,
  activityId INTEGER NOT NULL,
  PRIMARY KEY (programId, activityId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId)
);
