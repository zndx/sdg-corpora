CREATE TABLE CausalAssumptionProgramActivity (
  assumptionId INTEGER NOT NULL,
  activityId INTEGER NOT NULL,
  PRIMARY KEY (assumptionId, activityId),
  FOREIGN KEY (assumptionId) REFERENCES CausalAssumption (assumptionId),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId)
);
