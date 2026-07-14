CREATE TABLE LogicModelProgramActivity (
  modelId INTEGER NOT NULL,
  activityId INTEGER NOT NULL,
  PRIMARY KEY (modelId, activityId),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id),
  FOREIGN KEY (activityId) REFERENCES ProgramActivity (activityId)
);
