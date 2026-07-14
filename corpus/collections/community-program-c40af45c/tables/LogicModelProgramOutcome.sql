CREATE TABLE LogicModelProgramOutcome (
  modelId INTEGER NOT NULL,
  outcomeId INTEGER NOT NULL,
  PRIMARY KEY (modelId, outcomeId),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id),
  FOREIGN KEY (outcomeId) REFERENCES ProgramOutcome (id)
);
