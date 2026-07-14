CREATE TABLE LogicModelProgramOutput (
  modelId INTEGER NOT NULL,
  outputId INTEGER NOT NULL,
  PRIMARY KEY (modelId, outputId),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id),
  FOREIGN KEY (outputId) REFERENCES ProgramOutput (id)
);
