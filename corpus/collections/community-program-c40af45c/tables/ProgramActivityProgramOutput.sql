CREATE TABLE ProgramActivityProgramOutput (
  activityId INTEGER NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (activityId, outputId),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId),
  FOREIGN KEY (outputId) REFERENCES ProgramOutput (id)
);
