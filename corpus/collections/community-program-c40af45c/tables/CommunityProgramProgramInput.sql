CREATE TABLE CommunityProgramProgramInput (
  programId INTEGER NOT NULL,
  inputId INTEGER NOT NULL,
  PRIMARY KEY (programId, inputId),
  FOREIGN KEY (programId) REFERENCES CommunityProgram (id),
  FOREIGN KEY (inputId) REFERENCES ProgramInput (id)
);
