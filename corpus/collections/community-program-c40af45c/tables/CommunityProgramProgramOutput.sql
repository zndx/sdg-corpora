CREATE TABLE CommunityProgramProgramOutput (
  programId INTEGER NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (programId, outputId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id),
  FOREIGN KEY (outputId) REFERENCES ProgramOutput (id)
);
