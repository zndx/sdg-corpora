CREATE TABLE LogicModelProgramInput (
  modelId INTEGER NOT NULL,
  inputId INTEGER NOT NULL,
  PRIMARY KEY (modelId, inputId),
  FOREIGN KEY (modelId) REFERENCES LogicModel (id),
  FOREIGN KEY (inputId) REFERENCES ProgramInput (id)
);
