CREATE TABLE ProgramInputProgramActivity (
  inputId INTEGER NOT NULL,
  activityId INTEGER NOT NULL,
  PRIMARY KEY (inputId, activityId),
  FOREIGN KEY (inputId) REFERENCES ProgramInput (id),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId)
);
