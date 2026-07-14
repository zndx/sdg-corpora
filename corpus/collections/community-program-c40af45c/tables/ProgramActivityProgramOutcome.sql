CREATE TABLE ProgramActivityProgramOutcome (
  activityId INTEGER NOT NULL,
  outcomeId INTEGER NOT NULL,
  PRIMARY KEY (activityId, outcomeId),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id)
);
