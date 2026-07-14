CREATE TABLE ProgramActivityProgramInput (
  activityId INTEGER NOT NULL,
  inputId INTEGER NOT NULL,
  PRIMARY KEY (activityId, inputId),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId),
  FOREIGN KEY (inputId) REFERENCES ProgramInput (id)
);
